import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fifa/src/common/domain/match/match.dart';

import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/common/utils.dart';
import 'package:fifa/src/features/match/match_repository.dart';
import 'package:fifa/src/features/match/model/match.dart';
import 'package:fifa/src/features/play_match/lobby/match_lobby_cubit.dart';
import 'package:fifa/src/features/play_match/match/check_in_repository.dart';
import 'package:fifa/src/features/tournaments/tournament_details/models/participant.dart';
import 'package:fifa/src/features/tournaments/tournament_details/models/tournament.dart';
import 'package:fifa/src/features/tournaments/tournament_repository.dart';
import 'package:fifa/src/common/domain/user/user.dart';
import 'package:fpdart/fpdart.dart' show Either;

import 'match_lobby_event.dart';
import 'match_lobby_state.dart';

export 'match_lobby_event.dart';
export 'match_lobby_state.dart';

class MatchLobbyBloc extends Bloc<MatchLobbyEvent, MatchLobbyState> {
  final CheckInRepository _checkInRepository;
  final TournamentRepository _tournamentRepository;
  final MatchRepository _matchRepository;

  MatchLobbyBloc(this._checkInRepository, this._tournamentRepository, this._matchRepository,
      {MatchLobbyState? initialState})
      : super(initialState ?? const MatchLobbyState.initial()) {
    on<MatchLobbyEvent>((event, emit) async {
      await event.maybeWhen(
        join: (event) async => _handleJoin(event, emit),
        restoreState: (user, activeMatch, silent) async => _handleRestoreState(user, activeMatch, emit, silent: silent),
        opponentCheckedIn: (matchId, lobby, silent) async {
          if (matchId != null) {
            //then check-ins are over and you can move on to the match score entry page.

            try {
              final tournamentLobby = getOrThrow(await _checkInRepository.get(lobbyId: lobby.lobbyId));

              final matchLobbyData = await getMatchLobbyData(lobby, tournamentLobby);

              emit(
                MatchLobbyState.gameInProgress(
                  matchLobbyData: matchLobbyData,
                  lobbyParameters: lobby,
                ),
              );
            } catch (e, st) {
              log('Error changing to opponentCheckedIn', error: e, stackTrace: st);
              emit(MatchLobbyState.error(e));
            }
          } else if (!silent) {
            emit(MatchLobbyState.error(Exception('opponentCheckIn has no match ID')));
          }
        },
        submitScore: (match, score1, score2) async {
          final submitScore =
              await _checkInRepository.submitScore(matchId: match.matchInfo.id, score1: score1, score2: score2);
          return submitScore.fold((l) {
            emit(MatchLobbyState.error(l));
          }, (dynamic r) {
            emit(MatchLobbyState.awaitingConfirmation(score2: score2, score1: score1, matchLobbyData: match));
          });
        },
        acceptScore: (match, lobby) async {
          final submitScore = await _checkInRepository.confirmScore(
            matchId: lobby.matchInfo.id,
          );
          return submitScore.fold((l) {
            emit(MatchLobbyState.error(l));
          }, (dynamic r) {
            emit(MatchLobbyState.gameOver(matchLobbyData: lobby, matchScores: match));
          });
        },
        close: () {
          emit(const MatchLobbyState.initial());
        },
        goToScoreSubmissionPage: (matchLobbyData) {
          emit(MatchLobbyState.addResult(matchLobbyData: matchLobbyData));
        },
        scoreConfirmed: (lobby, match) {
          emit(MatchLobbyState.gameOver(matchLobbyData: lobby, matchScores: match));
        },
        disputeScore: (matchLobbyData) {
          state.maybeWhen(
            disputeInProgress: (matchLobbyData) {},
            orElse: () {
              emit(MatchLobbyState.disputeInProgress(matchLobbyData: matchLobbyData));
            },
          );
        },
        opponentSubmittedScore: (lobby, match) {
          emit(MatchLobbyState.confirmResult(matchLobbyData: lobby, matchScores: match));
        },
        restoreStateFromNotification: (user, tournamentId, lobbyId) async {
          print('restoring from notification');
          emit(const MatchLobbyState.joining());
          final lobby = await _checkInRepository.get(lobbyId: lobbyId);

          lobby.fold((l) => emit(MatchLobbyState.error(l)), (r) {
            if (r.matchId != null) {
              add(MatchLobbyEvent.restoreState(
                  user: user, activeMatch: ActiveMatch(tournamentId: tournamentId, matchId: r.matchId!)));
            } else {
              final lp = LobbyParameters(
                  currentUser: user, walkoverTime: r.walkoverTime, lobbyId: lobbyId, tournamentId: tournamentId);
              add(MatchLobbyEvent.join(lobbyParameters: lp));
            }
          });
        },
        matchmaking: (tournamentId) {
          emit(MatchLobbyState.awaitingMatchmaking(tournamentId: tournamentId));
        },
        orElse: () {
          log('Unsupported bloc event `${event.runtimeType}`');
        },
      );
    },);
  }

  @override
  void onEvent(event) {
    log('Received <${event.maybeMap(orElse: ()=>'_',restoreState: (r)=>r.activeMatch)}> Event $event', name: event.runtimeType.toString());
    super.onEvent(event);
  }

