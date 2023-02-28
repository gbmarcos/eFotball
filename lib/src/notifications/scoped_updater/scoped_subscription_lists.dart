import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:fifa/src/app/dependency_injection.dart';
import 'package:fifa/src/authentication/bloc/authentication_bloc.dart';
import 'package:fifa/src/common/domain/match/match.dart';

import 'package:fifa/src/common/domain/user/user.dart';
import 'package:fifa/src/common/environment.dart';
import 'package:fifa/src/common/services/dialog_cubit/dialog_cubit.dart';
import 'package:fifa/src/features/match/active_match_bloc/active_match_bloc.dart';
import 'package:fifa/src/features/match/model/match.dart';
import 'package:fifa/src/features/play_match/lobby/match_lobby_cubit.dart';
import 'package:fifa/src/features/play_match/match/check_in_repository.dart';
import 'package:fifa/src/features/play_match/match_bloc/match_lobby_bloc.dart';
import 'package:fifa/src/notifications/data/notification.dart' as data;
import 'package:fifa/src/notifications/data/notification.dart';
import 'package:fifa/src/notifications/data/notification_events.dart';
import 'package:fifa/src/notifications/notification_cubit/notification_cubit.dart';
import 'package:fifa/src/notifications/scoped_updater/scoped_subscription.dart';

/// Different scopes

ScopedSubscription lobbyScopedSubscription({required LobbyParameters lobbyParameters}) {
  return ScopedSubscription(
    client: getIt(),
    channelName: NotificationChannelsFacade.lobby('${lobbyParameters.lobbyId}').channelName,
    onConnectionError: () => lobbyStateUpdate(lobbyParameters),
    topicCallbacks: {
      'check-in': (event) {
        final notification = CheckInNotificationEvent.fromJson(jsonDecode(event!.data!) as Map<String, dynamic>);
        getIt<MatchLobbyBloc>().add(
          MatchLobbyEvent.opponentCheckedIn(
            matchId: notification.matchId,
            lobbyParameters: lobbyParameters,
          ),
        );
      }
    },
  );
}

ScopedSubscription tournamentScopedSubscription(
    {required int tournamentId, int? matchId, int? lobbyId, required bool isCollection}) {
  assert(lobbyId != null || matchId != null, 'Either lobbyId or matchId must not be null ');

  return ScopedSubscription(
    client: getIt(),
    channelName: !isCollection
        ? NotificationChannelsFacade.tournament('$tournamentId').channelName
        : NotificationChannelsFacade.tournamentCollection('$tournamentId').channelName,
    topicCallbacks: {
      'results-update': (event) {
        if (event?.data != null) {
          final matchLobbyBloc = getIt<MatchLobbyBloc>();
          if (matchId != null) {
            matchLobbyBloc.add(
              MatchLobbyEvent.restoreState(
                user: getIt<AuthenticationBloc>().state.user!,
                activeMatch: ActiveMatch(tournamentId: tournamentId, matchId: matchId),
              ),
            );
          } else if (lobbyId != null) {
            matchLobbyBloc.add(
              MatchLobbyEvent.restoreStateFromNotification(
                  user: getIt<AuthenticationBloc>().state.user!, tournamentId: tournamentId, lobbyId: lobbyId),
            );
          }
        }
      }
    },
  );
}

ScopedSubscription privateMatchScopedSubscription(
        {required MatchLobbyData matchLobbyData, required User user, required MatchLobbyBloc bloc}) =>
    ScopedSubscription(
      client: getIt(),
      channelName: NotificationChannelsFacade.privateMatch('${matchLobbyData.matchInfo.id}').channelName,
      onConnectionError: () => bloc.add(MatchLobbyEvent.restoreState(
        user: user,
        silent: true,
        activeMatch:
            ActiveMatch(matchId: matchLobbyData.matchInfo.id, tournamentId: matchLobbyData.matchInfo.tournamentId),
      )),
      topicCallbacks: {
        'match-scores-submit': (event) {
          if (event?.data != null) {
            //When scores are submitted by an user.
            try {
              final matchScores = MatchMakingMatch.fromJson(jsonDecode(event!.data!) as Map<String, dynamic>);
              if (matchScores.submittedUserId != user.id) {
                bloc.add(MatchLobbyEvent.opponentSubmittedScore(match: matchScores, matchLobbyData: matchLobbyData));
              }
              if (matchScores.submittedUserId == user.id) {
                bloc.emit(MatchLobbyState.awaitingConfirmation(
                    matchLobbyData: matchLobbyData, score1: matchScores.user1Score!, score2: matchScores.user2Score!));
              }
            } catch (e, st) {
              log('error decoding ${event?.eventName} [${event?.data}]');
              bloc.addError(e, st);
            }
          }
        },
        'match-scores-confirm': (event) {
          if (event?.data != null) {
            //1) you're the user who submitted the scores, and the other user confirms it or
            //2) the scores were disputed and an admin submitted the correct scores.
            try {
              final matchScores = MatchMakingMatch.fromJson(jsonDecode(event!.data!) as Map<String, dynamic>);
              getIt<ActiveMatchBloc>().add(RemoveMatch(matchScores.id));
              bloc.add(MatchLobbyEvent.scoreConfirmed(
                match: matchScores,
                matchLobbyData: matchLobbyData,
              ));
            } catch (e, st) {
              log('error decoding ${event?.eventName} [${event?.data}]');
              bloc.addError(e, st);
            }
          }
        },
        'match-scores-conflict': (event) {
          if (event?.data != null) {
            //When you're the user who submitted the scores and the other user disputes them.
            try {
              // final matchScores = MatchMakingMatch.fromJson(jsonDecode(event!.data!) as Map<String, dynamic>);
              bloc.add(MatchLobbyEvent.disputeScore(matchLobbyData: matchLobbyData));
            } catch (e, st) {
              log('error decoding ${event?.eventName} [${event?.data}]');
              bloc.addError(e, st);
            }
          }
        }
      },
    );

