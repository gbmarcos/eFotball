import 'dart:convert';
import 'dart:developer';

import 'package:fifa/r.dart';
import 'package:fifa/src/app/dependency_injection.dart';
import 'package:fifa/src/app/keys.dart';
import 'package:fifa/src/authentication/authentication.dart';

import 'package:fifa/src/common/dialogs.dart';
import 'package:fifa/src/common/domain/match/match.dart';
import 'package:fifa/src/common/domain/user/user.dart';
import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/common/services/dialog_cubit/dialog_cubit.dart';
import 'package:fifa/src/common/widgets/app_image.dart';
import 'package:fifa/src/common/widgets/components/custom_circle_avatar.dart';
import 'package:fifa/src/common/widgets/custom_form_button.dart';
import 'package:fifa/src/common/widgets/frosted_image_card.dart';
import 'package:fifa/src/common/widgets/text_countdown.dart';
import 'package:fifa/src/features/play_match/lobby/check_in.dart';
import 'package:fifa/src/features/play_match/lobby/match_lobby_cubit.dart';
import 'package:fifa/src/features/play_match/match_bloc/match_lobby_bloc.dart';
import 'package:fifa/src/notifications/data/notification_events.dart';
import 'package:fifa/src/notifications/realtime_notifications_service/realtime_notifications_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'check_in_dialog_cubit.dart';

Future<T?> showCheckInDialog<T extends Object?>(BuildContext context, {required LobbyCheckIn lobbyCheckIn}) async {
  return showDialogFadeScale(
    context: context,
    child: BlocProvider(
      create: (_) => CheckInDialogCubit(
        lobbyCheckIn: lobbyCheckIn,
        checkInRepository: getIt(),
        user: context.read<AuthenticationBloc>().state.user!,
      ),
      child: Material(child: LobbyCheckInDialog(lobbyCheckIn: lobbyCheckIn)),
    ),
  );
}

class LobbyCheckInDialog extends StatefulWidget {
  final LobbyCheckIn lobbyCheckIn;

  const LobbyCheckInDialog({Key? key, required this.lobbyCheckIn}) : super(key: key);
  static const buttonMargin = EdgeInsets.symmetric(horizontal: 16);

  @override
  State<LobbyCheckInDialog> createState() => _LobbyCheckInDialogState();
}

class _LobbyCheckInDialogState extends State<LobbyCheckInDialog> with WidgetsBindingObserver {
  late final bool checkInActive = widget.lobbyCheckIn.walkoverTimeLeft.isSome();
  late final CheckInDialogCubit cubit = context.read<CheckInDialogCubit>();
  late final User user = context.read<AuthenticationBloc>().state.user!;
  late final RealTimeClient client = getIt<RealTimeClient>();
  late final channelConfiguration = NotificationChannelsFacade.lobby('${widget.lobbyCheckIn.id}');
  late final channel = client.subscribe(channelConfiguration.channelName);

