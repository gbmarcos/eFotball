import 'dart:async';
import 'dart:developer';

import 'package:fifa/r.dart';
import 'package:fifa/src/app/dependency_injection.dart';
import 'package:fifa/src/app/keys.dart';
import 'package:fifa/src/common/environment.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/common/get_it_scoped_widget.dart';
import 'package:fifa/src/common/widgets/components/custom_app_bar.dart';
import 'package:fifa/src/common/widgets/counter_badge.dart';
import 'package:fifa/src/features/match/active_match_bloc/active_match_bloc.dart';
import 'package:fifa/src/features/play_match/match_bloc/match_lobby_bloc.dart';
import 'package:fifa/src/features/play_match/match_bloc/match_lobby_state.dart';
import 'package:fifa/src/notifications/notification_cubit/notification_cubit.dart';
import 'package:fifa/src/notifications/notification_list_tile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Notification;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:routemaster/routemaster.dart';

/// AppBar which displays a counter if there are pending notifications for the user to check
class NotificationAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Widget title;

  ///If a banner should be displayed if available below the app bar
  final bool showBanner;

  final VoidCallback? onBackPressed;

  const NotificationAppBar({
    Key? key,
    required this.title,
    this.showBanner = true,
    this.onBackPressed,
  }) : super(key: key);

  @override
  State<NotificationAppBar> createState() => _NotificationAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kAppBarSize + kExpandedAppBarSize + kBannerHeight);
}

class _NotificationAppBarState extends State<NotificationAppBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      bloc: getIt<NotificationCubit>(),
      builder: (context, notifications) {
        const divider = Divider(color: Color(0xFF33383D), height: 3);
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (false&&kDebugMode && !kTestMode)
              SafeArea(
                  child: TextButton(
                      onPressed: () {
                        print('${getIt<Sacco>()}');
                        Routemaster.of(context).push('/');
                      },
                      child: Text(Routemaster.of(context).currentRoute.fullPath))),
            CustomAppBar(
              title: DefaultTextStyle(
                key: Keys.notificationAppBarTitle,
                  style:  const TextStyle(),
                  child: widget.title),
              isExpanded: notifications.isExpanded,
              showOnExpanded: Column(
                children: [
                  const SizedBox(height: 13),
                  divider,
                  Expanded(
                    child: ListView.separated(
                      itemCount: notifications.notifications.length,
                      itemBuilder: (_, i) => NotificationListTile(
                        notification: notifications.notifications[i],
                      ),
                      separatorBuilder: (context, index) => divider,
                    ),
                  ),
                ],
              ),
              trailing: SizedBox(
                width: 60,
                child: _NotificationCounter(
                  count: notifications.unreadNotifications,
                  onTap: () async {
                    final hasNotifications = !notifications.notifications.isNullOrEmptyList;
                    if (hasNotifications) {
                      getIt<NotificationCubit>().toggleExpanded();
                    }
                    if (getIt<NotificationCubit>().state.isExpanded) {
                      unawaited(getIt<NotificationCubit>().markAllNotificationAsSeen());
                    }
                  },
                ),
              ),
              onBackPressed: widget.onBackPressed,
            ),
            const _AppBarProgressIndicator(),
            if (widget.showBanner)
              BlocBuilder<ActiveMatchBloc, ActiveMatchState>(
                bloc: getIt<ActiveMatchBloc>(),
                builder: (BuildContext context, state) {
                  if (state.activeMatches.isNotEmpty) return const _PendingMatchBanner();
                  return const SizedBox.shrink();
                },
              )
          ],
        );
      },
    );
  }
}

class _AppBarProgressIndicator extends StatelessWidget {
  const _AppBarProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchLobbyBloc, MatchLobbyState>(
      bloc: getIt<MatchLobbyBloc>(),
      builder: (_, state) {
        final notifications = getIt<NotificationCubit>();
        return LinearProgressIndicator(
          value: state.maybeMap(orElse: () => notifications.state.loadingProgress, joining: (j) => null),
          backgroundColor: R.colors.menuBarBackground,
        );
      },
    );
  }
}

const kBannerHeight = 74.0;

class _PendingMatchBanner extends StatelessWidget {
  const _PendingMatchBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.backgroundColor;
    final matchLobbyBloc = getIt<MatchLobbyBloc>().state;
    return InkWell(
      onTap: () async {
        final activeMatch = getIt<ActiveMatchBloc>().state.activeMatches.first;
        log('Tapped _PendingMatchBanner with active match $activeMatch}');
        matchLobbyBloc.maybeMap(
          joining: (_) {
            //Do nothing while joining
          },
          orElse: () {
            getIt<MatchLobbyBloc>().add(
              MatchLobbyEvent.restoreState(
                user: context.currentUser,
                activeMatch: activeMatch,
              ),
            );
          },
        );
      },
      child: MaterialBanner(
        backgroundColor: theme.colorScheme.secondary,
        content: Text(
          context.l10n.unfinishedMatchBannerText,
          maxLines: 2,
          style: TextStyles.listTileTitle.copyWith(fontWeight: FontWeight.w600, color: textColor),
        ),
        actions: [Icon(Icons.arrow_forward_ios, color: textColor)],
      ),
    );
  }
}

class _NotificationCounter extends StatelessWidget {
  final int? count;
  final VoidCallback? onTap;

  const _NotificationCounter({Key? key, this.count, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: Keys.notificationBell,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 7),
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            Positioned(
              bottom: 4,
              right: 18,
              child: FaIcon(
                FontAwesomeIcons.solidBell,
                color: Theme.of(context).unselectedWidgetColor,
              ),
            ),
            Positioned(right: 2, bottom: 0, child: CounterBadge(count: count)),
          ],
        ),
      ),
    );
  }
}
