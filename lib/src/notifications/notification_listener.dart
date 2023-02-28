import 'package:fifa/src/app/dependency_injection.dart';
import 'package:fifa/src/authentication/authentication.dart';
import 'package:fifa/src/authentication/authentication_repository.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/common/services/dialog_cubit/dialog_cubit.dart';
import 'package:fifa/src/common/services/dialog_cubit/dialog_cubit_listener.dart';
import 'package:fifa/src/features/play_match/match_bloc/match_lobby_bloc.dart';
import 'package:fifa/src/features/play_match/match_bloc/match_lobby_listener.dart';
import 'package:fifa/src/notifications/scoped_updater/scoped_subscription_lists.dart';
import 'package:fifa/src/notifications/scoped_updater/scoped_updater_widget.dart';
import 'package:fifa/src/push_notification/push_notifications_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Widget in which Effects to notifications are registered
class NotificationListenerWidget extends StatefulWidget {
  final Widget child;

  const NotificationListenerWidget({Key? key, required this.child}) : super(key: key);

  @override
  _NotificationListenerWidgetState createState() => _NotificationListenerWidgetState();
}

class _NotificationListenerWidgetState extends State<NotificationListenerWidget> with WidgetsBindingObserver {
  AppLifecycleState appLifecycleState = AppLifecycleState.resumed;

  @override
  void initState() {
    _userPendingCheckIn(context, context.read<AuthenticationBloc>().state);
    WidgetsBinding.instance.addObserver(this);
    getIt<PushNotificationService>().pendingPushNotifications();
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedUpdater(
      pollingCycle: const Duration(seconds: 8),
      scopedSubscriptions: [privateUserScopedSubscription(context.currentUser.id)],
      child: MultiBlocListener(
        listeners: [
          BlocListener<DialogCubit, DialogState>(
            listener: (ctx, state) => dialogStateListener(ctx, state, appLifecycleState),
          ),
          BlocListener<MatchLobbyBloc, MatchLobbyState>(
            listenWhen: (previous, current) {
              // if the previous state is initial and the current state is gameOver
              // just show the DisputeNotificationDialog and don't call the usual listener

              return previous.maybeMap(
                initial: (_) {
                  return current.maybeMap(
                    gameOver: (matchLobbyGameOver) {
                      final matchLobbyData = matchLobbyGameOver.matchLobbyData;
                      final matchScores = matchLobbyGameOver.matchScores;

                      context.read<MatchLobbyBloc>().add(const MatchLobbyEvent.close());

                      getIt<DialogCubit>()
                          .showDialog(DisputeDialog(matchLobbyData: matchLobbyData, results: matchScores));

                      return false;
                    },
                    orElse: () {
                      return true;
                    },
                  );
                },
                orElse: () {
                  return true;
                },
              );
            },
            listener: matchLobbyStateListener,
          ),
        ],
        child: widget.child,
      ),
    );
  }
}

///If a user authenticates and has the lobbyCheckIn field not null, shows a  dialog.
void _userPendingCheckIn(BuildContext context, AuthenticationState state, {Duration? duration}) {
  if (state.status == AuthenticationStatus.authenticated) {
    final lobby = state.user?.lobbyCheckIn;
    if (lobby != null) {
      Future<dynamic>.delayed(duration ?? const Duration(milliseconds: 700)).then((dynamic _) {
        SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
          lobbyCheckIn(lobby);
        });
      });
    }
  }
}
