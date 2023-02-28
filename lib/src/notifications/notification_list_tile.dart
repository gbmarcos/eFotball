import 'package:fifa/r.dart';
import 'package:fifa/src/app/dependency_injection.dart';
import 'package:fifa/src/common/domain/match/match.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/common/widgets/app_image.dart';
import 'package:fifa/src/common/widgets/components/custom_circle_avatar.dart';
import 'package:fifa/src/features/play_match/match_bloc/match_lobby_bloc.dart';
import 'package:fifa/src/notifications/data/notification.dart';
import 'package:fifa/src/notifications/notification_cubit/notification_cubit.dart';
import 'package:flutter/material.dart' hide Notification;
import 'package:routemaster/routemaster.dart';

extension NotificationPresenterX on Notification {
  /// Returns an localized String representation of a Notification by its type.
  /// Eg:   NotificationType.tournamentJoinRequestDeclined => "Your registration has been declined",
  String l10n(BuildContext context) {
    switch (type) {
      case NotificationType.friendRequestAccepted:
        return context.l10n.notificationFriendRequestAccepted(fromUser?.username ?? '');
      case NotificationType.tournamentJoinRequestAccepted:
        return context.l10n.notificationTournamentJoinRequestAccepted;
      case NotificationType.tournamentJoinRequestDeclined:
        return context.l10n.notificationTournamentJoinRequestDeclined;
      case NotificationType.tournamentLobbyCreated:
        return context.l10n.notificationTournamentLobbyCreated;
      case NotificationType.friendStartedStreaming:
        return context.l10n.notificationFriendStartedStreaming(fromUser?.username ?? '');
      case NotificationType.tournamentMatchScoresSubmitted:
        return context.l10n.notificationTournamentMatchScoresSubmitted;
      case NotificationType.orgJoinRequestAccepted:
        return context.l10n.notificationOrgJoinRequestAccepted;
      case NotificationType.orgJoinRequestDenied:
        return context.l10n.notificationOrgJoinRequestDenied;
      case NotificationType.tournamentMatchConflict:
        return context.l10n.notificationTournamentMatchConflict;
    }
  }

  dynamic toPage(BuildContext context) {
    const prefix = '/';
    switch (type) {
      case NotificationType.friendRequestAccepted:
        if (fromUser?.id != null) {
          if (fromUser!.id == context.currentUser.id) {
            Routemaster.of(context).push(R.routeNames.profileSection);
          } else if (fromUser!.id != null) {
            Routemaster.of(context).pushWithScope(
              R.routeNames.profileDetailsWithId(fromUser!.id!),
              value: fromUser!,
            );
          }
          getIt<NotificationCubit>().toggleExpanded();
        }
        break;
      case NotificationType.tournamentJoinRequestAccepted:
      case NotificationType.tournamentJoinRequestDeclined:
        if (data['id'] != null) {
          if (data['collection'] != null && data['collection'] as bool) {
            Routemaster.of(context)
                .push(R.routeNames.homeSection + '/' + R.routeNames.tournamentCollectionDetailsWithId('${data['id']}'));
          } else {
            Routemaster.of(context)
                .push(R.routeNames.homeSection + '/' + R.routeNames.tournamentDetailsWithId('${data['id']}'));
          }
          getIt<NotificationCubit>().toggleExpanded();
        }
        return context.l10n.notificationTournamentJoinRequestDeclined;
      case NotificationType.tournamentLobbyCreated:
        if (data['id'] != null && data['tournament']['id'] != null) {
          getIt<MatchLobbyBloc>().add(MatchLobbyEvent.restoreStateFromNotification(
              user: context.currentUser,
              lobbyId: int.parse('${data['id']}'),
              tournamentId: int.parse('${data['tournament']['id']}')));
          getIt<NotificationCubit>().toggleExpanded();
        }

        return context.l10n.notificationTournamentLobbyCreated;
      case NotificationType.friendStartedStreaming:
        Routemaster.of(context).push(prefix + R.routeNames.streamsSection);
        getIt<NotificationCubit>().toggleExpanded();
        return context.l10n.notificationFriendStartedStreaming(fromUser?.username ?? '');
      case NotificationType.tournamentMatchScoresSubmitted:
        if (data['match_id'] != null && data['tournament_id'] != null) {
          getIt<MatchLobbyBloc>().add(MatchLobbyEvent.restoreState(
              user: context.currentUser,
              activeMatch: ActiveMatch(
                  matchId: int.parse('${data['match_id']}'), tournamentId: int.parse('${data['tournament_id']}'))));
          getIt<NotificationCubit>().toggleExpanded();
        }
        return context.l10n.notificationTournamentMatchScoresSubmitted;
      case NotificationType.orgJoinRequestAccepted:
      case NotificationType.orgJoinRequestDenied:
        if (data['id'] != null) {
          Routemaster.of(context)
              .push(R.routeNames.homeSection + '/' + R.routeNames.clubDetailsWithId('${data['id']}'));

          getIt<NotificationCubit>().toggleExpanded();
        }
        return context.l10n.notificationOrgJoinRequestDenied;
      case NotificationType.tournamentMatchConflict:
        if (data['id'] != null && data['tournament_id'] != null) {
          getIt<MatchLobbyBloc>().add(MatchLobbyEvent.restoreState(
              user: context.currentUser,
              activeMatch: ActiveMatch(
                  matchId: int.parse('${data['id']}'), tournamentId: int.parse('${data['tournament_id']}'))));
          getIt<NotificationCubit>().toggleExpanded();
        }
        return context.l10n.notificationTournamentMatchConflict;
    }
  }
}

class NotificationListTile extends StatefulWidget {
  final Notification notification;

  const NotificationListTile({Key? key, required this.notification}) : super(key: key);

  @override
  State<NotificationListTile> createState() => _NotificationListTileState();
}

class _NotificationListTileState extends State<NotificationListTile> {
  Widget? leading;
  Widget? title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        widget.notification.toPage(context);
      },
      leading: leading,
      title: title != null
          ? DefaultTextStyle(
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: context.theme.colorScheme.secondary,
              ),
              child: title!,
            )
          : null,
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 7),
        child: Text(
          widget.notification.l10n(context),
          style: TextStyles.listTileTrailing.copyWith(color: Colors.white),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    switch (widget.notification.type) {
      case NotificationType.tournamentJoinRequestAccepted:
      case NotificationType.tournamentJoinRequestDeclined:
      case NotificationType.tournamentLobbyCreated:
      case NotificationType.tournamentMatchScoresSubmitted:
      case NotificationType.orgJoinRequestAccepted:
      case NotificationType.orgJoinRequestDenied:
      case NotificationType.tournamentMatchConflict:
        if (widget.notification.data['name'] != null) {
          title = Text(widget.notification.data['name'] as String);
        } else if (widget.notification.data['tournament']['name'] != null) {
          title = Text(widget.notification.data['tournament']['name'] as String);
        }

        if (widget.notification.data['image'] != null) {
          leading = CustomCircleAvatar(
              radius: 16, backgroundImage: AppImage.provider(url: widget.notification.data['image'] as String));
        }

        break;
      case NotificationType.friendStartedStreaming:
      case NotificationType.friendRequestAccepted:
        if (widget.notification.fromUser?.avatar != null) {
          leading = CustomCircleAvatar(
              radius: 16, backgroundImage: AppImage.provider(url: widget.notification.fromUser?.avatar ?? ''));
        }

        break;
    }
  }
}
