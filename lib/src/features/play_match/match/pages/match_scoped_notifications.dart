import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/features/play_match/lobby/match_lobby_cubit.dart';
import 'package:fifa/src/notifications/scoped_updater/scoped_subscription_lists.dart';
import 'package:fifa/src/notifications/scoped_updater/scoped_updater_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MatchScopedNotifications extends StatelessWidget {
  final MatchLobbyData matchLobbyData;
  final Widget child;
  const MatchScopedNotifications({Key? key, required this.matchLobbyData, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedUpdater(
      pollingCycle: const Duration(seconds: 2),
      scopedSubscriptions: [
        privateMatchScopedSubscription(matchLobbyData: matchLobbyData, bloc: context.read(), user: context.currentUser)
      ],
      child: child,
    );
  }
}

class TournamentScopedNotifications extends StatelessWidget {
  final Widget child;
  final int tournamentId;
  final int? matchId;
  final int? lobbyId;
  final bool isCollection;
  const TournamentScopedNotifications({
    Key? key,
    required this.child,
    required this.tournamentId,
    this.matchId,
    this.lobbyId,
    required this.isCollection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedUpdater(
      scopedSubscriptions: [
        tournamentScopedSubscription(
          tournamentId: tournamentId,
          isCollection: isCollection,
          matchId: matchId,
          lobbyId: lobbyId,
        )
      ],
      child: child,
    );
  }
}

class LobbyScopedNotifications extends StatelessWidget {
  final Widget child;
  final LobbyParameters lobbyParameters;
  const LobbyScopedNotifications({Key? key, required this.child, required this.lobbyParameters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedUpdater(
      pollingCycle: const Duration(seconds: 3),
      scopedSubscriptions: [lobbyScopedSubscription(lobbyParameters: lobbyParameters)],
      child: child,
    );
  }
}
