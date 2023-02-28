import 'dart:developer';

import 'package:fifa/r.dart';
import 'package:fifa/src/app/dependency_injection.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/common/widgets/exception_widget.dart';
import 'package:fifa/src/features/play_match/match/dispute/dispute_in_progress_page.dart';
import 'package:fifa/src/features/play_match/match/pages/add_match_result_page.dart';
import 'package:fifa/src/features/play_match/match/pages/game_over_page.dart';
import 'package:fifa/src/features/play_match/match/pages/match_lobby_page.dart';
import 'package:fifa/src/features/play_match/match/pages/match_scoped_notifications.dart';
import 'package:fifa/src/features/play_match/match/pages/opponent_score_confirmation_page.dart';
import 'package:fifa/src/features/play_match/match/pages/waiting_for_confirmation_page.dart';
import 'package:fifa/src/features/play_match/match_bloc/match_lobby_bloc.dart';
import 'package:fifa/src/features/play_match/matchmaking/matchmaking_page.dart';
import 'package:fifa/src/notifications/notification_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routemaster/routemaster.dart';

class MatchFlowPage extends StatefulWidget {
  const MatchFlowPage({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  State<MatchFlowPage> createState() => _MatchFlowPageState();
}

class _MatchFlowPageState extends State<MatchFlowPage> {
  late final matchLobbyBloc = getIt<MatchLobbyBloc>();

  @override
  void initState() {
    log('------');
    log('MatchFlowPage');
    log('------');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MatchLobbyBloc>.value(
      value: getIt(),
      child: BlocBuilder<MatchLobbyBloc, MatchLobbyState>(
        builder: (context, state) {
          print(state);
          return state.map(
            gameInProgress: (state) => MatchScopedNotifications(
              matchLobbyData: state.matchLobbyData,
              child: widget.child,
            ),
            addResult: (state) => MatchScopedNotifications(
              matchLobbyData: state.matchLobbyData,
              child: widget.child,
            ),
            awaitingConfirmation: (state) => MatchScopedNotifications(
              matchLobbyData: state.matchLobbyData,
              child: widget.child,
            ),
            confirmResult: (state) => MatchScopedNotifications(
              matchLobbyData: state.matchLobbyData,
              child: widget.child,
            ),
            disputeInProgress: (state) => MatchScopedNotifications(
              matchLobbyData: state.matchLobbyData,
              child: widget.child,
            ),
            gameOver: (state) => MatchScopedNotifications(
              matchLobbyData: state.matchLobbyData,
              child: widget.child,
            ),
            waitingForOpponentToJoin: (state) {
              return TournamentScopedNotifications(
                tournamentId: state.lobbyParameters.tournamentId,
                isCollection: false,
                matchId: state.matchLobbyData?.matchInfo.id,
                lobbyId: state.lobbyParameters.lobbyId,
                child: LobbyScopedNotifications(
                  lobbyParameters: state.lobbyParameters,
                  child: widget.child,
                ),
              );
            },
            awaitingMatchmaking: (value) => widget.child,
            joining: (_) => widget.child,
            initial: (_) => const SizedBox.shrink(),
            error: (_) => NetworkExceptionPage(child: widget.child),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    matchLobbyBloc.state.maybeWhen(
      initial: () {
        //do nothing
      },
      orElse: () {
        log('closing match');
        matchLobbyBloc.add(const MatchLobbyEvent.close());
        log('match closed');
      },
    );
    log('disposing');
  }
}

Map<String, PageBuilder> matchLobbyRoutes = {
  R.routeNames.matchLobby: (route) {
    final lobbyParameters = (getIt<MatchLobbyBloc>().state as MatchLobbyWaitingForOpponentToJoin).lobbyParameters;
    return MaterialPage<void>(
      key: ValueKey<String>(route.fullPath),
      child: MatchLobbyPage(
        key: ValueKey<String>(route.fullPath),
        lobbyParameters: lobbyParameters,
        inProgress: false,
      ),
    );
  },
  R.routeNames.matchInProgress: (route) {
    final lobbyParameters = (getIt<MatchLobbyBloc>().state as MatchLobbyGameInProgress).lobbyParameters;
    final matchLobbyData = (getIt<MatchLobbyBloc>().state as MatchLobbyGameInProgress).matchLobbyData;

    return MaterialPage<void>(
      key: ValueKey<String>(route.fullPath),
      child: MatchLobbyPage(
        key: ValueKey<String>(route.fullPath),
        lobbyParameters: lobbyParameters,
        matchLobbyData: matchLobbyData,
        inProgress: true,
      ),
    );
  },
  R.routeNames.matchmaking: (route) {
    return MaterialPage<void>(
      key: ValueKey<String>(route.fullPath),
      child: MatchmakingPage(
        key: ValueKey<String>(route.fullPath),
        tournamentId: int.parse(route.pathParameters['id']!),
      ),
    );
  },
  R.routeNames.matchAddResult: (route) {
    final matchLobbyData = (getIt<MatchLobbyBloc>().state as MatchLobbyAddResult).matchLobbyData;

    return MaterialPage<void>(
      key: ValueKey<String>(route.fullPath),
      child: AddResultsView(
        key: ValueKey<String>(route.fullPath),
        matchLobbyData: matchLobbyData,
      ),
    );
  },
  R.routeNames.matchAwaitingConfirmation: (route) {
    final state = getIt<MatchLobbyBloc>().state as MatchLobbyAwaitingConfirmation;
    final matchLobbyData = state.matchLobbyData;
    return MaterialPage<void>(
      key: ValueKey<String>(route.fullPath),
      child: WaitingForConfirmationView(
        key: ValueKey<String>(route.fullPath),
        matchLobbyData: matchLobbyData,
        score1: state.score1,
        score2: state.score2,
      ),
    );
  },
  R.routeNames.matchConfirmResult: (route) {
    final state = getIt<MatchLobbyBloc>().state as MatchLobbyConfirmResult;
    final matchLobbyData = state.matchLobbyData;
    final results = state.matchScores;

    return MaterialPage<void>(
      key: ValueKey<String>(route.fullPath),
      child: ConfirmResultView(
        key: ValueKey<String>(route.fullPath),
        results: results,
        matchLobbyData: matchLobbyData,
      ),
    );
  },
  R.routeNames.matchDispute: (route) {
    final matchLobbyData = (getIt<MatchLobbyBloc>().state as MatchLobbyDisputeInProgress).matchLobbyData;

    return MaterialPage<void>(
      key: ValueKey<String>(route.fullPath),
      child: DisputeInProgressView(
        key: ValueKey<String>(route.fullPath),
        matchLobbyData: matchLobbyData,
      ),
    );
  },
  R.routeNames.matchOver: (route) {
    final state = getIt<MatchLobbyBloc>().state as MatchLobbyGameOver;
    final matchLobbyData = state.matchLobbyData;
    final results = state.matchScores;

    return MaterialPage<void>(
      key: ValueKey<String>(route.fullPath),
      child: GameOverView(
        key: ValueKey<String>(route.fullPath),
        matchLobbyData: matchLobbyData,
        results: results,
      ),
    );
  },
};

class NetworkExceptionPage extends StatelessWidget with ExtensionsMixin {
  final Widget? child;
  const NetworkExceptionPage({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NotificationAppBar(title: Text(context.l10n.networkError)),
      body: Center(child: child ?? const NetworkExceptionWidget()),
    );
  }
}
