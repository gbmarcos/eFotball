import 'dart:developer';

import 'package:fifa/r.dart';
import 'package:fifa/src/features/play_match/match_bloc/match_lobby_state.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

void matchLobbyStateListener(BuildContext context, MatchLobbyState state) {
  state.maybeWhen(
    waitingForOpponentToJoin: (lobby) {
      log('waitingForOpponentToJoin');
      Routemaster.of(context).push(R.routeNames.matchLobbyWithId(lobby.lobbyId));
    },
    awaitingMatchmaking: (tournamentId) {
      log('awaitingMatchmaking');
      Routemaster.of(context).push(R.routeNames.matchmakingWithId(tournamentId));
    },
    gameInProgress: (matchLobbyData, lobbyParameters) {
      log('gameInProgress');
      Routemaster.of(context).push(R.routeNames.matchInProgressWithId(matchLobbyData.matchInfo.id));
    },
    addResult: (lobbyData) {
      log('addResult');
      Routemaster.of(context).push(R.routeNames.matchAddResultWithId(lobbyData.matchInfo.id));
    },
    awaitingConfirmation: (lobbyData, score1, score2) {
      log('awaitingConfirmation');
      Routemaster.of(context).push(R.routeNames.matchAwaitingConfirmationWithId(lobbyData.matchInfo.id));
    },
    gameOver: (lobbyData, results) {
      log('gameOver');
      Routemaster.of(context).push(R.routeNames.matchOverWithId(lobbyData.matchInfo.id));
    },
    confirmResult: (lobbyData, results) {
      log('confirmResult');
      Routemaster.of(context).push(R.routeNames.matchConfirmResultWithId(lobbyData.matchInfo.id));
    },
    disputeInProgress: (lobbyData) {
      log('disputeInProgress');
      Routemaster.of(context).push(R.routeNames.matchDisputeWithId(lobbyData.matchInfo.id));
    },
    orElse: () {
      log('No actions on matchLobbyStateListener ');
    },
  );
}