  @override
  void initState() {
    super.initState();
    log('binding check in');
    channel
      ..bind(
        'check-in',
        (event) {
          log('Received  event [${event?.eventName}] with data: [${event?.data}]');

          try {
            final checkIn = CheckIn.fromJson(jsonDecode(event!.data!) as Map<String, dynamic>);
            if (checkIn.userId == user.id) {
              cubit.emitCheckingSuccess(checkIn.checkInTime);
            }
          } catch (e) {
            log('Error $e deserializing ${event?.data}');
          }
        },
      )
      ..bind('deleted', (event) {
        cubit.opponentLeft(reason: 'Lobby deleted');
      })
      ..bind('walkover', (event) {
        cubit.opponentLeft(reason: 'Lobby walkover');
        final walkoverMatchId = int.tryParse(event?.data ?? '');
        if (walkoverMatchId != null) {
          getIt<MatchLobbyBloc>().add(
            MatchLobbyEvent.restoreState(
              user: context.currentUser,
              activeMatch: ActiveMatch(
                tournamentId: widget.lobbyCheckIn.tournament.id,
                matchId: walkoverMatchId,
              ),
            ),
          );
        }
      });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  void dispose() {
    // When the app is paused it stays listening the notification and updating
    // bloc states, but the dispose method is only called when the app is resumed.
    // When the state of MatchLobbyBloc is changed to waitingForOpponentToJoin a subscribing to the current
    // lobby is done but this method haven't been called until the app is resumed.
    // the next code is to prevent the unsubscribing to the current lobby when the app is resumed.

    getIt<MatchLobbyBloc>().state.maybeWhen(
      waitingForOpponentToJoin: (_) {
        //do nothing
      },
      orElse: () {
        client.unsubscribe(channel.name);
      },
    );

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener<CheckInDialogCubit, CheckInDialogState>(
        key: Keys.lobbyCheckInDialog,
        listener: (BuildContext context, state) {
          getIt<DialogCubit>().dialogEnded();
          state.maybeWhen(
              error: (e) {
                showNetworkErrorMessage(context: context, error: e, key: Keys.checkInSnackbarError);
                cubit.updateRemoteState();
              },
              leaveSuccess: (reason) {
                if (reason == null) {
                  showCustomMessage(
                    key: Keys.checkInSnackbarLeaveSuccess,
                    context: context,
                    message: context.l10n.leftTheMatch,
                  );
                }
                if (Navigator.canPop(context)) {
                  Navigator.pop(context, cubit.state);
                }
                if (Navigator.canPop(context)) {
                  Navigator.pop(context, cubit.state);
                }
                log('Left match ${cubit.state}');
              },
              checkInSuccess: (date) {
                showCustomMessage(
                  key: Keys.checkInSnackbarCheckInSuccess,
                  context: context,
                  message: context.l10n.successfulCheckIn,
                );
                final lobbyParameters = LobbyParameters.fromLobbyCheckIn(widget.lobbyCheckIn, context.currentUser);
                if (Navigator.canPop(context)) {
                  Navigator.pop(context, cubit.state);
                }

                getIt<MatchLobbyBloc>().add(MatchLobbyEvent.join(lobbyParameters: lobbyParameters));
              },
              orElse: () {});
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: FrostedImageCard(
            imageSrc: widget.lobbyCheckIn.tournament.banner ?? widget.lobbyCheckIn.tournament.logo,
            imageSize: const Size.square(92),
            title: Center(child: Text(widget.lobbyCheckIn.tournament.name)),
            detailsFlex: 11,
            details: Column(children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      RichText(text: TextSpan(text: context.l10n.yourNextMatchStartsNow)),
                      const SizedBox.square(dimension: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            child: Text(context.l10n.vs, overflow: TextOverflow.fade),
                          ),
                          CustomCircleAvatar(
                            radius: 12,
                            backgroundImage: widget.lobbyCheckIn.user.avatar != null
                                ? AppImage.provider(url: widget.lobbyCheckIn.user.avatar!)
                                : null,
                          ),
                          Flexible(
                            child: Text(
                              widget.lobbyCheckIn.user.username,
                              overflow: TextOverflow.fade,
                              style: TextStyles.listTileTrailing.copyWith(color: Theme.of(context).colorScheme.primary),
                            ),
                          ),
                          if (widget.lobbyCheckIn.team?.logo != null)
                            AppImage(
                              image: widget.lobbyCheckIn.team?.logo,
                              imageSize: const Size.fromRadius(12),
                              fit: BoxFit.cover,
                            )
                        ].interleave(const SizedBox(width: 8)),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                    padding: const EdgeInsets.only(left: 27, right: 27, bottom: 20, top: 15),
                    color: R.colors.lobbyCheckInCardSection,
                    child: Column(
                      children: [
                        widget.lobbyCheckIn.walkoverTimeLeft.match(
                          (t) => DefaultTextStyle.merge(
                            style:
                                TextStyles.listTileTrailing.copyWith(fontWeight: FontWeight.w600, color: Colors.white),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(context.l10n.timeLeft),
                                TextCountDown(
                                  duration: t,
                                  onFinish: () {
                                    cubit.leave(reason: "Countdown ended");
                                  },
                                )
                              ],
                            ),
                          ),
                          () {
                            cubit.leave(reason: 'No time left');
                            return const SizedBox.shrink();
                          },
                        ),
                        const SizedBox(height: 8),
                        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                          GestureDetector(
                            onDoubleTap: () {
                              if (Navigator.canPop(context)) {
                                Navigator.of(context).pop(const CheckInDialogState.error(
                                    exception: NetworkException(message: 'Forced leave by user')));
                              }
                            },
                            child: CustomFormButton(
                              key: Keys.leaveCheckInDialogButtonKey,
                              onTap: cubit.state.maybeMap(orElse: () => cubit.leave, waitingForResponse: null),
                              buttonText: context.l10n.leaveMatch,
                              outlined: true,
                              margin: LobbyCheckInDialog.buttonMargin,
                            ),
                          ),
                          const SizedBox(width: 8),
                          CustomFormButton(
                            key: Keys.confirmCheckInDialogButtonKey,
                            onTap: cubit.state.maybeMap(orElse: () => cubit.checkIn, waitingForResponse: null),
                            buttonText: context.l10n.checkInAndPlay,
                            margin: LobbyCheckInDialog.buttonMargin,
                          )
                        ]),
                      ],
                    )),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