ScopedSubscription privateUserScopedSubscription(int userId) => ScopedSubscription(
      client: getIt(),
      channelName: 'private-user-$userId',
      onConnectionError: updateUserState,
      topicCallbacks: {
        'notification': (event) async {
          if (event?.data != null) {
            final notification = data.Notification.fromJson(jsonDecode(event!.data!) as Map<String, dynamic>);

            getIt<NotificationCubit>().addNotification(notification);
            switch (notification.type) {
              case data.NotificationType.friendRequestAccepted:
                break;
              case data.NotificationType.friendStartedStreaming:
                break;
              case data.NotificationType.tournamentJoinRequestAccepted:
                // TODO: Handle this case.
                break;
              case data.NotificationType.tournamentJoinRequestDeclined:
                // TODO: Handle this case.
                break;
              case data.NotificationType.tournamentLobbyCreated:
                {
                  final _lobbyCheckIn = LobbyCheckIn.fromJson(notification.data as Map<String, dynamic>);
                  unawaited(lobbyCheckIn(_lobbyCheckIn));
                }
                break;
              case data.NotificationType.tournamentMatchScoresSubmitted:
                // TODO: Handle this case.
                break;
              case data.NotificationType.orgJoinRequestAccepted:
                // TODO: Handle this case.
                break;
              case data.NotificationType.orgJoinRequestDenied:
                // TODO: Handle this case.
                break;
              case data.NotificationType.tournamentMatchConflict:
                // TODO: Handle this case.
                break;
            }
          }
        },
        'end-match': (event) async {
          if (event?.data != null) {
            try {
              final endedMatchId = int.tryParse(event?.data ?? '');
// Only delete subscription if the a match is not started or it has already ended.
// If a match is removed while the user is in the `MatchLobbyBloc` pages, it will be un-subscribed from
// notifications and hence its results won't update. This happens due to a race condition in which the
// "end-match" notification is received before the ones inside the "private-match-$id" channel.
// When the game is over `matchLobbyStateListener` will call `RemoveMatch"
              if (endedMatchId != null) {
                getIt<MatchLobbyBloc>().state.maybeMap(
                      gameOver: (_) {
                        getIt<ActiveMatchBloc>().add(RemoveMatch(endedMatchId));
                      },
                      initial: (_) {
                        getIt<ActiveMatchBloc>().add(RemoveMatch(endedMatchId));
                      },
                      orElse: () {},
                    );
              }
            } catch (e, st) {
              log('Error parsing id of end-match', error: e, stackTrace: st);
            }
          }
        },
        'walkover-reversed': (event) async {
          if (event?.data != null) {
            final lobbyIdReversed = int.tryParse(event?.data ?? '');
            final lobby = await getIt<CheckInRepository>().checkInLobby();
            lobby.fold((l) => null, (r) {
              if (r != null && r.id == lobbyIdReversed) {
                unawaited(lobbyCheckIn(r));
              }
            });
          }
        },
        'new-match': (event) async {
          if (event?.data != null) {
            try {
              final newMatch = ActiveMatch.fromJson(jsonDecode(event!.data!) as Map<String, dynamic>);
              getIt<ActiveMatchBloc>().add(AddMatch(newMatch));
            } catch (e, st) {
              log('Error parsing id of new-match', error: e, stackTrace: st);
            }
          }
        }
      },
    );

//////////////////////// Different functions used to restore state.
// TODO(croxx5f): better orgnization. The functions below could probably be refactored to existing cubits/blocs.
///Restores the state of the Notifications, Active matches and MatchLobbyEvent.
void updateUserState() {
  if (kTestMode) return;
  void updateActiveMatches(User updatedUserData) {
    final remoteActiveMatches = updatedUserData.activeMatches ?? [];
    getIt<ActiveMatchBloc>().add(UpdateMatches(remoteActiveMatches));
  }

  void updateNotificationState(User updatedUserData) {
    final remoteNotifications = updatedUserData.notifications ?? [];
    getIt<NotificationCubit>().updateNotifications(remoteNotifications);
  }

  final checkInRepository = getIt<CheckInRepository>();

  checkInRepository.getExtendedUserData().then(
        (value) => value.fold(
          (l) => log(l.toString()),
          (updatedUserData) {
            updateNotificationState(updatedUserData);

            updateActiveMatches(updatedUserData);

            if (updatedUserData.lobbyCheckIn != null) {
              lobbyCheckIn(updatedUserData.lobbyCheckIn!);
            }
          },
        ),
      );
}

Future<void> lobbyCheckIn(LobbyCheckIn lobbyCheckIn) async {
  getIt<DialogCubit>().showDialog(CheckInDialog(lobbyCheckIn));
}

Future<void> lobbyStateUpdate(LobbyParameters lobbyParameters) async {
  final checkInRepo = getIt<CheckInRepository>();

  final lobby = await checkInRepo.get(lobbyId: lobbyParameters.lobbyId);
  lobby.fold((l) => null, (lobby) {
    getIt<MatchLobbyBloc>().add(
      MatchLobbyEvent.opponentCheckedIn(
        matchId: lobby.matchId,
        lobbyParameters: lobbyParameters,
        silent: true,
      ),
    );
  });
}
