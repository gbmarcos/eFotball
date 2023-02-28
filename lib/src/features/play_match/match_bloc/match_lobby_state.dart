
import 'package:fifa/src/features/match/model/match.dart';
import 'package:fifa/src/features/play_match/lobby/match_lobby_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'match_lobby_state.freezed.dart';

@freezed
class MatchLobbyState with _$MatchLobbyState {
  const MatchLobbyState._();

  MatchLobbyData? get matchLobbyData => maybeMap(
        gameInProgress: (gameInProgress) => gameInProgress.matchLobbyData,
        addResult: (addResult) => addResult.matchLobbyData,
        awaitingConfirmation: (awaitingConfirmation) => awaitingConfirmation.matchLobbyData,
        confirmResult: (confirmResult) => confirmResult.matchLobbyData,
        gameOver: (gameOver) => gameOver.matchLobbyData,
        disputeInProgress: (disputeInProgress) => disputeInProgress.matchLobbyData,
        awaitingMatchmaking: (awaitingMatchmaking) => awaitingMatchmaking.matchLobbyData,
        orElse: () => null,
      );

  const factory MatchLobbyState.initial() = _MatchLobbyInitial;

  const factory MatchLobbyState.joining() = _MatchLobbyJoining;

  const factory MatchLobbyState.gameInProgress({
    required MatchLobbyData matchLobbyData,
    required LobbyParameters lobbyParameters,
  }) = MatchLobbyGameInProgress;

  const factory MatchLobbyState.addResult({required MatchLobbyData matchLobbyData}) = MatchLobbyAddResult;

  const factory MatchLobbyState.awaitingConfirmation(
      {required MatchLobbyData matchLobbyData,
      required int score1,
      required int score2}) = MatchLobbyAwaitingConfirmation;

  const factory MatchLobbyState.confirmResult(
      {required MatchLobbyData matchLobbyData, required MatchScores matchScores}) = MatchLobbyConfirmResult;

  const factory MatchLobbyState.gameOver({required MatchLobbyData matchLobbyData, required MatchScores matchScores}) =
      MatchLobbyGameOver;

  const factory MatchLobbyState.disputeInProgress({
    required MatchLobbyData matchLobbyData,
  }) = MatchLobbyDisputeInProgress;

  const factory MatchLobbyState.error(Object exception, {String? message, StackTrace? stackTrace}) = MatchLobbyError;

  // Lobby states
  const factory MatchLobbyState.awaitingMatchmaking({
    required int tournamentId,
  }) = MatchLobbyAwaitingMatchmaking;

  const factory MatchLobbyState.waitingForOpponentToJoin({required LobbyParameters lobbyParameters}) =
      MatchLobbyWaitingForOpponentToJoin;
}

extension MatchLobbyStateX on MatchLobbyState {
  ///this getter is to quantify the state level on the flow of the match lobby bloc
  ///that's necessary to restore the the match lobby's state without conflicts
  int get quantificationLevel {
    if (this is MatchLobbyGameInProgress || this is MatchLobbyAddResult) return 1;
    if (this is MatchLobbyAwaitingConfirmation || this is MatchLobbyConfirmResult) return 2;
    if (this is MatchLobbyDisputeInProgress) return 3;
    if (this is MatchLobbyGameOver) return 4;
    return 0;
  }
}