  Future<MatchLobbyData> getMatchLobbyData(LobbyParameters lobby, TournamentLobby tournamentLobby) async {
    print('getting user1');
    final user1 = getOrThrow(
      await _tournamentRepository.getTournamentParticipant(
        tournamentId: lobby.tournamentId,
        userId: tournamentLobby.user1.id!,
      ),
    );
    print('getting user2');

    final user2 = getOrThrow(
      await _tournamentRepository.getTournamentParticipant(
        tournamentId: lobby.tournamentId,
        userId: tournamentLobby.user2.id!,
      ),
    );
    print('getting match');

    final matchInfo = getOrThrow(
      await _matchRepository.get(matchId: tournamentLobby.matchId!),
    );

    final matchLobbyData = MatchLobbyData(
      matchInfo: matchInfo,
      user1: user1,
      user2: user2,
    );
    return matchLobbyData;
  }

  void _handleJoin(LobbyParameters event, Emitter<MatchLobbyState> emit) async {
    print('joining');
    try {
      final tournamentLobby = getOrThrow(await _checkInRepository.get(
        lobbyId: event.lobbyId,
      ));
      log('join to lobby $tournamentLobby');
      final bothUsersAreCheckedIn = tournamentLobby.user1CheckIn != null && tournamentLobby.user2CheckIn != null;
      if (bothUsersAreCheckedIn) {
        final matchLobbyData = await getMatchLobbyData(event, tournamentLobby);
        log('matchlobbydata $matchLobbyData');
        emit(
          MatchLobbyState.gameInProgress(
            matchLobbyData: matchLobbyData,
            lobbyParameters: event,
          ),
        );
        print('Game in progress');
      } else {
        print('waitingForOpponentToJoin');
        emit(MatchLobbyState.waitingForOpponentToJoin(lobbyParameters: event));
      }
    } catch (e, st) {
      log('Error joining match', error: e, stackTrace: st);
      print('error $e,$st');
      emit(MatchLobbyState.error(e));
    }
  }

  void _handleRestoreState(
    User user,
    ActiveMatch activeMatch,
    Emitter<MatchLobbyState> emit, {
    bool silent = false,
  }) async {
    try {
      late MatchLobbyState newState;
      final oldState = state;
      final lastStateLevel = oldState.quantificationLevel;
      if (!silent) {
        emit(const MatchLobbyState.joining());
      }
      final restoreData = await Future.wait([
        _matchRepository.get(matchId: activeMatch.matchId),
        _tournamentRepository.getTournamentParticipant(tournamentId: activeMatch.tournamentId, userId: user.id),
      ]);
      final match = getOrThrow(restoreData[0] as Either<NetworkException, MatchCheckInInfo>);
      late final TournamentParticipant participant;
      late final TournamentParticipant opponent;

      if (user.id != match.user1.id && user.id != match.user2.id) {
        participant = getOrThrow(await _tournamentRepository.getTournamentParticipant(
            tournamentId: activeMatch.tournamentId, userId: match.user1.id!));
        opponent = getOrThrow(await _tournamentRepository.getTournamentParticipant(
            userId: match.user2.id!, tournamentId: activeMatch.tournamentId));
      } else {
        participant = getOrThrow(restoreData[1] as Either<NetworkException, TournamentParticipant>);
        final opponentId = match.user1.id == user.id ? match.user2.id! : match.user1.id!;
        opponent = getOrThrow(await _tournamentRepository.getTournamentParticipant(
            userId: opponentId, tournamentId: activeMatch.tournamentId));
      }

      final matchStatus = match.scoreState(user.id);
      final matchLobbyData = MatchLobbyData(matchInfo: match, user1: participant, user2: opponent);
      switch (matchStatus) {
        case ScoreStates.start:
        case ScoreStates.submit:
          newState = MatchLobbyState.addResult(matchLobbyData: matchLobbyData);
          break;

        case ScoreStates.submitted:
          int? _getScoreByUserId(int id) {
            if (match.user1Id == id) {
              return match.user1Score;
            } else if (match.user2Id == id) {
              return match.user2Score;
            }
          }

          final user1Score = _getScoreByUserId(matchLobbyData.user1.id);
          final user2Score = _getScoreByUserId(matchLobbyData.user2.id);
          newState = MatchLobbyState.awaitingConfirmation(
            matchLobbyData: matchLobbyData,
            score1: user1Score!,
            score2: user2Score!,
          );
          break;
        case ScoreStates.confirm:
          newState = MatchLobbyState.confirmResult(
            matchLobbyData: matchLobbyData,
            matchScores: match,
          );
          break;
        case ScoreStates.conflicted:
          newState = MatchLobbyState.disputeInProgress(
            matchLobbyData: matchLobbyData,
          );
          break;
        case ScoreStates.verified:
          newState = MatchLobbyState.gameOver(
            matchLobbyData: matchLobbyData,
            matchScores: match,
          );
          break;
      }
      final isDifferentMatch = oldState.matchLobbyData != null &&
          newState.matchLobbyData?.matchInfo.id != oldState.matchLobbyData?.matchInfo.id;
      final isNewQuantificationLevelHigher = lastStateLevel < newState.quantificationLevel;
      final isSameState = lastStateLevel == newState.quantificationLevel;

      if (isDifferentMatch) {
        emit(newState);
        return;
      }
      // If the restoration is supposed to be silent do not yield new states for the same quantificationLevel
      if (silent && isSameState) {
        return;
      }
      // If the step is older than the current one , emit a new state
      if (isNewQuantificationLevelHigher) {
        emit(newState);
      }
    } catch (e, st) {
      if (!silent) {
        emit(MatchLobbyState.error(e));
      }
      log('error restoring state', error: e, stackTrace: st);
      print('error restoring state $e ,$st');
    }
  }
}
