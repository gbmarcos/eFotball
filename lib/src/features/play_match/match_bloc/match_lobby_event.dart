
import 'package:fifa/src/common/domain/match/match.dart';
import 'package:fifa/src/common/domain/user/user.dart';
import 'package:fifa/src/features/match/model/match.dart';
import 'package:fifa/src/features/play_match/lobby/match_lobby_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'match_lobby_event.freezed.dart';

@freezed
class MatchLobbyEvent with _$MatchLobbyEvent {
  const MatchLobbyEvent._();
  //DIALOG EVENTS
  /// Open dialog
  const factory MatchLobbyEvent.checkInNotification({
    required LobbyCheckIn lobbyCheckIn,
  }) = MatchLobbyCheckInNotification;

  /// leave match
  const factory MatchLobbyEvent.leave({
    required int lobbyId,
  }) = MatchLobbyLeave;

  /// If [silent] is true then  loading state will be
  const factory MatchLobbyEvent.restoreState(
      {required User user, required ActiveMatch activeMatch, @Default(false) bool silent}) = MatchLobbyRestoreState;

  /// Virtually identical to [MatchLobbyRestoreState], it re-hydrates the state of a match when you do not have its id
  /// but do have its lobby [lobbyId] and [tournamentId].
  /// NOTE: It calls [MatchLobbyRestoreState] after retrieving the match Id
  const factory MatchLobbyEvent.restoreStateFromNotification(
      {required User user, required int tournamentId, required int lobbyId}) = MatchLobbyRestoreStateFromNotification;
  //DIALOG EVENTS

  /// check into a match
  const factory MatchLobbyEvent.join({
    required LobbyParameters lobbyParameters,
  }) = MatchLobbyJoin;

  //Already checked into a match
  const factory MatchLobbyEvent.opponentCheckedIn({
    required int? matchId,
    required LobbyParameters lobbyParameters,
    @Default(false) bool silent,
  }) = MatchLobbyOpponentCheckedIn;

  const factory MatchLobbyEvent.opponentSubmittedScore({
    required MatchLobbyData matchLobbyData,
    required MatchMakingMatch match,
  }) = MatchLobbyOpponentSubmittedScore;

  const factory MatchLobbyEvent.scoreConfirmed({
    required MatchLobbyData matchLobbyData,
    required MatchMakingMatch match,
  }) = MatchLobbyOpponentConfirmedScore;

  const factory MatchLobbyEvent.goToScoreSubmissionPage({
    required MatchLobbyData matchLobbyData,
  }) = MatchLobbyGoToScoreSubmissionPage;

  const factory MatchLobbyEvent.submitScore({
    required MatchLobbyData matchLobbyData,
    required int score1,
    required int score2,
  }) = MatchLobbySubmitScore;

  const factory MatchLobbyEvent.acceptScore({
    required MatchScores matchScores,
    required MatchLobbyData matchLobbyData,
  }) = MatchLobbyAcceptScore;

  const factory MatchLobbyEvent.disputeScore({
    required MatchLobbyData matchLobbyData,
  }) = MatchLobbyDisputeScore;

  const factory MatchLobbyEvent.close() = MatchLobbyClose;

  const factory MatchLobbyEvent.matchmaking({
    required int tournamentId,
  }) = MatchLobbyMatchmaking;
}
