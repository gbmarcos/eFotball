import 'package:async_data_bloc/async_data_bloc.dart';
import 'package:collection/collection.dart';
import 'package:fifa/src/common/domain/user/user.dart';

import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/common/utils.dart';
import 'package:fifa/src/features/match/match_repository.dart';
import 'package:fifa/src/features/match/model/match.dart';
import 'package:fifa/src/features/play_match/match/check_in_repository.dart';
import 'package:fifa/src/features/play_match/match_bloc/match_lobby_bloc.dart';
import 'package:fifa/src/features/streams/model/stream.dart';

import 'package:fifa/src/features/streams/stream_repository.dart';
import 'package:fifa/src/features/tournaments/model/tournament.dart';
import 'package:fifa/src/features/tournaments/tournament_details/models/bracket.dart';
import 'package:fifa/src/features/tournaments/tournament_details/models/participant.dart';
import 'package:fifa/src/features/tournaments/tournament_details/models/tournament.dart';
import 'package:fifa/src/features/tournaments/tournament_repository.dart';

import 'package:fpdart/fpdart.dart';

class TournamentPageCubit {
  final TournamentRepository _tournamentRepository;
  final StreamRepository _streamRepository;
  final MatchRepository _matchRepository;
  final CheckInRepository _checkInRepository;
  final MatchLobbyBloc _matchLobbyBloc;
  final int tournamentId;
  final User currentUser;

  late final AsyncCubit<TournamentEntry> tournamentEntry;
  late final AsyncCubit<List<Participant>> tournamentParticipants;
  late final AsyncCubit<List<TournamentBracket>> tournamentBrackets;
  late final AsyncCubit<List<Match>> tournamentMatches;
  late final AsyncCubit<SignupStatus> tournamentSignUpStatus;
  late final AsyncCubit<List<Stream>> streams;

  TournamentPageCubit({
    required this.tournamentId,
    required this.currentUser,
    required TournamentRepository tournamentRepository,
    required StreamRepository streamRepository,
    required MatchRepository matchRepository,
    required CheckInRepository checkInRepository,
    required MatchLobbyBloc matchLobbyBloc,
  })  : _tournamentRepository = tournamentRepository,
        _matchRepository = matchRepository,
        _streamRepository = streamRepository,
        _matchLobbyBloc = matchLobbyBloc,
        _checkInRepository = checkInRepository {
    streams = AsyncCubit(
      () => _streamRepository
          .listLiveStreams(
            tournamentId: tournamentId,
            limit: 20,
          )
          .then(getOrThrow),
    );

    tournamentEntry = AsyncCubit(
      () => _tournamentRepository
          .getTournament(
            id: tournamentId,
          )
          .then(getOrThrow),
    );

    tournamentMatches = AsyncCubit(
      () => _matchRepository
          .listMatches(
            tournamentId: tournamentId,
          )
          .then(getOrThrow),
    );

    tournamentParticipants = AsyncCubit(
      () => _tournamentRepository
          .getTournamentParticipants(
            tournamentId: tournamentId,
          )
          .then(getOrThrow),
    );

    tournamentBrackets = AsyncCubit(
      () => _tournamentRepository
          .getTournamentBrackets(
            tournamentId: tournamentId,
          )
          .then(getOrThrow),
    );

    tournamentSignUpStatus = AsyncCubit(
      () => _checkInRepository
          .tournamentStatus(
            tournamentId: tournamentId,
          )
          .then(getOrThrow),
      refreshPolicy: RefreshPolicy.noLoading,
    );
  }

  AsyncCubit<List<Team>> getTeams(int leagueId) => AsyncCubit(
        () => _tournamentRepository
            .listLeagueTeams(
              leagueId: leagueId,
            )
            .then(getOrThrow),
      );

  Future<Either<NetworkException, void>> tournamentSignUp({int? teamId}) => _tournamentRepository.tournamentSignUp(
        tournamentId: tournamentId,
        teamId: teamId,
      );

  Future<Either<NetworkException, void>> tournamentSignUpCancel() => _tournamentRepository.tournamentSignUpCancel(
        tournamentId: tournamentId,
      );

  Future goToMatchmaking({
    required Future<bool> Function() askBeforeToRestoreMatchState,
  }) async {
    final response = await _checkInRepository.getExtendedUserData();

    final newEvent = await response.fold(
      //if there was any error go to matchmaking page
      (error) async => MatchLobbyEvent.matchmaking(
        tournamentId: tournamentId,
      ),
      (extendedUserData) async {
        //if there is a pending match ask before to restore the state

        final pendingMatch = extendedUserData.activeMatches?.firstWhereOrNull(
          (match) => match.tournamentId != tournamentId,
        );

        if (pendingMatch != null && await askBeforeToRestoreMatchState()) {
          return MatchLobbyEvent.restoreState(
            user: currentUser,
            activeMatch: pendingMatch,
          );
        }

        //if there is the expected match restore the state

        final expectedMatch = extendedUserData.activeMatches?.firstWhereOrNull(
          (match) => match.tournamentId == tournamentId,
        );

        if (expectedMatch != null) {
          return MatchLobbyEvent.restoreState(
            user: currentUser,
            activeMatch: expectedMatch,
          );
        }

        //if there are not active matches go to matchmaking page
        if (extendedUserData.activeMatches?.isEmpty ?? true) {
          return MatchLobbyEvent.matchmaking(
            tournamentId: tournamentId,
          );
        }
      },
    );

    if (newEvent != null) {
      _matchLobbyBloc.add(newEvent);
    }
  }
}
