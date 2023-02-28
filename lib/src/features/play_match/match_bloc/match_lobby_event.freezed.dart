// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'match_lobby_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MatchLobbyEventTearOff {
  const _$MatchLobbyEventTearOff();

  MatchLobbyCheckInNotification checkInNotification(
      {required LobbyCheckIn lobbyCheckIn}) {
    return MatchLobbyCheckInNotification(
      lobbyCheckIn: lobbyCheckIn,
    );
  }

  MatchLobbyLeave leave({required int lobbyId}) {
    return MatchLobbyLeave(
      lobbyId: lobbyId,
    );
  }

  MatchLobbyRestoreState restoreState(
      {required User user,
      required ActiveMatch activeMatch,
      bool silent = false}) {
    return MatchLobbyRestoreState(
      user: user,
      activeMatch: activeMatch,
      silent: silent,
    );
  }

  MatchLobbyRestoreStateFromNotification restoreStateFromNotification(
      {required User user, required int tournamentId, required int lobbyId}) {
    return MatchLobbyRestoreStateFromNotification(
      user: user,
      tournamentId: tournamentId,
      lobbyId: lobbyId,
    );
  }

  MatchLobbyJoin join({required LobbyParameters lobbyParameters}) {
    return MatchLobbyJoin(
      lobbyParameters: lobbyParameters,
    );
  }

  MatchLobbyOpponentCheckedIn opponentCheckedIn(
      {required int? matchId,
      required LobbyParameters lobbyParameters,
      bool silent = false}) {
    return MatchLobbyOpponentCheckedIn(
      matchId: matchId,
      lobbyParameters: lobbyParameters,
      silent: silent,
    );
  }

  MatchLobbyOpponentSubmittedScore opponentSubmittedScore(
      {required MatchLobbyData matchLobbyData,
      required MatchMakingMatch match}) {
    return MatchLobbyOpponentSubmittedScore(
      matchLobbyData: matchLobbyData,
      match: match,
    );
  }

  MatchLobbyOpponentConfirmedScore scoreConfirmed(
      {required MatchLobbyData matchLobbyData,
      required MatchMakingMatch match}) {
    return MatchLobbyOpponentConfirmedScore(
      matchLobbyData: matchLobbyData,
      match: match,
    );
  }

  MatchLobbyGoToScoreSubmissionPage goToScoreSubmissionPage(
      {required MatchLobbyData matchLobbyData}) {
    return MatchLobbyGoToScoreSubmissionPage(
      matchLobbyData: matchLobbyData,
    );
  }

  MatchLobbySubmitScore submitScore(
      {required MatchLobbyData matchLobbyData,
      required int score1,
      required int score2}) {
    return MatchLobbySubmitScore(
      matchLobbyData: matchLobbyData,
      score1: score1,
      score2: score2,
    );
  }

  MatchLobbyAcceptScore acceptScore(
      {required MatchScores matchScores,
      required MatchLobbyData matchLobbyData}) {
    return MatchLobbyAcceptScore(
      matchScores: matchScores,
      matchLobbyData: matchLobbyData,
    );
  }

  MatchLobbyDisputeScore disputeScore(
      {required MatchLobbyData matchLobbyData}) {
    return MatchLobbyDisputeScore(
      matchLobbyData: matchLobbyData,
    );
  }

  MatchLobbyClose close() {
    return const MatchLobbyClose();
  }

  MatchLobbyMatchmaking matchmaking({required int tournamentId}) {
    return MatchLobbyMatchmaking(
      tournamentId: tournamentId,
    );
  }
}

/// @nodoc
const $MatchLobbyEvent = _$MatchLobbyEventTearOff();

/// @nodoc
mixin _$MatchLobbyEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LobbyCheckIn lobbyCheckIn) checkInNotification,
    required TResult Function(int lobbyId) leave,
    required TResult Function(User user, ActiveMatch activeMatch, bool silent)
        restoreState,
    required TResult Function(User user, int tournamentId, int lobbyId)
        restoreStateFromNotification,
    required TResult Function(LobbyParameters lobbyParameters) join,
    required TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)
        opponentCheckedIn,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchMakingMatch match)
        opponentSubmittedScore,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchMakingMatch match)
        scoreConfirmed,
    required TResult Function(MatchLobbyData matchLobbyData)
        goToScoreSubmissionPage,
    required TResult Function(
            MatchLobbyData matchLobbyData, int score1, int score2)
        submitScore,
    required TResult Function(
            MatchScores matchScores, MatchLobbyData matchLobbyData)
        acceptScore,
    required TResult Function(MatchLobbyData matchLobbyData) disputeScore,
    required TResult Function() close,
    required TResult Function(int tournamentId) matchmaking,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LobbyCheckIn lobbyCheckIn)? checkInNotification,
    TResult Function(int lobbyId)? leave,
    TResult Function(User user, ActiveMatch activeMatch, bool silent)?
        restoreState,
    TResult Function(User user, int tournamentId, int lobbyId)?
        restoreStateFromNotification,
    TResult Function(LobbyParameters lobbyParameters)? join,
    TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)?
        opponentCheckedIn,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        scoreConfirmed,
    TResult Function(MatchLobbyData matchLobbyData)? goToScoreSubmissionPage,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        submitScore,
    TResult Function(MatchScores matchScores, MatchLobbyData matchLobbyData)?
        acceptScore,
    TResult Function(MatchLobbyData matchLobbyData)? disputeScore,
    TResult Function()? close,
    TResult Function(int tournamentId)? matchmaking,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LobbyCheckIn lobbyCheckIn)? checkInNotification,
    TResult Function(int lobbyId)? leave,
    TResult Function(User user, ActiveMatch activeMatch, bool silent)?
        restoreState,
    TResult Function(User user, int tournamentId, int lobbyId)?
        restoreStateFromNotification,
    TResult Function(LobbyParameters lobbyParameters)? join,
    TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)?
        opponentCheckedIn,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        scoreConfirmed,
    TResult Function(MatchLobbyData matchLobbyData)? goToScoreSubmissionPage,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        submitScore,
    TResult Function(MatchScores matchScores, MatchLobbyData matchLobbyData)?
        acceptScore,
    TResult Function(MatchLobbyData matchLobbyData)? disputeScore,
    TResult Function()? close,
    TResult Function(int tournamentId)? matchmaking,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MatchLobbyCheckInNotification value)
        checkInNotification,
    required TResult Function(MatchLobbyLeave value) leave,
    required TResult Function(MatchLobbyRestoreState value) restoreState,
    required TResult Function(MatchLobbyRestoreStateFromNotification value)
        restoreStateFromNotification,
    required TResult Function(MatchLobbyJoin value) join,
    required TResult Function(MatchLobbyOpponentCheckedIn value)
        opponentCheckedIn,
    required TResult Function(MatchLobbyOpponentSubmittedScore value)
        opponentSubmittedScore,
    required TResult Function(MatchLobbyOpponentConfirmedScore value)
        scoreConfirmed,
    required TResult Function(MatchLobbyGoToScoreSubmissionPage value)
        goToScoreSubmissionPage,
    required TResult Function(MatchLobbySubmitScore value) submitScore,
    required TResult Function(MatchLobbyAcceptScore value) acceptScore,
    required TResult Function(MatchLobbyDisputeScore value) disputeScore,
    required TResult Function(MatchLobbyClose value) close,
    required TResult Function(MatchLobbyMatchmaking value) matchmaking,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MatchLobbyCheckInNotification value)? checkInNotification,
    TResult Function(MatchLobbyLeave value)? leave,
    TResult Function(MatchLobbyRestoreState value)? restoreState,
    TResult Function(MatchLobbyRestoreStateFromNotification value)?
        restoreStateFromNotification,
    TResult Function(MatchLobbyJoin value)? join,
    TResult Function(MatchLobbyOpponentCheckedIn value)? opponentCheckedIn,
    TResult Function(MatchLobbyOpponentSubmittedScore value)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyOpponentConfirmedScore value)? scoreConfirmed,
    TResult Function(MatchLobbyGoToScoreSubmissionPage value)?
        goToScoreSubmissionPage,
    TResult Function(MatchLobbySubmitScore value)? submitScore,
    TResult Function(MatchLobbyAcceptScore value)? acceptScore,
    TResult Function(MatchLobbyDisputeScore value)? disputeScore,
    TResult Function(MatchLobbyClose value)? close,
    TResult Function(MatchLobbyMatchmaking value)? matchmaking,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MatchLobbyCheckInNotification value)? checkInNotification,
    TResult Function(MatchLobbyLeave value)? leave,
    TResult Function(MatchLobbyRestoreState value)? restoreState,
    TResult Function(MatchLobbyRestoreStateFromNotification value)?
        restoreStateFromNotification,
    TResult Function(MatchLobbyJoin value)? join,
    TResult Function(MatchLobbyOpponentCheckedIn value)? opponentCheckedIn,
    TResult Function(MatchLobbyOpponentSubmittedScore value)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyOpponentConfirmedScore value)? scoreConfirmed,
    TResult Function(MatchLobbyGoToScoreSubmissionPage value)?
        goToScoreSubmissionPage,
    TResult Function(MatchLobbySubmitScore value)? submitScore,
    TResult Function(MatchLobbyAcceptScore value)? acceptScore,
    TResult Function(MatchLobbyDisputeScore value)? disputeScore,
    TResult Function(MatchLobbyClose value)? close,
    TResult Function(MatchLobbyMatchmaking value)? matchmaking,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchLobbyEventCopyWith<$Res> {
  factory $MatchLobbyEventCopyWith(
          MatchLobbyEvent value, $Res Function(MatchLobbyEvent) then) =
      _$MatchLobbyEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$MatchLobbyEventCopyWithImpl<$Res>
    implements $MatchLobbyEventCopyWith<$Res> {
  _$MatchLobbyEventCopyWithImpl(this._value, this._then);

  final MatchLobbyEvent _value;
  // ignore: unused_field
  final $Res Function(MatchLobbyEvent) _then;
}

/// @nodoc
abstract class $MatchLobbyCheckInNotificationCopyWith<$Res> {
  factory $MatchLobbyCheckInNotificationCopyWith(
          MatchLobbyCheckInNotification value,
          $Res Function(MatchLobbyCheckInNotification) then) =
      _$MatchLobbyCheckInNotificationCopyWithImpl<$Res>;
  $Res call({LobbyCheckIn lobbyCheckIn});
}

/// @nodoc
class _$MatchLobbyCheckInNotificationCopyWithImpl<$Res>
    extends _$MatchLobbyEventCopyWithImpl<$Res>
    implements $MatchLobbyCheckInNotificationCopyWith<$Res> {
  _$MatchLobbyCheckInNotificationCopyWithImpl(
      MatchLobbyCheckInNotification _value,
      $Res Function(MatchLobbyCheckInNotification) _then)
      : super(_value, (v) => _then(v as MatchLobbyCheckInNotification));

  @override
  MatchLobbyCheckInNotification get _value =>
      super._value as MatchLobbyCheckInNotification;

  @override
  $Res call({
    Object? lobbyCheckIn = freezed,
  }) {
    return _then(MatchLobbyCheckInNotification(
      lobbyCheckIn: lobbyCheckIn == freezed
          ? _value.lobbyCheckIn
          : lobbyCheckIn // ignore: cast_nullable_to_non_nullable
              as LobbyCheckIn,
    ));
  }
}

/// @nodoc

class _$MatchLobbyCheckInNotification extends MatchLobbyCheckInNotification
    with DiagnosticableTreeMixin {
  const _$MatchLobbyCheckInNotification({required this.lobbyCheckIn})
      : super._();

  @override
  final LobbyCheckIn lobbyCheckIn;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MatchLobbyEvent.checkInNotification(lobbyCheckIn: $lobbyCheckIn)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MatchLobbyEvent.checkInNotification'))
      ..add(DiagnosticsProperty('lobbyCheckIn', lobbyCheckIn));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MatchLobbyCheckInNotification &&
            const DeepCollectionEquality()
                .equals(other.lobbyCheckIn, lobbyCheckIn));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(lobbyCheckIn));

  @JsonKey(ignore: true)
  @override
  $MatchLobbyCheckInNotificationCopyWith<MatchLobbyCheckInNotification>
      get copyWith => _$MatchLobbyCheckInNotificationCopyWithImpl<
          MatchLobbyCheckInNotification>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LobbyCheckIn lobbyCheckIn) checkInNotification,
    required TResult Function(int lobbyId) leave,
    required TResult Function(User user, ActiveMatch activeMatch, bool silent)
        restoreState,
    required TResult Function(User user, int tournamentId, int lobbyId)
        restoreStateFromNotification,
    required TResult Function(LobbyParameters lobbyParameters) join,
    required TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)
        opponentCheckedIn,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchMakingMatch match)
        opponentSubmittedScore,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchMakingMatch match)
        scoreConfirmed,
    required TResult Function(MatchLobbyData matchLobbyData)
        goToScoreSubmissionPage,
    required TResult Function(
            MatchLobbyData matchLobbyData, int score1, int score2)
        submitScore,
    required TResult Function(
            MatchScores matchScores, MatchLobbyData matchLobbyData)
        acceptScore,
    required TResult Function(MatchLobbyData matchLobbyData) disputeScore,
    required TResult Function() close,
    required TResult Function(int tournamentId) matchmaking,
  }) {
    return checkInNotification(lobbyCheckIn);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LobbyCheckIn lobbyCheckIn)? checkInNotification,
    TResult Function(int lobbyId)? leave,
    TResult Function(User user, ActiveMatch activeMatch, bool silent)?
        restoreState,
    TResult Function(User user, int tournamentId, int lobbyId)?
        restoreStateFromNotification,
    TResult Function(LobbyParameters lobbyParameters)? join,
    TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)?
        opponentCheckedIn,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        scoreConfirmed,
    TResult Function(MatchLobbyData matchLobbyData)? goToScoreSubmissionPage,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        submitScore,
    TResult Function(MatchScores matchScores, MatchLobbyData matchLobbyData)?
        acceptScore,
    TResult Function(MatchLobbyData matchLobbyData)? disputeScore,
    TResult Function()? close,
    TResult Function(int tournamentId)? matchmaking,
  }) {
    return checkInNotification?.call(lobbyCheckIn);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LobbyCheckIn lobbyCheckIn)? checkInNotification,
    TResult Function(int lobbyId)? leave,
    TResult Function(User user, ActiveMatch activeMatch, bool silent)?
        restoreState,
    TResult Function(User user, int tournamentId, int lobbyId)?
        restoreStateFromNotification,
    TResult Function(LobbyParameters lobbyParameters)? join,
    TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)?
        opponentCheckedIn,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        scoreConfirmed,
    TResult Function(MatchLobbyData matchLobbyData)? goToScoreSubmissionPage,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        submitScore,
    TResult Function(MatchScores matchScores, MatchLobbyData matchLobbyData)?
        acceptScore,
    TResult Function(MatchLobbyData matchLobbyData)? disputeScore,
    TResult Function()? close,
    TResult Function(int tournamentId)? matchmaking,
    required TResult orElse(),
  }) {
    if (checkInNotification != null) {
      return checkInNotification(lobbyCheckIn);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MatchLobbyCheckInNotification value)
        checkInNotification,
    required TResult Function(MatchLobbyLeave value) leave,
    required TResult Function(MatchLobbyRestoreState value) restoreState,
    required TResult Function(MatchLobbyRestoreStateFromNotification value)
        restoreStateFromNotification,
    required TResult Function(MatchLobbyJoin value) join,
    required TResult Function(MatchLobbyOpponentCheckedIn value)
        opponentCheckedIn,
    required TResult Function(MatchLobbyOpponentSubmittedScore value)
        opponentSubmittedScore,
    required TResult Function(MatchLobbyOpponentConfirmedScore value)
        scoreConfirmed,
    required TResult Function(MatchLobbyGoToScoreSubmissionPage value)
        goToScoreSubmissionPage,
    required TResult Function(MatchLobbySubmitScore value) submitScore,
    required TResult Function(MatchLobbyAcceptScore value) acceptScore,
    required TResult Function(MatchLobbyDisputeScore value) disputeScore,
    required TResult Function(MatchLobbyClose value) close,
    required TResult Function(MatchLobbyMatchmaking value) matchmaking,
  }) {
    return checkInNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MatchLobbyCheckInNotification value)? checkInNotification,
    TResult Function(MatchLobbyLeave value)? leave,
    TResult Function(MatchLobbyRestoreState value)? restoreState,
    TResult Function(MatchLobbyRestoreStateFromNotification value)?
        restoreStateFromNotification,
    TResult Function(MatchLobbyJoin value)? join,
    TResult Function(MatchLobbyOpponentCheckedIn value)? opponentCheckedIn,
    TResult Function(MatchLobbyOpponentSubmittedScore value)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyOpponentConfirmedScore value)? scoreConfirmed,
    TResult Function(MatchLobbyGoToScoreSubmissionPage value)?
        goToScoreSubmissionPage,
    TResult Function(MatchLobbySubmitScore value)? submitScore,
    TResult Function(MatchLobbyAcceptScore value)? acceptScore,
    TResult Function(MatchLobbyDisputeScore value)? disputeScore,
    TResult Function(MatchLobbyClose value)? close,
    TResult Function(MatchLobbyMatchmaking value)? matchmaking,
  }) {
    return checkInNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MatchLobbyCheckInNotification value)? checkInNotification,
    TResult Function(MatchLobbyLeave value)? leave,
    TResult Function(MatchLobbyRestoreState value)? restoreState,
    TResult Function(MatchLobbyRestoreStateFromNotification value)?
        restoreStateFromNotification,
    TResult Function(MatchLobbyJoin value)? join,
    TResult Function(MatchLobbyOpponentCheckedIn value)? opponentCheckedIn,
    TResult Function(MatchLobbyOpponentSubmittedScore value)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyOpponentConfirmedScore value)? scoreConfirmed,
    TResult Function(MatchLobbyGoToScoreSubmissionPage value)?
        goToScoreSubmissionPage,
    TResult Function(MatchLobbySubmitScore value)? submitScore,
    TResult Function(MatchLobbyAcceptScore value)? acceptScore,
    TResult Function(MatchLobbyDisputeScore value)? disputeScore,
    TResult Function(MatchLobbyClose value)? close,
    TResult Function(MatchLobbyMatchmaking value)? matchmaking,
    required TResult orElse(),
  }) {
    if (checkInNotification != null) {
      return checkInNotification(this);
    }
    return orElse();
  }
}

abstract class MatchLobbyCheckInNotification extends MatchLobbyEvent {
  const factory MatchLobbyCheckInNotification(
      {required LobbyCheckIn lobbyCheckIn}) = _$MatchLobbyCheckInNotification;
  const MatchLobbyCheckInNotification._() : super._();

  LobbyCheckIn get lobbyCheckIn;
  @JsonKey(ignore: true)
  $MatchLobbyCheckInNotificationCopyWith<MatchLobbyCheckInNotification>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchLobbyLeaveCopyWith<$Res> {
  factory $MatchLobbyLeaveCopyWith(
          MatchLobbyLeave value, $Res Function(MatchLobbyLeave) then) =
      _$MatchLobbyLeaveCopyWithImpl<$Res>;
  $Res call({int lobbyId});
}

/// @nodoc
class _$MatchLobbyLeaveCopyWithImpl<$Res>
    extends _$MatchLobbyEventCopyWithImpl<$Res>
    implements $MatchLobbyLeaveCopyWith<$Res> {
  _$MatchLobbyLeaveCopyWithImpl(
      MatchLobbyLeave _value, $Res Function(MatchLobbyLeave) _then)
      : super(_value, (v) => _then(v as MatchLobbyLeave));

  @override
  MatchLobbyLeave get _value => super._value as MatchLobbyLeave;

  @override
  $Res call({
    Object? lobbyId = freezed,
  }) {
    return _then(MatchLobbyLeave(
      lobbyId: lobbyId == freezed
          ? _value.lobbyId
          : lobbyId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$MatchLobbyLeave extends MatchLobbyLeave with DiagnosticableTreeMixin {
  const _$MatchLobbyLeave({required this.lobbyId}) : super._();

  @override
  final int lobbyId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MatchLobbyEvent.leave(lobbyId: $lobbyId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MatchLobbyEvent.leave'))
      ..add(DiagnosticsProperty('lobbyId', lobbyId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MatchLobbyLeave &&
            const DeepCollectionEquality().equals(other.lobbyId, lobbyId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(lobbyId));

  @JsonKey(ignore: true)
  @override
  $MatchLobbyLeaveCopyWith<MatchLobbyLeave> get copyWith =>
      _$MatchLobbyLeaveCopyWithImpl<MatchLobbyLeave>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LobbyCheckIn lobbyCheckIn) checkInNotification,
    required TResult Function(int lobbyId) leave,
    required TResult Function(User user, ActiveMatch activeMatch, bool silent)
        restoreState,
    required TResult Function(User user, int tournamentId, int lobbyId)
        restoreStateFromNotification,
    required TResult Function(LobbyParameters lobbyParameters) join,
    required TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)
        opponentCheckedIn,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchMakingMatch match)
        opponentSubmittedScore,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchMakingMatch match)
        scoreConfirmed,
    required TResult Function(MatchLobbyData matchLobbyData)
        goToScoreSubmissionPage,
    required TResult Function(
            MatchLobbyData matchLobbyData, int score1, int score2)
        submitScore,
    required TResult Function(
            MatchScores matchScores, MatchLobbyData matchLobbyData)
        acceptScore,
    required TResult Function(MatchLobbyData matchLobbyData) disputeScore,
    required TResult Function() close,
    required TResult Function(int tournamentId) matchmaking,
  }) {
    return leave(lobbyId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LobbyCheckIn lobbyCheckIn)? checkInNotification,
    TResult Function(int lobbyId)? leave,
    TResult Function(User user, ActiveMatch activeMatch, bool silent)?
        restoreState,
    TResult Function(User user, int tournamentId, int lobbyId)?
        restoreStateFromNotification,
    TResult Function(LobbyParameters lobbyParameters)? join,
    TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)?
        opponentCheckedIn,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        scoreConfirmed,
    TResult Function(MatchLobbyData matchLobbyData)? goToScoreSubmissionPage,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        submitScore,
    TResult Function(MatchScores matchScores, MatchLobbyData matchLobbyData)?
        acceptScore,
    TResult Function(MatchLobbyData matchLobbyData)? disputeScore,
    TResult Function()? close,
    TResult Function(int tournamentId)? matchmaking,
  }) {
    return leave?.call(lobbyId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LobbyCheckIn lobbyCheckIn)? checkInNotification,
    TResult Function(int lobbyId)? leave,
    TResult Function(User user, ActiveMatch activeMatch, bool silent)?
        restoreState,
    TResult Function(User user, int tournamentId, int lobbyId)?
        restoreStateFromNotification,
    TResult Function(LobbyParameters lobbyParameters)? join,
    TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)?
        opponentCheckedIn,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        scoreConfirmed,
    TResult Function(MatchLobbyData matchLobbyData)? goToScoreSubmissionPage,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        submitScore,
    TResult Function(MatchScores matchScores, MatchLobbyData matchLobbyData)?
        acceptScore,
    TResult Function(MatchLobbyData matchLobbyData)? disputeScore,
    TResult Function()? close,
    TResult Function(int tournamentId)? matchmaking,
    required TResult orElse(),
  }) {
    if (leave != null) {
      return leave(lobbyId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MatchLobbyCheckInNotification value)
        checkInNotification,
    required TResult Function(MatchLobbyLeave value) leave,
    required TResult Function(MatchLobbyRestoreState value) restoreState,
    required TResult Function(MatchLobbyRestoreStateFromNotification value)
        restoreStateFromNotification,
    required TResult Function(MatchLobbyJoin value) join,
    required TResult Function(MatchLobbyOpponentCheckedIn value)
        opponentCheckedIn,
    required TResult Function(MatchLobbyOpponentSubmittedScore value)
        opponentSubmittedScore,
    required TResult Function(MatchLobbyOpponentConfirmedScore value)
        scoreConfirmed,
    required TResult Function(MatchLobbyGoToScoreSubmissionPage value)
        goToScoreSubmissionPage,
    required TResult Function(MatchLobbySubmitScore value) submitScore,
    required TResult Function(MatchLobbyAcceptScore value) acceptScore,
    required TResult Function(MatchLobbyDisputeScore value) disputeScore,
    required TResult Function(MatchLobbyClose value) close,
    required TResult Function(MatchLobbyMatchmaking value) matchmaking,
  }) {
    return leave(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MatchLobbyCheckInNotification value)? checkInNotification,
    TResult Function(MatchLobbyLeave value)? leave,
    TResult Function(MatchLobbyRestoreState value)? restoreState,
    TResult Function(MatchLobbyRestoreStateFromNotification value)?
        restoreStateFromNotification,
    TResult Function(MatchLobbyJoin value)? join,
    TResult Function(MatchLobbyOpponentCheckedIn value)? opponentCheckedIn,
    TResult Function(MatchLobbyOpponentSubmittedScore value)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyOpponentConfirmedScore value)? scoreConfirmed,
    TResult Function(MatchLobbyGoToScoreSubmissionPage value)?
        goToScoreSubmissionPage,
    TResult Function(MatchLobbySubmitScore value)? submitScore,
    TResult Function(MatchLobbyAcceptScore value)? acceptScore,
    TResult Function(MatchLobbyDisputeScore value)? disputeScore,
    TResult Function(MatchLobbyClose value)? close,
    TResult Function(MatchLobbyMatchmaking value)? matchmaking,
  }) {
    return leave?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MatchLobbyCheckInNotification value)? checkInNotification,
    TResult Function(MatchLobbyLeave value)? leave,
    TResult Function(MatchLobbyRestoreState value)? restoreState,
    TResult Function(MatchLobbyRestoreStateFromNotification value)?
        restoreStateFromNotification,
    TResult Function(MatchLobbyJoin value)? join,
    TResult Function(MatchLobbyOpponentCheckedIn value)? opponentCheckedIn,
    TResult Function(MatchLobbyOpponentSubmittedScore value)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyOpponentConfirmedScore value)? scoreConfirmed,
    TResult Function(MatchLobbyGoToScoreSubmissionPage value)?
        goToScoreSubmissionPage,
    TResult Function(MatchLobbySubmitScore value)? submitScore,
    TResult Function(MatchLobbyAcceptScore value)? acceptScore,
    TResult Function(MatchLobbyDisputeScore value)? disputeScore,
    TResult Function(MatchLobbyClose value)? close,
    TResult Function(MatchLobbyMatchmaking value)? matchmaking,
    required TResult orElse(),
  }) {
    if (leave != null) {
      return leave(this);
    }
    return orElse();
  }
}

abstract class MatchLobbyLeave extends MatchLobbyEvent {
  const factory MatchLobbyLeave({required int lobbyId}) = _$MatchLobbyLeave;
  const MatchLobbyLeave._() : super._();

  int get lobbyId;
  @JsonKey(ignore: true)
  $MatchLobbyLeaveCopyWith<MatchLobbyLeave> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchLobbyRestoreStateCopyWith<$Res> {
  factory $MatchLobbyRestoreStateCopyWith(MatchLobbyRestoreState value,
          $Res Function(MatchLobbyRestoreState) then) =
      _$MatchLobbyRestoreStateCopyWithImpl<$Res>;
  $Res call({User user, ActiveMatch activeMatch, bool silent});

  $UserCopyWith<$Res> get user;
  $ActiveMatchCopyWith<$Res> get activeMatch;
}

/// @nodoc
class _$MatchLobbyRestoreStateCopyWithImpl<$Res>
    extends _$MatchLobbyEventCopyWithImpl<$Res>
    implements $MatchLobbyRestoreStateCopyWith<$Res> {
  _$MatchLobbyRestoreStateCopyWithImpl(MatchLobbyRestoreState _value,
      $Res Function(MatchLobbyRestoreState) _then)
      : super(_value, (v) => _then(v as MatchLobbyRestoreState));

  @override
  MatchLobbyRestoreState get _value => super._value as MatchLobbyRestoreState;

  @override
  $Res call({
    Object? user = freezed,
    Object? activeMatch = freezed,
    Object? silent = freezed,
  }) {
    return _then(MatchLobbyRestoreState(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      activeMatch: activeMatch == freezed
          ? _value.activeMatch
          : activeMatch // ignore: cast_nullable_to_non_nullable
              as ActiveMatch,
      silent: silent == freezed
          ? _value.silent
          : silent // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }

  @override
  $ActiveMatchCopyWith<$Res> get activeMatch {
    return $ActiveMatchCopyWith<$Res>(_value.activeMatch, (value) {
      return _then(_value.copyWith(activeMatch: value));
    });
  }
}

/// @nodoc

class _$MatchLobbyRestoreState extends MatchLobbyRestoreState
    with DiagnosticableTreeMixin {
  const _$MatchLobbyRestoreState(
      {required this.user, required this.activeMatch, this.silent = false})
      : super._();

  @override
  final User user;
  @override
  final ActiveMatch activeMatch;
  @JsonKey()
  @override
  final bool silent;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MatchLobbyEvent.restoreState(user: $user, activeMatch: $activeMatch, silent: $silent)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MatchLobbyEvent.restoreState'))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('activeMatch', activeMatch))
      ..add(DiagnosticsProperty('silent', silent));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MatchLobbyRestoreState &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality()
                .equals(other.activeMatch, activeMatch) &&
            const DeepCollectionEquality().equals(other.silent, silent));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(activeMatch),
      const DeepCollectionEquality().hash(silent));

  @JsonKey(ignore: true)
  @override
  $MatchLobbyRestoreStateCopyWith<MatchLobbyRestoreState> get copyWith =>
      _$MatchLobbyRestoreStateCopyWithImpl<MatchLobbyRestoreState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LobbyCheckIn lobbyCheckIn) checkInNotification,
    required TResult Function(int lobbyId) leave,
    required TResult Function(User user, ActiveMatch activeMatch, bool silent)
        restoreState,
    required TResult Function(User user, int tournamentId, int lobbyId)
        restoreStateFromNotification,
    required TResult Function(LobbyParameters lobbyParameters) join,
    required TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)
        opponentCheckedIn,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchMakingMatch match)
        opponentSubmittedScore,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchMakingMatch match)
        scoreConfirmed,
    required TResult Function(MatchLobbyData matchLobbyData)
        goToScoreSubmissionPage,
    required TResult Function(
            MatchLobbyData matchLobbyData, int score1, int score2)
        submitScore,
    required TResult Function(
            MatchScores matchScores, MatchLobbyData matchLobbyData)
        acceptScore,
    required TResult Function(MatchLobbyData matchLobbyData) disputeScore,
    required TResult Function() close,
    required TResult Function(int tournamentId) matchmaking,
  }) {
    return restoreState(user, activeMatch, silent);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LobbyCheckIn lobbyCheckIn)? checkInNotification,
    TResult Function(int lobbyId)? leave,
    TResult Function(User user, ActiveMatch activeMatch, bool silent)?
        restoreState,
    TResult Function(User user, int tournamentId, int lobbyId)?
        restoreStateFromNotification,
    TResult Function(LobbyParameters lobbyParameters)? join,
    TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)?
        opponentCheckedIn,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        scoreConfirmed,
    TResult Function(MatchLobbyData matchLobbyData)? goToScoreSubmissionPage,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        submitScore,
    TResult Function(MatchScores matchScores, MatchLobbyData matchLobbyData)?
        acceptScore,
    TResult Function(MatchLobbyData matchLobbyData)? disputeScore,
    TResult Function()? close,
    TResult Function(int tournamentId)? matchmaking,
  }) {
    return restoreState?.call(user, activeMatch, silent);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LobbyCheckIn lobbyCheckIn)? checkInNotification,
    TResult Function(int lobbyId)? leave,
    TResult Function(User user, ActiveMatch activeMatch, bool silent)?
        restoreState,
    TResult Function(User user, int tournamentId, int lobbyId)?
        restoreStateFromNotification,
    TResult Function(LobbyParameters lobbyParameters)? join,
    TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)?
        opponentCheckedIn,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        scoreConfirmed,
    TResult Function(MatchLobbyData matchLobbyData)? goToScoreSubmissionPage,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        submitScore,
    TResult Function(MatchScores matchScores, MatchLobbyData matchLobbyData)?
        acceptScore,
    TResult Function(MatchLobbyData matchLobbyData)? disputeScore,
    TResult Function()? close,
    TResult Function(int tournamentId)? matchmaking,
    required TResult orElse(),
  }) {
    if (restoreState != null) {
      return restoreState(user, activeMatch, silent);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MatchLobbyCheckInNotification value)
        checkInNotification,
    required TResult Function(MatchLobbyLeave value) leave,
    required TResult Function(MatchLobbyRestoreState value) restoreState,
    required TResult Function(MatchLobbyRestoreStateFromNotification value)
        restoreStateFromNotification,
    required TResult Function(MatchLobbyJoin value) join,
    required TResult Function(MatchLobbyOpponentCheckedIn value)
        opponentCheckedIn,
    required TResult Function(MatchLobbyOpponentSubmittedScore value)
        opponentSubmittedScore,
    required TResult Function(MatchLobbyOpponentConfirmedScore value)
        scoreConfirmed,
    required TResult Function(MatchLobbyGoToScoreSubmissionPage value)
        goToScoreSubmissionPage,
    required TResult Function(MatchLobbySubmitScore value) submitScore,
    required TResult Function(MatchLobbyAcceptScore value) acceptScore,
    required TResult Function(MatchLobbyDisputeScore value) disputeScore,
    required TResult Function(MatchLobbyClose value) close,
    required TResult Function(MatchLobbyMatchmaking value) matchmaking,
  }) {
    return restoreState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MatchLobbyCheckInNotification value)? checkInNotification,
    TResult Function(MatchLobbyLeave value)? leave,
    TResult Function(MatchLobbyRestoreState value)? restoreState,
    TResult Function(MatchLobbyRestoreStateFromNotification value)?
        restoreStateFromNotification,
    TResult Function(MatchLobbyJoin value)? join,
    TResult Function(MatchLobbyOpponentCheckedIn value)? opponentCheckedIn,
    TResult Function(MatchLobbyOpponentSubmittedScore value)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyOpponentConfirmedScore value)? scoreConfirmed,
    TResult Function(MatchLobbyGoToScoreSubmissionPage value)?
        goToScoreSubmissionPage,
    TResult Function(MatchLobbySubmitScore value)? submitScore,
    TResult Function(MatchLobbyAcceptScore value)? acceptScore,
    TResult Function(MatchLobbyDisputeScore value)? disputeScore,
    TResult Function(MatchLobbyClose value)? close,
    TResult Function(MatchLobbyMatchmaking value)? matchmaking,
  }) {
    return restoreState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MatchLobbyCheckInNotification value)? checkInNotification,
    TResult Function(MatchLobbyLeave value)? leave,
    TResult Function(MatchLobbyRestoreState value)? restoreState,
    TResult Function(MatchLobbyRestoreStateFromNotification value)?
        restoreStateFromNotification,
    TResult Function(MatchLobbyJoin value)? join,
    TResult Function(MatchLobbyOpponentCheckedIn value)? opponentCheckedIn,
    TResult Function(MatchLobbyOpponentSubmittedScore value)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyOpponentConfirmedScore value)? scoreConfirmed,
    TResult Function(MatchLobbyGoToScoreSubmissionPage value)?
        goToScoreSubmissionPage,
    TResult Function(MatchLobbySubmitScore value)? submitScore,
    TResult Function(MatchLobbyAcceptScore value)? acceptScore,
    TResult Function(MatchLobbyDisputeScore value)? disputeScore,
    TResult Function(MatchLobbyClose value)? close,
    TResult Function(MatchLobbyMatchmaking value)? matchmaking,
    required TResult orElse(),
  }) {
    if (restoreState != null) {
      return restoreState(this);
    }
    return orElse();
  }
}

abstract class MatchLobbyRestoreState extends MatchLobbyEvent {
  const factory MatchLobbyRestoreState(
      {required User user,
      required ActiveMatch activeMatch,
      bool silent}) = _$MatchLobbyRestoreState;
  const MatchLobbyRestoreState._() : super._();

  User get user;
  ActiveMatch get activeMatch;
  bool get silent;
  @JsonKey(ignore: true)
  $MatchLobbyRestoreStateCopyWith<MatchLobbyRestoreState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchLobbyRestoreStateFromNotificationCopyWith<$Res> {
  factory $MatchLobbyRestoreStateFromNotificationCopyWith(
          MatchLobbyRestoreStateFromNotification value,
          $Res Function(MatchLobbyRestoreStateFromNotification) then) =
      _$MatchLobbyRestoreStateFromNotificationCopyWithImpl<$Res>;
  $Res call({User user, int tournamentId, int lobbyId});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$MatchLobbyRestoreStateFromNotificationCopyWithImpl<$Res>
    extends _$MatchLobbyEventCopyWithImpl<$Res>
    implements $MatchLobbyRestoreStateFromNotificationCopyWith<$Res> {
  _$MatchLobbyRestoreStateFromNotificationCopyWithImpl(
      MatchLobbyRestoreStateFromNotification _value,
      $Res Function(MatchLobbyRestoreStateFromNotification) _then)
      : super(
            _value, (v) => _then(v as MatchLobbyRestoreStateFromNotification));

  @override
  MatchLobbyRestoreStateFromNotification get _value =>
      super._value as MatchLobbyRestoreStateFromNotification;

  @override
  $Res call({
    Object? user = freezed,
    Object? tournamentId = freezed,
    Object? lobbyId = freezed,
  }) {
    return _then(MatchLobbyRestoreStateFromNotification(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      tournamentId: tournamentId == freezed
          ? _value.tournamentId
          : tournamentId // ignore: cast_nullable_to_non_nullable
              as int,
      lobbyId: lobbyId == freezed
          ? _value.lobbyId
          : lobbyId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$MatchLobbyRestoreStateFromNotification
    extends MatchLobbyRestoreStateFromNotification
    with DiagnosticableTreeMixin {
  const _$MatchLobbyRestoreStateFromNotification(
      {required this.user, required this.tournamentId, required this.lobbyId})
      : super._();

  @override
  final User user;
  @override
  final int tournamentId;
  @override
  final int lobbyId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MatchLobbyEvent.restoreStateFromNotification(user: $user, tournamentId: $tournamentId, lobbyId: $lobbyId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'MatchLobbyEvent.restoreStateFromNotification'))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('tournamentId', tournamentId))
      ..add(DiagnosticsProperty('lobbyId', lobbyId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MatchLobbyRestoreStateFromNotification &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality()
                .equals(other.tournamentId, tournamentId) &&
            const DeepCollectionEquality().equals(other.lobbyId, lobbyId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(tournamentId),
      const DeepCollectionEquality().hash(lobbyId));

  @JsonKey(ignore: true)
  @override
  $MatchLobbyRestoreStateFromNotificationCopyWith<
          MatchLobbyRestoreStateFromNotification>
      get copyWith => _$MatchLobbyRestoreStateFromNotificationCopyWithImpl<
          MatchLobbyRestoreStateFromNotification>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LobbyCheckIn lobbyCheckIn) checkInNotification,
    required TResult Function(int lobbyId) leave,
    required TResult Function(User user, ActiveMatch activeMatch, bool silent)
        restoreState,
    required TResult Function(User user, int tournamentId, int lobbyId)
        restoreStateFromNotification,
    required TResult Function(LobbyParameters lobbyParameters) join,
    required TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)
        opponentCheckedIn,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchMakingMatch match)
        opponentSubmittedScore,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchMakingMatch match)
        scoreConfirmed,
    required TResult Function(MatchLobbyData matchLobbyData)
        goToScoreSubmissionPage,
    required TResult Function(
            MatchLobbyData matchLobbyData, int score1, int score2)
        submitScore,
    required TResult Function(
            MatchScores matchScores, MatchLobbyData matchLobbyData)
        acceptScore,
    required TResult Function(MatchLobbyData matchLobbyData) disputeScore,
    required TResult Function() close,
    required TResult Function(int tournamentId) matchmaking,
  }) {
    return restoreStateFromNotification(user, tournamentId, lobbyId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LobbyCheckIn lobbyCheckIn)? checkInNotification,
    TResult Function(int lobbyId)? leave,
    TResult Function(User user, ActiveMatch activeMatch, bool silent)?
        restoreState,
    TResult Function(User user, int tournamentId, int lobbyId)?
        restoreStateFromNotification,
    TResult Function(LobbyParameters lobbyParameters)? join,
    TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)?
        opponentCheckedIn,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        scoreConfirmed,
    TResult Function(MatchLobbyData matchLobbyData)? goToScoreSubmissionPage,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        submitScore,
    TResult Function(MatchScores matchScores, MatchLobbyData matchLobbyData)?
        acceptScore,
    TResult Function(MatchLobbyData matchLobbyData)? disputeScore,
    TResult Function()? close,
    TResult Function(int tournamentId)? matchmaking,
  }) {
    return restoreStateFromNotification?.call(user, tournamentId, lobbyId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LobbyCheckIn lobbyCheckIn)? checkInNotification,
    TResult Function(int lobbyId)? leave,
    TResult Function(User user, ActiveMatch activeMatch, bool silent)?
        restoreState,
    TResult Function(User user, int tournamentId, int lobbyId)?
        restoreStateFromNotification,
    TResult Function(LobbyParameters lobbyParameters)? join,
    TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)?
        opponentCheckedIn,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        scoreConfirmed,
    TResult Function(MatchLobbyData matchLobbyData)? goToScoreSubmissionPage,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        submitScore,
    TResult Function(MatchScores matchScores, MatchLobbyData matchLobbyData)?
        acceptScore,
    TResult Function(MatchLobbyData matchLobbyData)? disputeScore,
    TResult Function()? close,
    TResult Function(int tournamentId)? matchmaking,
    required TResult orElse(),
  }) {
    if (restoreStateFromNotification != null) {
      return restoreStateFromNotification(user, tournamentId, lobbyId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MatchLobbyCheckInNotification value)
        checkInNotification,
    required TResult Function(MatchLobbyLeave value) leave,
    required TResult Function(MatchLobbyRestoreState value) restoreState,
    required TResult Function(MatchLobbyRestoreStateFromNotification value)
        restoreStateFromNotification,
    required TResult Function(MatchLobbyJoin value) join,
    required TResult Function(MatchLobbyOpponentCheckedIn value)
        opponentCheckedIn,
    required TResult Function(MatchLobbyOpponentSubmittedScore value)
        opponentSubmittedScore,
    required TResult Function(MatchLobbyOpponentConfirmedScore value)
        scoreConfirmed,
    required TResult Function(MatchLobbyGoToScoreSubmissionPage value)
        goToScoreSubmissionPage,
    required TResult Function(MatchLobbySubmitScore value) submitScore,
    required TResult Function(MatchLobbyAcceptScore value) acceptScore,
    required TResult Function(MatchLobbyDisputeScore value) disputeScore,
    required TResult Function(MatchLobbyClose value) close,
    required TResult Function(MatchLobbyMatchmaking value) matchmaking,
  }) {
    return restoreStateFromNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MatchLobbyCheckInNotification value)? checkInNotification,
    TResult Function(MatchLobbyLeave value)? leave,
    TResult Function(MatchLobbyRestoreState value)? restoreState,
    TResult Function(MatchLobbyRestoreStateFromNotification value)?
        restoreStateFromNotification,
    TResult Function(MatchLobbyJoin value)? join,
    TResult Function(MatchLobbyOpponentCheckedIn value)? opponentCheckedIn,
    TResult Function(MatchLobbyOpponentSubmittedScore value)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyOpponentConfirmedScore value)? scoreConfirmed,
    TResult Function(MatchLobbyGoToScoreSubmissionPage value)?
        goToScoreSubmissionPage,
    TResult Function(MatchLobbySubmitScore value)? submitScore,
    TResult Function(MatchLobbyAcceptScore value)? acceptScore,
    TResult Function(MatchLobbyDisputeScore value)? disputeScore,
    TResult Function(MatchLobbyClose value)? close,
    TResult Function(MatchLobbyMatchmaking value)? matchmaking,
  }) {
    return restoreStateFromNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MatchLobbyCheckInNotification value)? checkInNotification,
    TResult Function(MatchLobbyLeave value)? leave,
    TResult Function(MatchLobbyRestoreState value)? restoreState,
    TResult Function(MatchLobbyRestoreStateFromNotification value)?
        restoreStateFromNotification,
    TResult Function(MatchLobbyJoin value)? join,
    TResult Function(MatchLobbyOpponentCheckedIn value)? opponentCheckedIn,
    TResult Function(MatchLobbyOpponentSubmittedScore value)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyOpponentConfirmedScore value)? scoreConfirmed,
    TResult Function(MatchLobbyGoToScoreSubmissionPage value)?
        goToScoreSubmissionPage,
    TResult Function(MatchLobbySubmitScore value)? submitScore,
    TResult Function(MatchLobbyAcceptScore value)? acceptScore,
    TResult Function(MatchLobbyDisputeScore value)? disputeScore,
    TResult Function(MatchLobbyClose value)? close,
    TResult Function(MatchLobbyMatchmaking value)? matchmaking,
    required TResult orElse(),
  }) {
    if (restoreStateFromNotification != null) {
      return restoreStateFromNotification(this);
    }
    return orElse();
  }
}

abstract class MatchLobbyRestoreStateFromNotification extends MatchLobbyEvent {
  const factory MatchLobbyRestoreStateFromNotification(
      {required User user,
      required int tournamentId,
      required int lobbyId}) = _$MatchLobbyRestoreStateFromNotification;
  const MatchLobbyRestoreStateFromNotification._() : super._();

  User get user;
  int get tournamentId;
  int get lobbyId;
  @JsonKey(ignore: true)
  $MatchLobbyRestoreStateFromNotificationCopyWith<
          MatchLobbyRestoreStateFromNotification>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchLobbyJoinCopyWith<$Res> {
  factory $MatchLobbyJoinCopyWith(
          MatchLobbyJoin value, $Res Function(MatchLobbyJoin) then) =
      _$MatchLobbyJoinCopyWithImpl<$Res>;
  $Res call({LobbyParameters lobbyParameters});
}

/// @nodoc
class _$MatchLobbyJoinCopyWithImpl<$Res>
    extends _$MatchLobbyEventCopyWithImpl<$Res>
    implements $MatchLobbyJoinCopyWith<$Res> {
  _$MatchLobbyJoinCopyWithImpl(
      MatchLobbyJoin _value, $Res Function(MatchLobbyJoin) _then)
      : super(_value, (v) => _then(v as MatchLobbyJoin));

  @override
  MatchLobbyJoin get _value => super._value as MatchLobbyJoin;

  @override
  $Res call({
    Object? lobbyParameters = freezed,
  }) {
    return _then(MatchLobbyJoin(
      lobbyParameters: lobbyParameters == freezed
          ? _value.lobbyParameters
          : lobbyParameters // ignore: cast_nullable_to_non_nullable
              as LobbyParameters,
    ));
  }
}

/// @nodoc

class _$MatchLobbyJoin extends MatchLobbyJoin with DiagnosticableTreeMixin {
  const _$MatchLobbyJoin({required this.lobbyParameters}) : super._();

  @override
  final LobbyParameters lobbyParameters;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MatchLobbyEvent.join(lobbyParameters: $lobbyParameters)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MatchLobbyEvent.join'))
      ..add(DiagnosticsProperty('lobbyParameters', lobbyParameters));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MatchLobbyJoin &&
            const DeepCollectionEquality()
                .equals(other.lobbyParameters, lobbyParameters));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(lobbyParameters));

  @JsonKey(ignore: true)
  @override
  $MatchLobbyJoinCopyWith<MatchLobbyJoin> get copyWith =>
      _$MatchLobbyJoinCopyWithImpl<MatchLobbyJoin>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LobbyCheckIn lobbyCheckIn) checkInNotification,
    required TResult Function(int lobbyId) leave,
    required TResult Function(User user, ActiveMatch activeMatch, bool silent)
        restoreState,
    required TResult Function(User user, int tournamentId, int lobbyId)
        restoreStateFromNotification,
    required TResult Function(LobbyParameters lobbyParameters) join,
    required TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)
        opponentCheckedIn,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchMakingMatch match)
        opponentSubmittedScore,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchMakingMatch match)
        scoreConfirmed,
    required TResult Function(MatchLobbyData matchLobbyData)
        goToScoreSubmissionPage,
    required TResult Function(
            MatchLobbyData matchLobbyData, int score1, int score2)
        submitScore,
    required TResult Function(
            MatchScores matchScores, MatchLobbyData matchLobbyData)
        acceptScore,
    required TResult Function(MatchLobbyData matchLobbyData) disputeScore,
    required TResult Function() close,
    required TResult Function(int tournamentId) matchmaking,
  }) {
    return join(lobbyParameters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LobbyCheckIn lobbyCheckIn)? checkInNotification,
    TResult Function(int lobbyId)? leave,
    TResult Function(User user, ActiveMatch activeMatch, bool silent)?
        restoreState,
    TResult Function(User user, int tournamentId, int lobbyId)?
        restoreStateFromNotification,
    TResult Function(LobbyParameters lobbyParameters)? join,
    TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)?
        opponentCheckedIn,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        scoreConfirmed,
    TResult Function(MatchLobbyData matchLobbyData)? goToScoreSubmissionPage,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        submitScore,
    TResult Function(MatchScores matchScores, MatchLobbyData matchLobbyData)?
        acceptScore,
    TResult Function(MatchLobbyData matchLobbyData)? disputeScore,
    TResult Function()? close,
    TResult Function(int tournamentId)? matchmaking,
  }) {
    return join?.call(lobbyParameters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LobbyCheckIn lobbyCheckIn)? checkInNotification,
    TResult Function(int lobbyId)? leave,
    TResult Function(User user, ActiveMatch activeMatch, bool silent)?
        restoreState,
    TResult Function(User user, int tournamentId, int lobbyId)?
        restoreStateFromNotification,
    TResult Function(LobbyParameters lobbyParameters)? join,
    TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)?
        opponentCheckedIn,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        scoreConfirmed,
    TResult Function(MatchLobbyData matchLobbyData)? goToScoreSubmissionPage,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        submitScore,
    TResult Function(MatchScores matchScores, MatchLobbyData matchLobbyData)?
        acceptScore,
    TResult Function(MatchLobbyData matchLobbyData)? disputeScore,
    TResult Function()? close,
    TResult Function(int tournamentId)? matchmaking,
    required TResult orElse(),
  }) {
    if (join != null) {
      return join(lobbyParameters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MatchLobbyCheckInNotification value)
        checkInNotification,
    required TResult Function(MatchLobbyLeave value) leave,
    required TResult Function(MatchLobbyRestoreState value) restoreState,
    required TResult Function(MatchLobbyRestoreStateFromNotification value)
        restoreStateFromNotification,
    required TResult Function(MatchLobbyJoin value) join,
    required TResult Function(MatchLobbyOpponentCheckedIn value)
        opponentCheckedIn,
    required TResult Function(MatchLobbyOpponentSubmittedScore value)
        opponentSubmittedScore,
    required TResult Function(MatchLobbyOpponentConfirmedScore value)
        scoreConfirmed,
    required TResult Function(MatchLobbyGoToScoreSubmissionPage value)
        goToScoreSubmissionPage,
    required TResult Function(MatchLobbySubmitScore value) submitScore,
    required TResult Function(MatchLobbyAcceptScore value) acceptScore,
    required TResult Function(MatchLobbyDisputeScore value) disputeScore,
    required TResult Function(MatchLobbyClose value) close,
    required TResult Function(MatchLobbyMatchmaking value) matchmaking,
  }) {
    return join(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MatchLobbyCheckInNotification value)? checkInNotification,
    TResult Function(MatchLobbyLeave value)? leave,
    TResult Function(MatchLobbyRestoreState value)? restoreState,
    TResult Function(MatchLobbyRestoreStateFromNotification value)?
        restoreStateFromNotification,
    TResult Function(MatchLobbyJoin value)? join,
    TResult Function(MatchLobbyOpponentCheckedIn value)? opponentCheckedIn,
    TResult Function(MatchLobbyOpponentSubmittedScore value)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyOpponentConfirmedScore value)? scoreConfirmed,
    TResult Function(MatchLobbyGoToScoreSubmissionPage value)?
        goToScoreSubmissionPage,
    TResult Function(MatchLobbySubmitScore value)? submitScore,
    TResult Function(MatchLobbyAcceptScore value)? acceptScore,
    TResult Function(MatchLobbyDisputeScore value)? disputeScore,
    TResult Function(MatchLobbyClose value)? close,
    TResult Function(MatchLobbyMatchmaking value)? matchmaking,
  }) {
    return join?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MatchLobbyCheckInNotification value)? checkInNotification,
    TResult Function(MatchLobbyLeave value)? leave,
    TResult Function(MatchLobbyRestoreState value)? restoreState,
    TResult Function(MatchLobbyRestoreStateFromNotification value)?
        restoreStateFromNotification,
    TResult Function(MatchLobbyJoin value)? join,
    TResult Function(MatchLobbyOpponentCheckedIn value)? opponentCheckedIn,
    TResult Function(MatchLobbyOpponentSubmittedScore value)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyOpponentConfirmedScore value)? scoreConfirmed,
    TResult Function(MatchLobbyGoToScoreSubmissionPage value)?
        goToScoreSubmissionPage,
    TResult Function(MatchLobbySubmitScore value)? submitScore,
    TResult Function(MatchLobbyAcceptScore value)? acceptScore,
    TResult Function(MatchLobbyDisputeScore value)? disputeScore,
    TResult Function(MatchLobbyClose value)? close,
    TResult Function(MatchLobbyMatchmaking value)? matchmaking,
    required TResult orElse(),
  }) {
    if (join != null) {
      return join(this);
    }
    return orElse();
  }
}

abstract class MatchLobbyJoin extends MatchLobbyEvent {
  const factory MatchLobbyJoin({required LobbyParameters lobbyParameters}) =
      _$MatchLobbyJoin;
  const MatchLobbyJoin._() : super._();

  LobbyParameters get lobbyParameters;
  @JsonKey(ignore: true)
  $MatchLobbyJoinCopyWith<MatchLobbyJoin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchLobbyOpponentCheckedInCopyWith<$Res> {
  factory $MatchLobbyOpponentCheckedInCopyWith(
          MatchLobbyOpponentCheckedIn value,
          $Res Function(MatchLobbyOpponentCheckedIn) then) =
      _$MatchLobbyOpponentCheckedInCopyWithImpl<$Res>;
  $Res call({int? matchId, LobbyParameters lobbyParameters, bool silent});
}

/// @nodoc
class _$MatchLobbyOpponentCheckedInCopyWithImpl<$Res>
    extends _$MatchLobbyEventCopyWithImpl<$Res>
    implements $MatchLobbyOpponentCheckedInCopyWith<$Res> {
  _$MatchLobbyOpponentCheckedInCopyWithImpl(MatchLobbyOpponentCheckedIn _value,
      $Res Function(MatchLobbyOpponentCheckedIn) _then)
      : super(_value, (v) => _then(v as MatchLobbyOpponentCheckedIn));

  @override
  MatchLobbyOpponentCheckedIn get _value =>
      super._value as MatchLobbyOpponentCheckedIn;

  @override
  $Res call({
    Object? matchId = freezed,
    Object? lobbyParameters = freezed,
    Object? silent = freezed,
  }) {
    return _then(MatchLobbyOpponentCheckedIn(
      matchId: matchId == freezed
          ? _value.matchId
          : matchId // ignore: cast_nullable_to_non_nullable
              as int?,
      lobbyParameters: lobbyParameters == freezed
          ? _value.lobbyParameters
          : lobbyParameters // ignore: cast_nullable_to_non_nullable
              as LobbyParameters,
      silent: silent == freezed
          ? _value.silent
          : silent // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MatchLobbyOpponentCheckedIn extends MatchLobbyOpponentCheckedIn
    with DiagnosticableTreeMixin {
  const _$MatchLobbyOpponentCheckedIn(
      {required this.matchId,
      required this.lobbyParameters,
      this.silent = false})
      : super._();

  @override
  final int? matchId;
  @override
  final LobbyParameters lobbyParameters;
  @JsonKey()
  @override
  final bool silent;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MatchLobbyEvent.opponentCheckedIn(matchId: $matchId, lobbyParameters: $lobbyParameters, silent: $silent)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MatchLobbyEvent.opponentCheckedIn'))
      ..add(DiagnosticsProperty('matchId', matchId))
      ..add(DiagnosticsProperty('lobbyParameters', lobbyParameters))
      ..add(DiagnosticsProperty('silent', silent));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MatchLobbyOpponentCheckedIn &&
            const DeepCollectionEquality().equals(other.matchId, matchId) &&
            const DeepCollectionEquality()
                .equals(other.lobbyParameters, lobbyParameters) &&
            const DeepCollectionEquality().equals(other.silent, silent));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(matchId),
      const DeepCollectionEquality().hash(lobbyParameters),
      const DeepCollectionEquality().hash(silent));

  @JsonKey(ignore: true)
  @override
  $MatchLobbyOpponentCheckedInCopyWith<MatchLobbyOpponentCheckedIn>
      get copyWith => _$MatchLobbyOpponentCheckedInCopyWithImpl<
          MatchLobbyOpponentCheckedIn>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LobbyCheckIn lobbyCheckIn) checkInNotification,
    required TResult Function(int lobbyId) leave,
    required TResult Function(User user, ActiveMatch activeMatch, bool silent)
        restoreState,
    required TResult Function(User user, int tournamentId, int lobbyId)
        restoreStateFromNotification,
    required TResult Function(LobbyParameters lobbyParameters) join,
    required TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)
        opponentCheckedIn,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchMakingMatch match)
        opponentSubmittedScore,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchMakingMatch match)
        scoreConfirmed,
    required TResult Function(MatchLobbyData matchLobbyData)
        goToScoreSubmissionPage,
    required TResult Function(
            MatchLobbyData matchLobbyData, int score1, int score2)
        submitScore,
    required TResult Function(
            MatchScores matchScores, MatchLobbyData matchLobbyData)
        acceptScore,
    required TResult Function(MatchLobbyData matchLobbyData) disputeScore,
    required TResult Function() close,
    required TResult Function(int tournamentId) matchmaking,
  }) {
    return opponentCheckedIn(matchId, lobbyParameters, silent);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LobbyCheckIn lobbyCheckIn)? checkInNotification,
    TResult Function(int lobbyId)? leave,
    TResult Function(User user, ActiveMatch activeMatch, bool silent)?
        restoreState,
    TResult Function(User user, int tournamentId, int lobbyId)?
        restoreStateFromNotification,
    TResult Function(LobbyParameters lobbyParameters)? join,
    TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)?
        opponentCheckedIn,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        scoreConfirmed,
    TResult Function(MatchLobbyData matchLobbyData)? goToScoreSubmissionPage,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        submitScore,
    TResult Function(MatchScores matchScores, MatchLobbyData matchLobbyData)?
        acceptScore,
    TResult Function(MatchLobbyData matchLobbyData)? disputeScore,
    TResult Function()? close,
    TResult Function(int tournamentId)? matchmaking,
  }) {
    return opponentCheckedIn?.call(matchId, lobbyParameters, silent);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LobbyCheckIn lobbyCheckIn)? checkInNotification,
    TResult Function(int lobbyId)? leave,
    TResult Function(User user, ActiveMatch activeMatch, bool silent)?
        restoreState,
    TResult Function(User user, int tournamentId, int lobbyId)?
        restoreStateFromNotification,
    TResult Function(LobbyParameters lobbyParameters)? join,
    TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)?
        opponentCheckedIn,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        scoreConfirmed,
    TResult Function(MatchLobbyData matchLobbyData)? goToScoreSubmissionPage,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        submitScore,
    TResult Function(MatchScores matchScores, MatchLobbyData matchLobbyData)?
        acceptScore,
    TResult Function(MatchLobbyData matchLobbyData)? disputeScore,
    TResult Function()? close,
    TResult Function(int tournamentId)? matchmaking,
    required TResult orElse(),
  }) {
    if (opponentCheckedIn != null) {
      return opponentCheckedIn(matchId, lobbyParameters, silent);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MatchLobbyCheckInNotification value)
        checkInNotification,
    required TResult Function(MatchLobbyLeave value) leave,
    required TResult Function(MatchLobbyRestoreState value) restoreState,
    required TResult Function(MatchLobbyRestoreStateFromNotification value)
        restoreStateFromNotification,
    required TResult Function(MatchLobbyJoin value) join,
    required TResult Function(MatchLobbyOpponentCheckedIn value)
        opponentCheckedIn,
    required TResult Function(MatchLobbyOpponentSubmittedScore value)
        opponentSubmittedScore,
    required TResult Function(MatchLobbyOpponentConfirmedScore value)
        scoreConfirmed,
    required TResult Function(MatchLobbyGoToScoreSubmissionPage value)
        goToScoreSubmissionPage,
    required TResult Function(MatchLobbySubmitScore value) submitScore,
    required TResult Function(MatchLobbyAcceptScore value) acceptScore,
    required TResult Function(MatchLobbyDisputeScore value) disputeScore,
    required TResult Function(MatchLobbyClose value) close,
    required TResult Function(MatchLobbyMatchmaking value) matchmaking,
  }) {
    return opponentCheckedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MatchLobbyCheckInNotification value)? checkInNotification,
    TResult Function(MatchLobbyLeave value)? leave,
    TResult Function(MatchLobbyRestoreState value)? restoreState,
    TResult Function(MatchLobbyRestoreStateFromNotification value)?
        restoreStateFromNotification,
    TResult Function(MatchLobbyJoin value)? join,
    TResult Function(MatchLobbyOpponentCheckedIn value)? opponentCheckedIn,
    TResult Function(MatchLobbyOpponentSubmittedScore value)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyOpponentConfirmedScore value)? scoreConfirmed,
    TResult Function(MatchLobbyGoToScoreSubmissionPage value)?
        goToScoreSubmissionPage,
    TResult Function(MatchLobbySubmitScore value)? submitScore,
    TResult Function(MatchLobbyAcceptScore value)? acceptScore,
    TResult Function(MatchLobbyDisputeScore value)? disputeScore,
    TResult Function(MatchLobbyClose value)? close,
    TResult Function(MatchLobbyMatchmaking value)? matchmaking,
  }) {
    return opponentCheckedIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MatchLobbyCheckInNotification value)? checkInNotification,
    TResult Function(MatchLobbyLeave value)? leave,
    TResult Function(MatchLobbyRestoreState value)? restoreState,
    TResult Function(MatchLobbyRestoreStateFromNotification value)?
        restoreStateFromNotification,
    TResult Function(MatchLobbyJoin value)? join,
    TResult Function(MatchLobbyOpponentCheckedIn value)? opponentCheckedIn,
    TResult Function(MatchLobbyOpponentSubmittedScore value)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyOpponentConfirmedScore value)? scoreConfirmed,
    TResult Function(MatchLobbyGoToScoreSubmissionPage value)?
        goToScoreSubmissionPage,
    TResult Function(MatchLobbySubmitScore value)? submitScore,
    TResult Function(MatchLobbyAcceptScore value)? acceptScore,
    TResult Function(MatchLobbyDisputeScore value)? disputeScore,
    TResult Function(MatchLobbyClose value)? close,
    TResult Function(MatchLobbyMatchmaking value)? matchmaking,
    required TResult orElse(),
  }) {
    if (opponentCheckedIn != null) {
      return opponentCheckedIn(this);
    }
    return orElse();
  }
}

abstract class MatchLobbyOpponentCheckedIn extends MatchLobbyEvent {
  const factory MatchLobbyOpponentCheckedIn(
      {required int? matchId,
      required LobbyParameters lobbyParameters,
      bool silent}) = _$MatchLobbyOpponentCheckedIn;
  const MatchLobbyOpponentCheckedIn._() : super._();

  int? get matchId;
  LobbyParameters get lobbyParameters;
  bool get silent;
  @JsonKey(ignore: true)
  $MatchLobbyOpponentCheckedInCopyWith<MatchLobbyOpponentCheckedIn>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchLobbyOpponentSubmittedScoreCopyWith<$Res> {
  factory $MatchLobbyOpponentSubmittedScoreCopyWith(
          MatchLobbyOpponentSubmittedScore value,
          $Res Function(MatchLobbyOpponentSubmittedScore) then) =
      _$MatchLobbyOpponentSubmittedScoreCopyWithImpl<$Res>;
  $Res call({MatchLobbyData matchLobbyData, MatchMakingMatch match});
}

/// @nodoc
class _$MatchLobbyOpponentSubmittedScoreCopyWithImpl<$Res>
    extends _$MatchLobbyEventCopyWithImpl<$Res>
    implements $MatchLobbyOpponentSubmittedScoreCopyWith<$Res> {
  _$MatchLobbyOpponentSubmittedScoreCopyWithImpl(
      MatchLobbyOpponentSubmittedScore _value,
      $Res Function(MatchLobbyOpponentSubmittedScore) _then)
      : super(_value, (v) => _then(v as MatchLobbyOpponentSubmittedScore));

  @override
  MatchLobbyOpponentSubmittedScore get _value =>
      super._value as MatchLobbyOpponentSubmittedScore;

  @override
  $Res call({
    Object? matchLobbyData = freezed,
    Object? match = freezed,
  }) {
    return _then(MatchLobbyOpponentSubmittedScore(
      matchLobbyData: matchLobbyData == freezed
          ? _value.matchLobbyData
          : matchLobbyData // ignore: cast_nullable_to_non_nullable
              as MatchLobbyData,
      match: match == freezed
          ? _value.match
          : match // ignore: cast_nullable_to_non_nullable
              as MatchMakingMatch,
    ));
  }
}

/// @nodoc

class _$MatchLobbyOpponentSubmittedScore
    extends MatchLobbyOpponentSubmittedScore with DiagnosticableTreeMixin {
  const _$MatchLobbyOpponentSubmittedScore(
      {required this.matchLobbyData, required this.match})
      : super._();

  @override
  final MatchLobbyData matchLobbyData;
  @override
  final MatchMakingMatch match;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MatchLobbyEvent.opponentSubmittedScore(matchLobbyData: $matchLobbyData, match: $match)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'MatchLobbyEvent.opponentSubmittedScore'))
      ..add(DiagnosticsProperty('matchLobbyData', matchLobbyData))
      ..add(DiagnosticsProperty('match', match));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MatchLobbyOpponentSubmittedScore &&
            const DeepCollectionEquality()
                .equals(other.matchLobbyData, matchLobbyData) &&
            const DeepCollectionEquality().equals(other.match, match));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(matchLobbyData),
      const DeepCollectionEquality().hash(match));

  @JsonKey(ignore: true)
  @override
  $MatchLobbyOpponentSubmittedScoreCopyWith<MatchLobbyOpponentSubmittedScore>
      get copyWith => _$MatchLobbyOpponentSubmittedScoreCopyWithImpl<
          MatchLobbyOpponentSubmittedScore>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LobbyCheckIn lobbyCheckIn) checkInNotification,
    required TResult Function(int lobbyId) leave,
    required TResult Function(User user, ActiveMatch activeMatch, bool silent)
        restoreState,
    required TResult Function(User user, int tournamentId, int lobbyId)
        restoreStateFromNotification,
    required TResult Function(LobbyParameters lobbyParameters) join,
    required TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)
        opponentCheckedIn,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchMakingMatch match)
        opponentSubmittedScore,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchMakingMatch match)
        scoreConfirmed,
    required TResult Function(MatchLobbyData matchLobbyData)
        goToScoreSubmissionPage,
    required TResult Function(
            MatchLobbyData matchLobbyData, int score1, int score2)
        submitScore,
    required TResult Function(
            MatchScores matchScores, MatchLobbyData matchLobbyData)
        acceptScore,
    required TResult Function(MatchLobbyData matchLobbyData) disputeScore,
    required TResult Function() close,
    required TResult Function(int tournamentId) matchmaking,
  }) {
    return opponentSubmittedScore(matchLobbyData, match);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LobbyCheckIn lobbyCheckIn)? checkInNotification,
    TResult Function(int lobbyId)? leave,
    TResult Function(User user, ActiveMatch activeMatch, bool silent)?
        restoreState,
    TResult Function(User user, int tournamentId, int lobbyId)?
        restoreStateFromNotification,
    TResult Function(LobbyParameters lobbyParameters)? join,
    TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)?
        opponentCheckedIn,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        scoreConfirmed,
    TResult Function(MatchLobbyData matchLobbyData)? goToScoreSubmissionPage,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        submitScore,
    TResult Function(MatchScores matchScores, MatchLobbyData matchLobbyData)?
        acceptScore,
    TResult Function(MatchLobbyData matchLobbyData)? disputeScore,
    TResult Function()? close,
    TResult Function(int tournamentId)? matchmaking,
  }) {
    return opponentSubmittedScore?.call(matchLobbyData, match);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LobbyCheckIn lobbyCheckIn)? checkInNotification,
    TResult Function(int lobbyId)? leave,
    TResult Function(User user, ActiveMatch activeMatch, bool silent)?
        restoreState,
    TResult Function(User user, int tournamentId, int lobbyId)?
        restoreStateFromNotification,
    TResult Function(LobbyParameters lobbyParameters)? join,
    TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)?
        opponentCheckedIn,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        scoreConfirmed,
    TResult Function(MatchLobbyData matchLobbyData)? goToScoreSubmissionPage,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        submitScore,
    TResult Function(MatchScores matchScores, MatchLobbyData matchLobbyData)?
        acceptScore,
    TResult Function(MatchLobbyData matchLobbyData)? disputeScore,
    TResult Function()? close,
    TResult Function(int tournamentId)? matchmaking,
    required TResult orElse(),
  }) {
    if (opponentSubmittedScore != null) {
      return opponentSubmittedScore(matchLobbyData, match);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MatchLobbyCheckInNotification value)
        checkInNotification,
    required TResult Function(MatchLobbyLeave value) leave,
    required TResult Function(MatchLobbyRestoreState value) restoreState,
    required TResult Function(MatchLobbyRestoreStateFromNotification value)
        restoreStateFromNotification,
    required TResult Function(MatchLobbyJoin value) join,
    required TResult Function(MatchLobbyOpponentCheckedIn value)
        opponentCheckedIn,
    required TResult Function(MatchLobbyOpponentSubmittedScore value)
        opponentSubmittedScore,
    required TResult Function(MatchLobbyOpponentConfirmedScore value)
        scoreConfirmed,
    required TResult Function(MatchLobbyGoToScoreSubmissionPage value)
        goToScoreSubmissionPage,
    required TResult Function(MatchLobbySubmitScore value) submitScore,
    required TResult Function(MatchLobbyAcceptScore value) acceptScore,
    required TResult Function(MatchLobbyDisputeScore value) disputeScore,
    required TResult Function(MatchLobbyClose value) close,
    required TResult Function(MatchLobbyMatchmaking value) matchmaking,
  }) {
    return opponentSubmittedScore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MatchLobbyCheckInNotification value)? checkInNotification,
    TResult Function(MatchLobbyLeave value)? leave,
    TResult Function(MatchLobbyRestoreState value)? restoreState,
    TResult Function(MatchLobbyRestoreStateFromNotification value)?
        restoreStateFromNotification,
    TResult Function(MatchLobbyJoin value)? join,
    TResult Function(MatchLobbyOpponentCheckedIn value)? opponentCheckedIn,
    TResult Function(MatchLobbyOpponentSubmittedScore value)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyOpponentConfirmedScore value)? scoreConfirmed,
    TResult Function(MatchLobbyGoToScoreSubmissionPage value)?
        goToScoreSubmissionPage,
    TResult Function(MatchLobbySubmitScore value)? submitScore,
    TResult Function(MatchLobbyAcceptScore value)? acceptScore,
    TResult Function(MatchLobbyDisputeScore value)? disputeScore,
    TResult Function(MatchLobbyClose value)? close,
    TResult Function(MatchLobbyMatchmaking value)? matchmaking,
  }) {
    return opponentSubmittedScore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MatchLobbyCheckInNotification value)? checkInNotification,
    TResult Function(MatchLobbyLeave value)? leave,
    TResult Function(MatchLobbyRestoreState value)? restoreState,
    TResult Function(MatchLobbyRestoreStateFromNotification value)?
        restoreStateFromNotification,
    TResult Function(MatchLobbyJoin value)? join,
    TResult Function(MatchLobbyOpponentCheckedIn value)? opponentCheckedIn,
    TResult Function(MatchLobbyOpponentSubmittedScore value)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyOpponentConfirmedScore value)? scoreConfirmed,
    TResult Function(MatchLobbyGoToScoreSubmissionPage value)?
        goToScoreSubmissionPage,
    TResult Function(MatchLobbySubmitScore value)? submitScore,
    TResult Function(MatchLobbyAcceptScore value)? acceptScore,
    TResult Function(MatchLobbyDisputeScore value)? disputeScore,
    TResult Function(MatchLobbyClose value)? close,
    TResult Function(MatchLobbyMatchmaking value)? matchmaking,
    required TResult orElse(),
  }) {
    if (opponentSubmittedScore != null) {
      return opponentSubmittedScore(this);
    }
    return orElse();
  }
}

abstract class MatchLobbyOpponentSubmittedScore extends MatchLobbyEvent {
  const factory MatchLobbyOpponentSubmittedScore(
      {required MatchLobbyData matchLobbyData,
      required MatchMakingMatch match}) = _$MatchLobbyOpponentSubmittedScore;
  const MatchLobbyOpponentSubmittedScore._() : super._();

  MatchLobbyData get matchLobbyData;
  MatchMakingMatch get match;
  @JsonKey(ignore: true)
  $MatchLobbyOpponentSubmittedScoreCopyWith<MatchLobbyOpponentSubmittedScore>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchLobbyOpponentConfirmedScoreCopyWith<$Res> {
  factory $MatchLobbyOpponentConfirmedScoreCopyWith(
          MatchLobbyOpponentConfirmedScore value,
          $Res Function(MatchLobbyOpponentConfirmedScore) then) =
      _$MatchLobbyOpponentConfirmedScoreCopyWithImpl<$Res>;
  $Res call({MatchLobbyData matchLobbyData, MatchMakingMatch match});
}

/// @nodoc
class _$MatchLobbyOpponentConfirmedScoreCopyWithImpl<$Res>
    extends _$MatchLobbyEventCopyWithImpl<$Res>
    implements $MatchLobbyOpponentConfirmedScoreCopyWith<$Res> {
  _$MatchLobbyOpponentConfirmedScoreCopyWithImpl(
      MatchLobbyOpponentConfirmedScore _value,
      $Res Function(MatchLobbyOpponentConfirmedScore) _then)
      : super(_value, (v) => _then(v as MatchLobbyOpponentConfirmedScore));

  @override
  MatchLobbyOpponentConfirmedScore get _value =>
      super._value as MatchLobbyOpponentConfirmedScore;

  @override
  $Res call({
    Object? matchLobbyData = freezed,
    Object? match = freezed,
  }) {
    return _then(MatchLobbyOpponentConfirmedScore(
      matchLobbyData: matchLobbyData == freezed
          ? _value.matchLobbyData
          : matchLobbyData // ignore: cast_nullable_to_non_nullable
              as MatchLobbyData,
      match: match == freezed
          ? _value.match
          : match // ignore: cast_nullable_to_non_nullable
              as MatchMakingMatch,
    ));
  }
}

/// @nodoc

class _$MatchLobbyOpponentConfirmedScore
    extends MatchLobbyOpponentConfirmedScore with DiagnosticableTreeMixin {
  const _$MatchLobbyOpponentConfirmedScore(
      {required this.matchLobbyData, required this.match})
      : super._();

  @override
  final MatchLobbyData matchLobbyData;
  @override
  final MatchMakingMatch match;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MatchLobbyEvent.scoreConfirmed(matchLobbyData: $matchLobbyData, match: $match)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MatchLobbyEvent.scoreConfirmed'))
      ..add(DiagnosticsProperty('matchLobbyData', matchLobbyData))
      ..add(DiagnosticsProperty('match', match));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MatchLobbyOpponentConfirmedScore &&
            const DeepCollectionEquality()
                .equals(other.matchLobbyData, matchLobbyData) &&
            const DeepCollectionEquality().equals(other.match, match));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(matchLobbyData),
      const DeepCollectionEquality().hash(match));

  @JsonKey(ignore: true)
  @override
  $MatchLobbyOpponentConfirmedScoreCopyWith<MatchLobbyOpponentConfirmedScore>
      get copyWith => _$MatchLobbyOpponentConfirmedScoreCopyWithImpl<
          MatchLobbyOpponentConfirmedScore>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LobbyCheckIn lobbyCheckIn) checkInNotification,
    required TResult Function(int lobbyId) leave,
    required TResult Function(User user, ActiveMatch activeMatch, bool silent)
        restoreState,
    required TResult Function(User user, int tournamentId, int lobbyId)
        restoreStateFromNotification,
    required TResult Function(LobbyParameters lobbyParameters) join,
    required TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)
        opponentCheckedIn,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchMakingMatch match)
        opponentSubmittedScore,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchMakingMatch match)
        scoreConfirmed,
    required TResult Function(MatchLobbyData matchLobbyData)
        goToScoreSubmissionPage,
    required TResult Function(
            MatchLobbyData matchLobbyData, int score1, int score2)
        submitScore,
    required TResult Function(
            MatchScores matchScores, MatchLobbyData matchLobbyData)
        acceptScore,
    required TResult Function(MatchLobbyData matchLobbyData) disputeScore,
    required TResult Function() close,
    required TResult Function(int tournamentId) matchmaking,
  }) {
    return scoreConfirmed(matchLobbyData, match);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LobbyCheckIn lobbyCheckIn)? checkInNotification,
    TResult Function(int lobbyId)? leave,
    TResult Function(User user, ActiveMatch activeMatch, bool silent)?
        restoreState,
    TResult Function(User user, int tournamentId, int lobbyId)?
        restoreStateFromNotification,
    TResult Function(LobbyParameters lobbyParameters)? join,
    TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)?
        opponentCheckedIn,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        scoreConfirmed,
    TResult Function(MatchLobbyData matchLobbyData)? goToScoreSubmissionPage,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        submitScore,
    TResult Function(MatchScores matchScores, MatchLobbyData matchLobbyData)?
        acceptScore,
    TResult Function(MatchLobbyData matchLobbyData)? disputeScore,
    TResult Function()? close,
    TResult Function(int tournamentId)? matchmaking,
  }) {
    return scoreConfirmed?.call(matchLobbyData, match);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LobbyCheckIn lobbyCheckIn)? checkInNotification,
    TResult Function(int lobbyId)? leave,
    TResult Function(User user, ActiveMatch activeMatch, bool silent)?
        restoreState,
    TResult Function(User user, int tournamentId, int lobbyId)?
        restoreStateFromNotification,
    TResult Function(LobbyParameters lobbyParameters)? join,
    TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)?
        opponentCheckedIn,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        scoreConfirmed,
    TResult Function(MatchLobbyData matchLobbyData)? goToScoreSubmissionPage,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        submitScore,
    TResult Function(MatchScores matchScores, MatchLobbyData matchLobbyData)?
        acceptScore,
    TResult Function(MatchLobbyData matchLobbyData)? disputeScore,
    TResult Function()? close,
    TResult Function(int tournamentId)? matchmaking,
    required TResult orElse(),
  }) {
    if (scoreConfirmed != null) {
      return scoreConfirmed(matchLobbyData, match);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MatchLobbyCheckInNotification value)
        checkInNotification,
    required TResult Function(MatchLobbyLeave value) leave,
    required TResult Function(MatchLobbyRestoreState value) restoreState,
    required TResult Function(MatchLobbyRestoreStateFromNotification value)
        restoreStateFromNotification,
    required TResult Function(MatchLobbyJoin value) join,
    required TResult Function(MatchLobbyOpponentCheckedIn value)
        opponentCheckedIn,
    required TResult Function(MatchLobbyOpponentSubmittedScore value)
        opponentSubmittedScore,
    required TResult Function(MatchLobbyOpponentConfirmedScore value)
        scoreConfirmed,
    required TResult Function(MatchLobbyGoToScoreSubmissionPage value)
        goToScoreSubmissionPage,
    required TResult Function(MatchLobbySubmitScore value) submitScore,
    required TResult Function(MatchLobbyAcceptScore value) acceptScore,
    required TResult Function(MatchLobbyDisputeScore value) disputeScore,
    required TResult Function(MatchLobbyClose value) close,
    required TResult Function(MatchLobbyMatchmaking value) matchmaking,
  }) {
    return scoreConfirmed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MatchLobbyCheckInNotification value)? checkInNotification,
    TResult Function(MatchLobbyLeave value)? leave,
    TResult Function(MatchLobbyRestoreState value)? restoreState,
    TResult Function(MatchLobbyRestoreStateFromNotification value)?
        restoreStateFromNotification,
    TResult Function(MatchLobbyJoin value)? join,
    TResult Function(MatchLobbyOpponentCheckedIn value)? opponentCheckedIn,
    TResult Function(MatchLobbyOpponentSubmittedScore value)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyOpponentConfirmedScore value)? scoreConfirmed,
    TResult Function(MatchLobbyGoToScoreSubmissionPage value)?
        goToScoreSubmissionPage,
    TResult Function(MatchLobbySubmitScore value)? submitScore,
    TResult Function(MatchLobbyAcceptScore value)? acceptScore,
    TResult Function(MatchLobbyDisputeScore value)? disputeScore,
    TResult Function(MatchLobbyClose value)? close,
    TResult Function(MatchLobbyMatchmaking value)? matchmaking,
  }) {
    return scoreConfirmed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MatchLobbyCheckInNotification value)? checkInNotification,
    TResult Function(MatchLobbyLeave value)? leave,
    TResult Function(MatchLobbyRestoreState value)? restoreState,
    TResult Function(MatchLobbyRestoreStateFromNotification value)?
        restoreStateFromNotification,
    TResult Function(MatchLobbyJoin value)? join,
    TResult Function(MatchLobbyOpponentCheckedIn value)? opponentCheckedIn,
    TResult Function(MatchLobbyOpponentSubmittedScore value)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyOpponentConfirmedScore value)? scoreConfirmed,
    TResult Function(MatchLobbyGoToScoreSubmissionPage value)?
        goToScoreSubmissionPage,
    TResult Function(MatchLobbySubmitScore value)? submitScore,
    TResult Function(MatchLobbyAcceptScore value)? acceptScore,
    TResult Function(MatchLobbyDisputeScore value)? disputeScore,
    TResult Function(MatchLobbyClose value)? close,
    TResult Function(MatchLobbyMatchmaking value)? matchmaking,
    required TResult orElse(),
  }) {
    if (scoreConfirmed != null) {
      return scoreConfirmed(this);
    }
    return orElse();
  }
}

abstract class MatchLobbyOpponentConfirmedScore extends MatchLobbyEvent {
  const factory MatchLobbyOpponentConfirmedScore(
      {required MatchLobbyData matchLobbyData,
      required MatchMakingMatch match}) = _$MatchLobbyOpponentConfirmedScore;
  const MatchLobbyOpponentConfirmedScore._() : super._();

  MatchLobbyData get matchLobbyData;
  MatchMakingMatch get match;
  @JsonKey(ignore: true)
  $MatchLobbyOpponentConfirmedScoreCopyWith<MatchLobbyOpponentConfirmedScore>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchLobbyGoToScoreSubmissionPageCopyWith<$Res> {
  factory $MatchLobbyGoToScoreSubmissionPageCopyWith(
          MatchLobbyGoToScoreSubmissionPage value,
          $Res Function(MatchLobbyGoToScoreSubmissionPage) then) =
      _$MatchLobbyGoToScoreSubmissionPageCopyWithImpl<$Res>;
  $Res call({MatchLobbyData matchLobbyData});
}

/// @nodoc
class _$MatchLobbyGoToScoreSubmissionPageCopyWithImpl<$Res>
    extends _$MatchLobbyEventCopyWithImpl<$Res>
    implements $MatchLobbyGoToScoreSubmissionPageCopyWith<$Res> {
  _$MatchLobbyGoToScoreSubmissionPageCopyWithImpl(
      MatchLobbyGoToScoreSubmissionPage _value,
      $Res Function(MatchLobbyGoToScoreSubmissionPage) _then)
      : super(_value, (v) => _then(v as MatchLobbyGoToScoreSubmissionPage));

  @override
  MatchLobbyGoToScoreSubmissionPage get _value =>
      super._value as MatchLobbyGoToScoreSubmissionPage;

  @override
  $Res call({
    Object? matchLobbyData = freezed,
  }) {
    return _then(MatchLobbyGoToScoreSubmissionPage(
      matchLobbyData: matchLobbyData == freezed
          ? _value.matchLobbyData
          : matchLobbyData // ignore: cast_nullable_to_non_nullable
              as MatchLobbyData,
    ));
  }
}

/// @nodoc

class _$MatchLobbyGoToScoreSubmissionPage
    extends MatchLobbyGoToScoreSubmissionPage with DiagnosticableTreeMixin {
  const _$MatchLobbyGoToScoreSubmissionPage({required this.matchLobbyData})
      : super._();

  @override
  final MatchLobbyData matchLobbyData;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MatchLobbyEvent.goToScoreSubmissionPage(matchLobbyData: $matchLobbyData)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'MatchLobbyEvent.goToScoreSubmissionPage'))
      ..add(DiagnosticsProperty('matchLobbyData', matchLobbyData));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MatchLobbyGoToScoreSubmissionPage &&
            const DeepCollectionEquality()
                .equals(other.matchLobbyData, matchLobbyData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(matchLobbyData));

  @JsonKey(ignore: true)
  @override
  $MatchLobbyGoToScoreSubmissionPageCopyWith<MatchLobbyGoToScoreSubmissionPage>
      get copyWith => _$MatchLobbyGoToScoreSubmissionPageCopyWithImpl<
          MatchLobbyGoToScoreSubmissionPage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LobbyCheckIn lobbyCheckIn) checkInNotification,
    required TResult Function(int lobbyId) leave,
    required TResult Function(User user, ActiveMatch activeMatch, bool silent)
        restoreState,
    required TResult Function(User user, int tournamentId, int lobbyId)
        restoreStateFromNotification,
    required TResult Function(LobbyParameters lobbyParameters) join,
    required TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)
        opponentCheckedIn,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchMakingMatch match)
        opponentSubmittedScore,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchMakingMatch match)
        scoreConfirmed,
    required TResult Function(MatchLobbyData matchLobbyData)
        goToScoreSubmissionPage,
    required TResult Function(
            MatchLobbyData matchLobbyData, int score1, int score2)
        submitScore,
    required TResult Function(
            MatchScores matchScores, MatchLobbyData matchLobbyData)
        acceptScore,
    required TResult Function(MatchLobbyData matchLobbyData) disputeScore,
    required TResult Function() close,
    required TResult Function(int tournamentId) matchmaking,
  }) {
    return goToScoreSubmissionPage(matchLobbyData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LobbyCheckIn lobbyCheckIn)? checkInNotification,
    TResult Function(int lobbyId)? leave,
    TResult Function(User user, ActiveMatch activeMatch, bool silent)?
        restoreState,
    TResult Function(User user, int tournamentId, int lobbyId)?
        restoreStateFromNotification,
    TResult Function(LobbyParameters lobbyParameters)? join,
    TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)?
        opponentCheckedIn,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        scoreConfirmed,
    TResult Function(MatchLobbyData matchLobbyData)? goToScoreSubmissionPage,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        submitScore,
    TResult Function(MatchScores matchScores, MatchLobbyData matchLobbyData)?
        acceptScore,
    TResult Function(MatchLobbyData matchLobbyData)? disputeScore,
    TResult Function()? close,
    TResult Function(int tournamentId)? matchmaking,
  }) {
    return goToScoreSubmissionPage?.call(matchLobbyData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LobbyCheckIn lobbyCheckIn)? checkInNotification,
    TResult Function(int lobbyId)? leave,
    TResult Function(User user, ActiveMatch activeMatch, bool silent)?
        restoreState,
    TResult Function(User user, int tournamentId, int lobbyId)?
        restoreStateFromNotification,
    TResult Function(LobbyParameters lobbyParameters)? join,
    TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)?
        opponentCheckedIn,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        scoreConfirmed,
    TResult Function(MatchLobbyData matchLobbyData)? goToScoreSubmissionPage,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        submitScore,
    TResult Function(MatchScores matchScores, MatchLobbyData matchLobbyData)?
        acceptScore,
    TResult Function(MatchLobbyData matchLobbyData)? disputeScore,
    TResult Function()? close,
    TResult Function(int tournamentId)? matchmaking,
    required TResult orElse(),
  }) {
    if (goToScoreSubmissionPage != null) {
      return goToScoreSubmissionPage(matchLobbyData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MatchLobbyCheckInNotification value)
        checkInNotification,
    required TResult Function(MatchLobbyLeave value) leave,
    required TResult Function(MatchLobbyRestoreState value) restoreState,
    required TResult Function(MatchLobbyRestoreStateFromNotification value)
        restoreStateFromNotification,
    required TResult Function(MatchLobbyJoin value) join,
    required TResult Function(MatchLobbyOpponentCheckedIn value)
        opponentCheckedIn,
    required TResult Function(MatchLobbyOpponentSubmittedScore value)
        opponentSubmittedScore,
    required TResult Function(MatchLobbyOpponentConfirmedScore value)
        scoreConfirmed,
    required TResult Function(MatchLobbyGoToScoreSubmissionPage value)
        goToScoreSubmissionPage,
    required TResult Function(MatchLobbySubmitScore value) submitScore,
    required TResult Function(MatchLobbyAcceptScore value) acceptScore,
    required TResult Function(MatchLobbyDisputeScore value) disputeScore,
    required TResult Function(MatchLobbyClose value) close,
    required TResult Function(MatchLobbyMatchmaking value) matchmaking,
  }) {
    return goToScoreSubmissionPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MatchLobbyCheckInNotification value)? checkInNotification,
    TResult Function(MatchLobbyLeave value)? leave,
    TResult Function(MatchLobbyRestoreState value)? restoreState,
    TResult Function(MatchLobbyRestoreStateFromNotification value)?
        restoreStateFromNotification,
    TResult Function(MatchLobbyJoin value)? join,
    TResult Function(MatchLobbyOpponentCheckedIn value)? opponentCheckedIn,
    TResult Function(MatchLobbyOpponentSubmittedScore value)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyOpponentConfirmedScore value)? scoreConfirmed,
    TResult Function(MatchLobbyGoToScoreSubmissionPage value)?
        goToScoreSubmissionPage,
    TResult Function(MatchLobbySubmitScore value)? submitScore,
    TResult Function(MatchLobbyAcceptScore value)? acceptScore,
    TResult Function(MatchLobbyDisputeScore value)? disputeScore,
    TResult Function(MatchLobbyClose value)? close,
    TResult Function(MatchLobbyMatchmaking value)? matchmaking,
  }) {
    return goToScoreSubmissionPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MatchLobbyCheckInNotification value)? checkInNotification,
    TResult Function(MatchLobbyLeave value)? leave,
    TResult Function(MatchLobbyRestoreState value)? restoreState,
    TResult Function(MatchLobbyRestoreStateFromNotification value)?
        restoreStateFromNotification,
    TResult Function(MatchLobbyJoin value)? join,
    TResult Function(MatchLobbyOpponentCheckedIn value)? opponentCheckedIn,
    TResult Function(MatchLobbyOpponentSubmittedScore value)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyOpponentConfirmedScore value)? scoreConfirmed,
    TResult Function(MatchLobbyGoToScoreSubmissionPage value)?
        goToScoreSubmissionPage,
    TResult Function(MatchLobbySubmitScore value)? submitScore,
    TResult Function(MatchLobbyAcceptScore value)? acceptScore,
    TResult Function(MatchLobbyDisputeScore value)? disputeScore,
    TResult Function(MatchLobbyClose value)? close,
    TResult Function(MatchLobbyMatchmaking value)? matchmaking,
    required TResult orElse(),
  }) {
    if (goToScoreSubmissionPage != null) {
      return goToScoreSubmissionPage(this);
    }
    return orElse();
  }
}

abstract class MatchLobbyGoToScoreSubmissionPage extends MatchLobbyEvent {
  const factory MatchLobbyGoToScoreSubmissionPage(
          {required MatchLobbyData matchLobbyData}) =
      _$MatchLobbyGoToScoreSubmissionPage;
  const MatchLobbyGoToScoreSubmissionPage._() : super._();

  MatchLobbyData get matchLobbyData;
  @JsonKey(ignore: true)
  $MatchLobbyGoToScoreSubmissionPageCopyWith<MatchLobbyGoToScoreSubmissionPage>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchLobbySubmitScoreCopyWith<$Res> {
  factory $MatchLobbySubmitScoreCopyWith(MatchLobbySubmitScore value,
          $Res Function(MatchLobbySubmitScore) then) =
      _$MatchLobbySubmitScoreCopyWithImpl<$Res>;
  $Res call({MatchLobbyData matchLobbyData, int score1, int score2});
}

/// @nodoc
class _$MatchLobbySubmitScoreCopyWithImpl<$Res>
    extends _$MatchLobbyEventCopyWithImpl<$Res>
    implements $MatchLobbySubmitScoreCopyWith<$Res> {
  _$MatchLobbySubmitScoreCopyWithImpl(
      MatchLobbySubmitScore _value, $Res Function(MatchLobbySubmitScore) _then)
      : super(_value, (v) => _then(v as MatchLobbySubmitScore));

  @override
  MatchLobbySubmitScore get _value => super._value as MatchLobbySubmitScore;

  @override
  $Res call({
    Object? matchLobbyData = freezed,
    Object? score1 = freezed,
    Object? score2 = freezed,
  }) {
    return _then(MatchLobbySubmitScore(
      matchLobbyData: matchLobbyData == freezed
          ? _value.matchLobbyData
          : matchLobbyData // ignore: cast_nullable_to_non_nullable
              as MatchLobbyData,
      score1: score1 == freezed
          ? _value.score1
          : score1 // ignore: cast_nullable_to_non_nullable
              as int,
      score2: score2 == freezed
          ? _value.score2
          : score2 // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$MatchLobbySubmitScore extends MatchLobbySubmitScore
    with DiagnosticableTreeMixin {
  const _$MatchLobbySubmitScore(
      {required this.matchLobbyData,
      required this.score1,
      required this.score2})
      : super._();

  @override
  final MatchLobbyData matchLobbyData;
  @override
  final int score1;
  @override
  final int score2;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MatchLobbyEvent.submitScore(matchLobbyData: $matchLobbyData, score1: $score1, score2: $score2)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MatchLobbyEvent.submitScore'))
      ..add(DiagnosticsProperty('matchLobbyData', matchLobbyData))
      ..add(DiagnosticsProperty('score1', score1))
      ..add(DiagnosticsProperty('score2', score2));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MatchLobbySubmitScore &&
            const DeepCollectionEquality()
                .equals(other.matchLobbyData, matchLobbyData) &&
            const DeepCollectionEquality().equals(other.score1, score1) &&
            const DeepCollectionEquality().equals(other.score2, score2));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(matchLobbyData),
      const DeepCollectionEquality().hash(score1),
      const DeepCollectionEquality().hash(score2));

  @JsonKey(ignore: true)
  @override
  $MatchLobbySubmitScoreCopyWith<MatchLobbySubmitScore> get copyWith =>
      _$MatchLobbySubmitScoreCopyWithImpl<MatchLobbySubmitScore>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LobbyCheckIn lobbyCheckIn) checkInNotification,
    required TResult Function(int lobbyId) leave,
    required TResult Function(User user, ActiveMatch activeMatch, bool silent)
        restoreState,
    required TResult Function(User user, int tournamentId, int lobbyId)
        restoreStateFromNotification,
    required TResult Function(LobbyParameters lobbyParameters) join,
    required TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)
        opponentCheckedIn,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchMakingMatch match)
        opponentSubmittedScore,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchMakingMatch match)
        scoreConfirmed,
    required TResult Function(MatchLobbyData matchLobbyData)
        goToScoreSubmissionPage,
    required TResult Function(
            MatchLobbyData matchLobbyData, int score1, int score2)
        submitScore,
    required TResult Function(
            MatchScores matchScores, MatchLobbyData matchLobbyData)
        acceptScore,
    required TResult Function(MatchLobbyData matchLobbyData) disputeScore,
    required TResult Function() close,
    required TResult Function(int tournamentId) matchmaking,
  }) {
    return submitScore(matchLobbyData, score1, score2);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LobbyCheckIn lobbyCheckIn)? checkInNotification,
    TResult Function(int lobbyId)? leave,
    TResult Function(User user, ActiveMatch activeMatch, bool silent)?
        restoreState,
    TResult Function(User user, int tournamentId, int lobbyId)?
        restoreStateFromNotification,
    TResult Function(LobbyParameters lobbyParameters)? join,
    TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)?
        opponentCheckedIn,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        scoreConfirmed,
    TResult Function(MatchLobbyData matchLobbyData)? goToScoreSubmissionPage,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        submitScore,
    TResult Function(MatchScores matchScores, MatchLobbyData matchLobbyData)?
        acceptScore,
    TResult Function(MatchLobbyData matchLobbyData)? disputeScore,
    TResult Function()? close,
    TResult Function(int tournamentId)? matchmaking,
  }) {
    return submitScore?.call(matchLobbyData, score1, score2);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LobbyCheckIn lobbyCheckIn)? checkInNotification,
    TResult Function(int lobbyId)? leave,
    TResult Function(User user, ActiveMatch activeMatch, bool silent)?
        restoreState,
    TResult Function(User user, int tournamentId, int lobbyId)?
        restoreStateFromNotification,
    TResult Function(LobbyParameters lobbyParameters)? join,
    TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)?
        opponentCheckedIn,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        scoreConfirmed,
    TResult Function(MatchLobbyData matchLobbyData)? goToScoreSubmissionPage,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        submitScore,
    TResult Function(MatchScores matchScores, MatchLobbyData matchLobbyData)?
        acceptScore,
    TResult Function(MatchLobbyData matchLobbyData)? disputeScore,
    TResult Function()? close,
    TResult Function(int tournamentId)? matchmaking,
    required TResult orElse(),
  }) {
    if (submitScore != null) {
      return submitScore(matchLobbyData, score1, score2);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MatchLobbyCheckInNotification value)
        checkInNotification,
    required TResult Function(MatchLobbyLeave value) leave,
    required TResult Function(MatchLobbyRestoreState value) restoreState,
    required TResult Function(MatchLobbyRestoreStateFromNotification value)
        restoreStateFromNotification,
    required TResult Function(MatchLobbyJoin value) join,
    required TResult Function(MatchLobbyOpponentCheckedIn value)
        opponentCheckedIn,
    required TResult Function(MatchLobbyOpponentSubmittedScore value)
        opponentSubmittedScore,
    required TResult Function(MatchLobbyOpponentConfirmedScore value)
        scoreConfirmed,
    required TResult Function(MatchLobbyGoToScoreSubmissionPage value)
        goToScoreSubmissionPage,
    required TResult Function(MatchLobbySubmitScore value) submitScore,
    required TResult Function(MatchLobbyAcceptScore value) acceptScore,
    required TResult Function(MatchLobbyDisputeScore value) disputeScore,
    required TResult Function(MatchLobbyClose value) close,
    required TResult Function(MatchLobbyMatchmaking value) matchmaking,
  }) {
    return submitScore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MatchLobbyCheckInNotification value)? checkInNotification,
    TResult Function(MatchLobbyLeave value)? leave,
    TResult Function(MatchLobbyRestoreState value)? restoreState,
    TResult Function(MatchLobbyRestoreStateFromNotification value)?
        restoreStateFromNotification,
    TResult Function(MatchLobbyJoin value)? join,
    TResult Function(MatchLobbyOpponentCheckedIn value)? opponentCheckedIn,
    TResult Function(MatchLobbyOpponentSubmittedScore value)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyOpponentConfirmedScore value)? scoreConfirmed,
    TResult Function(MatchLobbyGoToScoreSubmissionPage value)?
        goToScoreSubmissionPage,
    TResult Function(MatchLobbySubmitScore value)? submitScore,
    TResult Function(MatchLobbyAcceptScore value)? acceptScore,
    TResult Function(MatchLobbyDisputeScore value)? disputeScore,
    TResult Function(MatchLobbyClose value)? close,
    TResult Function(MatchLobbyMatchmaking value)? matchmaking,
  }) {
    return submitScore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MatchLobbyCheckInNotification value)? checkInNotification,
    TResult Function(MatchLobbyLeave value)? leave,
    TResult Function(MatchLobbyRestoreState value)? restoreState,
    TResult Function(MatchLobbyRestoreStateFromNotification value)?
        restoreStateFromNotification,
    TResult Function(MatchLobbyJoin value)? join,
    TResult Function(MatchLobbyOpponentCheckedIn value)? opponentCheckedIn,
    TResult Function(MatchLobbyOpponentSubmittedScore value)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyOpponentConfirmedScore value)? scoreConfirmed,
    TResult Function(MatchLobbyGoToScoreSubmissionPage value)?
        goToScoreSubmissionPage,
    TResult Function(MatchLobbySubmitScore value)? submitScore,
    TResult Function(MatchLobbyAcceptScore value)? acceptScore,
    TResult Function(MatchLobbyDisputeScore value)? disputeScore,
    TResult Function(MatchLobbyClose value)? close,
    TResult Function(MatchLobbyMatchmaking value)? matchmaking,
    required TResult orElse(),
  }) {
    if (submitScore != null) {
      return submitScore(this);
    }
    return orElse();
  }
}

abstract class MatchLobbySubmitScore extends MatchLobbyEvent {
  const factory MatchLobbySubmitScore(
      {required MatchLobbyData matchLobbyData,
      required int score1,
      required int score2}) = _$MatchLobbySubmitScore;
  const MatchLobbySubmitScore._() : super._();

  MatchLobbyData get matchLobbyData;
  int get score1;
  int get score2;
  @JsonKey(ignore: true)
  $MatchLobbySubmitScoreCopyWith<MatchLobbySubmitScore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchLobbyAcceptScoreCopyWith<$Res> {
  factory $MatchLobbyAcceptScoreCopyWith(MatchLobbyAcceptScore value,
          $Res Function(MatchLobbyAcceptScore) then) =
      _$MatchLobbyAcceptScoreCopyWithImpl<$Res>;
  $Res call({MatchScores matchScores, MatchLobbyData matchLobbyData});
}

/// @nodoc
class _$MatchLobbyAcceptScoreCopyWithImpl<$Res>
    extends _$MatchLobbyEventCopyWithImpl<$Res>
    implements $MatchLobbyAcceptScoreCopyWith<$Res> {
  _$MatchLobbyAcceptScoreCopyWithImpl(
      MatchLobbyAcceptScore _value, $Res Function(MatchLobbyAcceptScore) _then)
      : super(_value, (v) => _then(v as MatchLobbyAcceptScore));

  @override
  MatchLobbyAcceptScore get _value => super._value as MatchLobbyAcceptScore;

  @override
  $Res call({
    Object? matchScores = freezed,
    Object? matchLobbyData = freezed,
  }) {
    return _then(MatchLobbyAcceptScore(
      matchScores: matchScores == freezed
          ? _value.matchScores
          : matchScores // ignore: cast_nullable_to_non_nullable
              as MatchScores,
      matchLobbyData: matchLobbyData == freezed
          ? _value.matchLobbyData
          : matchLobbyData // ignore: cast_nullable_to_non_nullable
              as MatchLobbyData,
    ));
  }
}

/// @nodoc

class _$MatchLobbyAcceptScore extends MatchLobbyAcceptScore
    with DiagnosticableTreeMixin {
  const _$MatchLobbyAcceptScore(
      {required this.matchScores, required this.matchLobbyData})
      : super._();

  @override
  final MatchScores matchScores;
  @override
  final MatchLobbyData matchLobbyData;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MatchLobbyEvent.acceptScore(matchScores: $matchScores, matchLobbyData: $matchLobbyData)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MatchLobbyEvent.acceptScore'))
      ..add(DiagnosticsProperty('matchScores', matchScores))
      ..add(DiagnosticsProperty('matchLobbyData', matchLobbyData));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MatchLobbyAcceptScore &&
            const DeepCollectionEquality()
                .equals(other.matchScores, matchScores) &&
            const DeepCollectionEquality()
                .equals(other.matchLobbyData, matchLobbyData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(matchScores),
      const DeepCollectionEquality().hash(matchLobbyData));

  @JsonKey(ignore: true)
  @override
  $MatchLobbyAcceptScoreCopyWith<MatchLobbyAcceptScore> get copyWith =>
      _$MatchLobbyAcceptScoreCopyWithImpl<MatchLobbyAcceptScore>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LobbyCheckIn lobbyCheckIn) checkInNotification,
    required TResult Function(int lobbyId) leave,
    required TResult Function(User user, ActiveMatch activeMatch, bool silent)
        restoreState,
    required TResult Function(User user, int tournamentId, int lobbyId)
        restoreStateFromNotification,
    required TResult Function(LobbyParameters lobbyParameters) join,
    required TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)
        opponentCheckedIn,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchMakingMatch match)
        opponentSubmittedScore,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchMakingMatch match)
        scoreConfirmed,
    required TResult Function(MatchLobbyData matchLobbyData)
        goToScoreSubmissionPage,
    required TResult Function(
            MatchLobbyData matchLobbyData, int score1, int score2)
        submitScore,
    required TResult Function(
            MatchScores matchScores, MatchLobbyData matchLobbyData)
        acceptScore,
    required TResult Function(MatchLobbyData matchLobbyData) disputeScore,
    required TResult Function() close,
    required TResult Function(int tournamentId) matchmaking,
  }) {
    return acceptScore(matchScores, matchLobbyData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LobbyCheckIn lobbyCheckIn)? checkInNotification,
    TResult Function(int lobbyId)? leave,
    TResult Function(User user, ActiveMatch activeMatch, bool silent)?
        restoreState,
    TResult Function(User user, int tournamentId, int lobbyId)?
        restoreStateFromNotification,
    TResult Function(LobbyParameters lobbyParameters)? join,
    TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)?
        opponentCheckedIn,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        scoreConfirmed,
    TResult Function(MatchLobbyData matchLobbyData)? goToScoreSubmissionPage,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        submitScore,
    TResult Function(MatchScores matchScores, MatchLobbyData matchLobbyData)?
        acceptScore,
    TResult Function(MatchLobbyData matchLobbyData)? disputeScore,
    TResult Function()? close,
    TResult Function(int tournamentId)? matchmaking,
  }) {
    return acceptScore?.call(matchScores, matchLobbyData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LobbyCheckIn lobbyCheckIn)? checkInNotification,
    TResult Function(int lobbyId)? leave,
    TResult Function(User user, ActiveMatch activeMatch, bool silent)?
        restoreState,
    TResult Function(User user, int tournamentId, int lobbyId)?
        restoreStateFromNotification,
    TResult Function(LobbyParameters lobbyParameters)? join,
    TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)?
        opponentCheckedIn,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        scoreConfirmed,
    TResult Function(MatchLobbyData matchLobbyData)? goToScoreSubmissionPage,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        submitScore,
    TResult Function(MatchScores matchScores, MatchLobbyData matchLobbyData)?
        acceptScore,
    TResult Function(MatchLobbyData matchLobbyData)? disputeScore,
    TResult Function()? close,
    TResult Function(int tournamentId)? matchmaking,
    required TResult orElse(),
  }) {
    if (acceptScore != null) {
      return acceptScore(matchScores, matchLobbyData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MatchLobbyCheckInNotification value)
        checkInNotification,
    required TResult Function(MatchLobbyLeave value) leave,
    required TResult Function(MatchLobbyRestoreState value) restoreState,
    required TResult Function(MatchLobbyRestoreStateFromNotification value)
        restoreStateFromNotification,
    required TResult Function(MatchLobbyJoin value) join,
    required TResult Function(MatchLobbyOpponentCheckedIn value)
        opponentCheckedIn,
    required TResult Function(MatchLobbyOpponentSubmittedScore value)
        opponentSubmittedScore,
    required TResult Function(MatchLobbyOpponentConfirmedScore value)
        scoreConfirmed,
    required TResult Function(MatchLobbyGoToScoreSubmissionPage value)
        goToScoreSubmissionPage,
    required TResult Function(MatchLobbySubmitScore value) submitScore,
    required TResult Function(MatchLobbyAcceptScore value) acceptScore,
    required TResult Function(MatchLobbyDisputeScore value) disputeScore,
    required TResult Function(MatchLobbyClose value) close,
    required TResult Function(MatchLobbyMatchmaking value) matchmaking,
  }) {
    return acceptScore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MatchLobbyCheckInNotification value)? checkInNotification,
    TResult Function(MatchLobbyLeave value)? leave,
    TResult Function(MatchLobbyRestoreState value)? restoreState,
    TResult Function(MatchLobbyRestoreStateFromNotification value)?
        restoreStateFromNotification,
    TResult Function(MatchLobbyJoin value)? join,
    TResult Function(MatchLobbyOpponentCheckedIn value)? opponentCheckedIn,
    TResult Function(MatchLobbyOpponentSubmittedScore value)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyOpponentConfirmedScore value)? scoreConfirmed,
    TResult Function(MatchLobbyGoToScoreSubmissionPage value)?
        goToScoreSubmissionPage,
    TResult Function(MatchLobbySubmitScore value)? submitScore,
    TResult Function(MatchLobbyAcceptScore value)? acceptScore,
    TResult Function(MatchLobbyDisputeScore value)? disputeScore,
    TResult Function(MatchLobbyClose value)? close,
    TResult Function(MatchLobbyMatchmaking value)? matchmaking,
  }) {
    return acceptScore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MatchLobbyCheckInNotification value)? checkInNotification,
    TResult Function(MatchLobbyLeave value)? leave,
    TResult Function(MatchLobbyRestoreState value)? restoreState,
    TResult Function(MatchLobbyRestoreStateFromNotification value)?
        restoreStateFromNotification,
    TResult Function(MatchLobbyJoin value)? join,
    TResult Function(MatchLobbyOpponentCheckedIn value)? opponentCheckedIn,
    TResult Function(MatchLobbyOpponentSubmittedScore value)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyOpponentConfirmedScore value)? scoreConfirmed,
    TResult Function(MatchLobbyGoToScoreSubmissionPage value)?
        goToScoreSubmissionPage,
    TResult Function(MatchLobbySubmitScore value)? submitScore,
    TResult Function(MatchLobbyAcceptScore value)? acceptScore,
    TResult Function(MatchLobbyDisputeScore value)? disputeScore,
    TResult Function(MatchLobbyClose value)? close,
    TResult Function(MatchLobbyMatchmaking value)? matchmaking,
    required TResult orElse(),
  }) {
    if (acceptScore != null) {
      return acceptScore(this);
    }
    return orElse();
  }
}

abstract class MatchLobbyAcceptScore extends MatchLobbyEvent {
  const factory MatchLobbyAcceptScore(
      {required MatchScores matchScores,
      required MatchLobbyData matchLobbyData}) = _$MatchLobbyAcceptScore;
  const MatchLobbyAcceptScore._() : super._();

  MatchScores get matchScores;
  MatchLobbyData get matchLobbyData;
  @JsonKey(ignore: true)
  $MatchLobbyAcceptScoreCopyWith<MatchLobbyAcceptScore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchLobbyDisputeScoreCopyWith<$Res> {
  factory $MatchLobbyDisputeScoreCopyWith(MatchLobbyDisputeScore value,
          $Res Function(MatchLobbyDisputeScore) then) =
      _$MatchLobbyDisputeScoreCopyWithImpl<$Res>;
  $Res call({MatchLobbyData matchLobbyData});
}

/// @nodoc
class _$MatchLobbyDisputeScoreCopyWithImpl<$Res>
    extends _$MatchLobbyEventCopyWithImpl<$Res>
    implements $MatchLobbyDisputeScoreCopyWith<$Res> {
  _$MatchLobbyDisputeScoreCopyWithImpl(MatchLobbyDisputeScore _value,
      $Res Function(MatchLobbyDisputeScore) _then)
      : super(_value, (v) => _then(v as MatchLobbyDisputeScore));

  @override
  MatchLobbyDisputeScore get _value => super._value as MatchLobbyDisputeScore;

  @override
  $Res call({
    Object? matchLobbyData = freezed,
  }) {
    return _then(MatchLobbyDisputeScore(
      matchLobbyData: matchLobbyData == freezed
          ? _value.matchLobbyData
          : matchLobbyData // ignore: cast_nullable_to_non_nullable
              as MatchLobbyData,
    ));
  }
}

/// @nodoc

class _$MatchLobbyDisputeScore extends MatchLobbyDisputeScore
    with DiagnosticableTreeMixin {
  const _$MatchLobbyDisputeScore({required this.matchLobbyData}) : super._();

  @override
  final MatchLobbyData matchLobbyData;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MatchLobbyEvent.disputeScore(matchLobbyData: $matchLobbyData)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MatchLobbyEvent.disputeScore'))
      ..add(DiagnosticsProperty('matchLobbyData', matchLobbyData));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MatchLobbyDisputeScore &&
            const DeepCollectionEquality()
                .equals(other.matchLobbyData, matchLobbyData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(matchLobbyData));

  @JsonKey(ignore: true)
  @override
  $MatchLobbyDisputeScoreCopyWith<MatchLobbyDisputeScore> get copyWith =>
      _$MatchLobbyDisputeScoreCopyWithImpl<MatchLobbyDisputeScore>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LobbyCheckIn lobbyCheckIn) checkInNotification,
    required TResult Function(int lobbyId) leave,
    required TResult Function(User user, ActiveMatch activeMatch, bool silent)
        restoreState,
    required TResult Function(User user, int tournamentId, int lobbyId)
        restoreStateFromNotification,
    required TResult Function(LobbyParameters lobbyParameters) join,
    required TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)
        opponentCheckedIn,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchMakingMatch match)
        opponentSubmittedScore,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchMakingMatch match)
        scoreConfirmed,
    required TResult Function(MatchLobbyData matchLobbyData)
        goToScoreSubmissionPage,
    required TResult Function(
            MatchLobbyData matchLobbyData, int score1, int score2)
        submitScore,
    required TResult Function(
            MatchScores matchScores, MatchLobbyData matchLobbyData)
        acceptScore,
    required TResult Function(MatchLobbyData matchLobbyData) disputeScore,
    required TResult Function() close,
    required TResult Function(int tournamentId) matchmaking,
  }) {
    return disputeScore(matchLobbyData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LobbyCheckIn lobbyCheckIn)? checkInNotification,
    TResult Function(int lobbyId)? leave,
    TResult Function(User user, ActiveMatch activeMatch, bool silent)?
        restoreState,
    TResult Function(User user, int tournamentId, int lobbyId)?
        restoreStateFromNotification,
    TResult Function(LobbyParameters lobbyParameters)? join,
    TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)?
        opponentCheckedIn,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        scoreConfirmed,
    TResult Function(MatchLobbyData matchLobbyData)? goToScoreSubmissionPage,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        submitScore,
    TResult Function(MatchScores matchScores, MatchLobbyData matchLobbyData)?
        acceptScore,
    TResult Function(MatchLobbyData matchLobbyData)? disputeScore,
    TResult Function()? close,
    TResult Function(int tournamentId)? matchmaking,
  }) {
    return disputeScore?.call(matchLobbyData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LobbyCheckIn lobbyCheckIn)? checkInNotification,
    TResult Function(int lobbyId)? leave,
    TResult Function(User user, ActiveMatch activeMatch, bool silent)?
        restoreState,
    TResult Function(User user, int tournamentId, int lobbyId)?
        restoreStateFromNotification,
    TResult Function(LobbyParameters lobbyParameters)? join,
    TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)?
        opponentCheckedIn,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        scoreConfirmed,
    TResult Function(MatchLobbyData matchLobbyData)? goToScoreSubmissionPage,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        submitScore,
    TResult Function(MatchScores matchScores, MatchLobbyData matchLobbyData)?
        acceptScore,
    TResult Function(MatchLobbyData matchLobbyData)? disputeScore,
    TResult Function()? close,
    TResult Function(int tournamentId)? matchmaking,
    required TResult orElse(),
  }) {
    if (disputeScore != null) {
      return disputeScore(matchLobbyData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MatchLobbyCheckInNotification value)
        checkInNotification,
    required TResult Function(MatchLobbyLeave value) leave,
    required TResult Function(MatchLobbyRestoreState value) restoreState,
    required TResult Function(MatchLobbyRestoreStateFromNotification value)
        restoreStateFromNotification,
    required TResult Function(MatchLobbyJoin value) join,
    required TResult Function(MatchLobbyOpponentCheckedIn value)
        opponentCheckedIn,
    required TResult Function(MatchLobbyOpponentSubmittedScore value)
        opponentSubmittedScore,
    required TResult Function(MatchLobbyOpponentConfirmedScore value)
        scoreConfirmed,
    required TResult Function(MatchLobbyGoToScoreSubmissionPage value)
        goToScoreSubmissionPage,
    required TResult Function(MatchLobbySubmitScore value) submitScore,
    required TResult Function(MatchLobbyAcceptScore value) acceptScore,
    required TResult Function(MatchLobbyDisputeScore value) disputeScore,
    required TResult Function(MatchLobbyClose value) close,
    required TResult Function(MatchLobbyMatchmaking value) matchmaking,
  }) {
    return disputeScore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MatchLobbyCheckInNotification value)? checkInNotification,
    TResult Function(MatchLobbyLeave value)? leave,
    TResult Function(MatchLobbyRestoreState value)? restoreState,
    TResult Function(MatchLobbyRestoreStateFromNotification value)?
        restoreStateFromNotification,
    TResult Function(MatchLobbyJoin value)? join,
    TResult Function(MatchLobbyOpponentCheckedIn value)? opponentCheckedIn,
    TResult Function(MatchLobbyOpponentSubmittedScore value)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyOpponentConfirmedScore value)? scoreConfirmed,
    TResult Function(MatchLobbyGoToScoreSubmissionPage value)?
        goToScoreSubmissionPage,
    TResult Function(MatchLobbySubmitScore value)? submitScore,
    TResult Function(MatchLobbyAcceptScore value)? acceptScore,
    TResult Function(MatchLobbyDisputeScore value)? disputeScore,
    TResult Function(MatchLobbyClose value)? close,
    TResult Function(MatchLobbyMatchmaking value)? matchmaking,
  }) {
    return disputeScore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MatchLobbyCheckInNotification value)? checkInNotification,
    TResult Function(MatchLobbyLeave value)? leave,
    TResult Function(MatchLobbyRestoreState value)? restoreState,
    TResult Function(MatchLobbyRestoreStateFromNotification value)?
        restoreStateFromNotification,
    TResult Function(MatchLobbyJoin value)? join,
    TResult Function(MatchLobbyOpponentCheckedIn value)? opponentCheckedIn,
    TResult Function(MatchLobbyOpponentSubmittedScore value)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyOpponentConfirmedScore value)? scoreConfirmed,
    TResult Function(MatchLobbyGoToScoreSubmissionPage value)?
        goToScoreSubmissionPage,
    TResult Function(MatchLobbySubmitScore value)? submitScore,
    TResult Function(MatchLobbyAcceptScore value)? acceptScore,
    TResult Function(MatchLobbyDisputeScore value)? disputeScore,
    TResult Function(MatchLobbyClose value)? close,
    TResult Function(MatchLobbyMatchmaking value)? matchmaking,
    required TResult orElse(),
  }) {
    if (disputeScore != null) {
      return disputeScore(this);
    }
    return orElse();
  }
}

abstract class MatchLobbyDisputeScore extends MatchLobbyEvent {
  const factory MatchLobbyDisputeScore(
      {required MatchLobbyData matchLobbyData}) = _$MatchLobbyDisputeScore;
  const MatchLobbyDisputeScore._() : super._();

  MatchLobbyData get matchLobbyData;
  @JsonKey(ignore: true)
  $MatchLobbyDisputeScoreCopyWith<MatchLobbyDisputeScore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchLobbyCloseCopyWith<$Res> {
  factory $MatchLobbyCloseCopyWith(
          MatchLobbyClose value, $Res Function(MatchLobbyClose) then) =
      _$MatchLobbyCloseCopyWithImpl<$Res>;
}

/// @nodoc
class _$MatchLobbyCloseCopyWithImpl<$Res>
    extends _$MatchLobbyEventCopyWithImpl<$Res>
    implements $MatchLobbyCloseCopyWith<$Res> {
  _$MatchLobbyCloseCopyWithImpl(
      MatchLobbyClose _value, $Res Function(MatchLobbyClose) _then)
      : super(_value, (v) => _then(v as MatchLobbyClose));

  @override
  MatchLobbyClose get _value => super._value as MatchLobbyClose;
}

/// @nodoc

class _$MatchLobbyClose extends MatchLobbyClose with DiagnosticableTreeMixin {
  const _$MatchLobbyClose() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MatchLobbyEvent.close()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'MatchLobbyEvent.close'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is MatchLobbyClose);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LobbyCheckIn lobbyCheckIn) checkInNotification,
    required TResult Function(int lobbyId) leave,
    required TResult Function(User user, ActiveMatch activeMatch, bool silent)
        restoreState,
    required TResult Function(User user, int tournamentId, int lobbyId)
        restoreStateFromNotification,
    required TResult Function(LobbyParameters lobbyParameters) join,
    required TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)
        opponentCheckedIn,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchMakingMatch match)
        opponentSubmittedScore,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchMakingMatch match)
        scoreConfirmed,
    required TResult Function(MatchLobbyData matchLobbyData)
        goToScoreSubmissionPage,
    required TResult Function(
            MatchLobbyData matchLobbyData, int score1, int score2)
        submitScore,
    required TResult Function(
            MatchScores matchScores, MatchLobbyData matchLobbyData)
        acceptScore,
    required TResult Function(MatchLobbyData matchLobbyData) disputeScore,
    required TResult Function() close,
    required TResult Function(int tournamentId) matchmaking,
  }) {
    return close();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LobbyCheckIn lobbyCheckIn)? checkInNotification,
    TResult Function(int lobbyId)? leave,
    TResult Function(User user, ActiveMatch activeMatch, bool silent)?
        restoreState,
    TResult Function(User user, int tournamentId, int lobbyId)?
        restoreStateFromNotification,
    TResult Function(LobbyParameters lobbyParameters)? join,
    TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)?
        opponentCheckedIn,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        scoreConfirmed,
    TResult Function(MatchLobbyData matchLobbyData)? goToScoreSubmissionPage,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        submitScore,
    TResult Function(MatchScores matchScores, MatchLobbyData matchLobbyData)?
        acceptScore,
    TResult Function(MatchLobbyData matchLobbyData)? disputeScore,
    TResult Function()? close,
    TResult Function(int tournamentId)? matchmaking,
  }) {
    return close?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LobbyCheckIn lobbyCheckIn)? checkInNotification,
    TResult Function(int lobbyId)? leave,
    TResult Function(User user, ActiveMatch activeMatch, bool silent)?
        restoreState,
    TResult Function(User user, int tournamentId, int lobbyId)?
        restoreStateFromNotification,
    TResult Function(LobbyParameters lobbyParameters)? join,
    TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)?
        opponentCheckedIn,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        scoreConfirmed,
    TResult Function(MatchLobbyData matchLobbyData)? goToScoreSubmissionPage,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        submitScore,
    TResult Function(MatchScores matchScores, MatchLobbyData matchLobbyData)?
        acceptScore,
    TResult Function(MatchLobbyData matchLobbyData)? disputeScore,
    TResult Function()? close,
    TResult Function(int tournamentId)? matchmaking,
    required TResult orElse(),
  }) {
    if (close != null) {
      return close();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MatchLobbyCheckInNotification value)
        checkInNotification,
    required TResult Function(MatchLobbyLeave value) leave,
    required TResult Function(MatchLobbyRestoreState value) restoreState,
    required TResult Function(MatchLobbyRestoreStateFromNotification value)
        restoreStateFromNotification,
    required TResult Function(MatchLobbyJoin value) join,
    required TResult Function(MatchLobbyOpponentCheckedIn value)
        opponentCheckedIn,
    required TResult Function(MatchLobbyOpponentSubmittedScore value)
        opponentSubmittedScore,
    required TResult Function(MatchLobbyOpponentConfirmedScore value)
        scoreConfirmed,
    required TResult Function(MatchLobbyGoToScoreSubmissionPage value)
        goToScoreSubmissionPage,
    required TResult Function(MatchLobbySubmitScore value) submitScore,
    required TResult Function(MatchLobbyAcceptScore value) acceptScore,
    required TResult Function(MatchLobbyDisputeScore value) disputeScore,
    required TResult Function(MatchLobbyClose value) close,
    required TResult Function(MatchLobbyMatchmaking value) matchmaking,
  }) {
    return close(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MatchLobbyCheckInNotification value)? checkInNotification,
    TResult Function(MatchLobbyLeave value)? leave,
    TResult Function(MatchLobbyRestoreState value)? restoreState,
    TResult Function(MatchLobbyRestoreStateFromNotification value)?
        restoreStateFromNotification,
    TResult Function(MatchLobbyJoin value)? join,
    TResult Function(MatchLobbyOpponentCheckedIn value)? opponentCheckedIn,
    TResult Function(MatchLobbyOpponentSubmittedScore value)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyOpponentConfirmedScore value)? scoreConfirmed,
    TResult Function(MatchLobbyGoToScoreSubmissionPage value)?
        goToScoreSubmissionPage,
    TResult Function(MatchLobbySubmitScore value)? submitScore,
    TResult Function(MatchLobbyAcceptScore value)? acceptScore,
    TResult Function(MatchLobbyDisputeScore value)? disputeScore,
    TResult Function(MatchLobbyClose value)? close,
    TResult Function(MatchLobbyMatchmaking value)? matchmaking,
  }) {
    return close?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MatchLobbyCheckInNotification value)? checkInNotification,
    TResult Function(MatchLobbyLeave value)? leave,
    TResult Function(MatchLobbyRestoreState value)? restoreState,
    TResult Function(MatchLobbyRestoreStateFromNotification value)?
        restoreStateFromNotification,
    TResult Function(MatchLobbyJoin value)? join,
    TResult Function(MatchLobbyOpponentCheckedIn value)? opponentCheckedIn,
    TResult Function(MatchLobbyOpponentSubmittedScore value)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyOpponentConfirmedScore value)? scoreConfirmed,
    TResult Function(MatchLobbyGoToScoreSubmissionPage value)?
        goToScoreSubmissionPage,
    TResult Function(MatchLobbySubmitScore value)? submitScore,
    TResult Function(MatchLobbyAcceptScore value)? acceptScore,
    TResult Function(MatchLobbyDisputeScore value)? disputeScore,
    TResult Function(MatchLobbyClose value)? close,
    TResult Function(MatchLobbyMatchmaking value)? matchmaking,
    required TResult orElse(),
  }) {
    if (close != null) {
      return close(this);
    }
    return orElse();
  }
}

abstract class MatchLobbyClose extends MatchLobbyEvent {
  const factory MatchLobbyClose() = _$MatchLobbyClose;
  const MatchLobbyClose._() : super._();
}

/// @nodoc
abstract class $MatchLobbyMatchmakingCopyWith<$Res> {
  factory $MatchLobbyMatchmakingCopyWith(MatchLobbyMatchmaking value,
          $Res Function(MatchLobbyMatchmaking) then) =
      _$MatchLobbyMatchmakingCopyWithImpl<$Res>;
  $Res call({int tournamentId});
}

/// @nodoc
class _$MatchLobbyMatchmakingCopyWithImpl<$Res>
    extends _$MatchLobbyEventCopyWithImpl<$Res>
    implements $MatchLobbyMatchmakingCopyWith<$Res> {
  _$MatchLobbyMatchmakingCopyWithImpl(
      MatchLobbyMatchmaking _value, $Res Function(MatchLobbyMatchmaking) _then)
      : super(_value, (v) => _then(v as MatchLobbyMatchmaking));

  @override
  MatchLobbyMatchmaking get _value => super._value as MatchLobbyMatchmaking;

  @override
  $Res call({
    Object? tournamentId = freezed,
  }) {
    return _then(MatchLobbyMatchmaking(
      tournamentId: tournamentId == freezed
          ? _value.tournamentId
          : tournamentId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$MatchLobbyMatchmaking extends MatchLobbyMatchmaking
    with DiagnosticableTreeMixin {
  const _$MatchLobbyMatchmaking({required this.tournamentId}) : super._();

  @override
  final int tournamentId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MatchLobbyEvent.matchmaking(tournamentId: $tournamentId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MatchLobbyEvent.matchmaking'))
      ..add(DiagnosticsProperty('tournamentId', tournamentId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MatchLobbyMatchmaking &&
            const DeepCollectionEquality()
                .equals(other.tournamentId, tournamentId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(tournamentId));

  @JsonKey(ignore: true)
  @override
  $MatchLobbyMatchmakingCopyWith<MatchLobbyMatchmaking> get copyWith =>
      _$MatchLobbyMatchmakingCopyWithImpl<MatchLobbyMatchmaking>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LobbyCheckIn lobbyCheckIn) checkInNotification,
    required TResult Function(int lobbyId) leave,
    required TResult Function(User user, ActiveMatch activeMatch, bool silent)
        restoreState,
    required TResult Function(User user, int tournamentId, int lobbyId)
        restoreStateFromNotification,
    required TResult Function(LobbyParameters lobbyParameters) join,
    required TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)
        opponentCheckedIn,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchMakingMatch match)
        opponentSubmittedScore,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchMakingMatch match)
        scoreConfirmed,
    required TResult Function(MatchLobbyData matchLobbyData)
        goToScoreSubmissionPage,
    required TResult Function(
            MatchLobbyData matchLobbyData, int score1, int score2)
        submitScore,
    required TResult Function(
            MatchScores matchScores, MatchLobbyData matchLobbyData)
        acceptScore,
    required TResult Function(MatchLobbyData matchLobbyData) disputeScore,
    required TResult Function() close,
    required TResult Function(int tournamentId) matchmaking,
  }) {
    return matchmaking(tournamentId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LobbyCheckIn lobbyCheckIn)? checkInNotification,
    TResult Function(int lobbyId)? leave,
    TResult Function(User user, ActiveMatch activeMatch, bool silent)?
        restoreState,
    TResult Function(User user, int tournamentId, int lobbyId)?
        restoreStateFromNotification,
    TResult Function(LobbyParameters lobbyParameters)? join,
    TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)?
        opponentCheckedIn,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        scoreConfirmed,
    TResult Function(MatchLobbyData matchLobbyData)? goToScoreSubmissionPage,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        submitScore,
    TResult Function(MatchScores matchScores, MatchLobbyData matchLobbyData)?
        acceptScore,
    TResult Function(MatchLobbyData matchLobbyData)? disputeScore,
    TResult Function()? close,
    TResult Function(int tournamentId)? matchmaking,
  }) {
    return matchmaking?.call(tournamentId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LobbyCheckIn lobbyCheckIn)? checkInNotification,
    TResult Function(int lobbyId)? leave,
    TResult Function(User user, ActiveMatch activeMatch, bool silent)?
        restoreState,
    TResult Function(User user, int tournamentId, int lobbyId)?
        restoreStateFromNotification,
    TResult Function(LobbyParameters lobbyParameters)? join,
    TResult Function(
            int? matchId, LobbyParameters lobbyParameters, bool silent)?
        opponentCheckedIn,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyData matchLobbyData, MatchMakingMatch match)?
        scoreConfirmed,
    TResult Function(MatchLobbyData matchLobbyData)? goToScoreSubmissionPage,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        submitScore,
    TResult Function(MatchScores matchScores, MatchLobbyData matchLobbyData)?
        acceptScore,
    TResult Function(MatchLobbyData matchLobbyData)? disputeScore,
    TResult Function()? close,
    TResult Function(int tournamentId)? matchmaking,
    required TResult orElse(),
  }) {
    if (matchmaking != null) {
      return matchmaking(tournamentId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MatchLobbyCheckInNotification value)
        checkInNotification,
    required TResult Function(MatchLobbyLeave value) leave,
    required TResult Function(MatchLobbyRestoreState value) restoreState,
    required TResult Function(MatchLobbyRestoreStateFromNotification value)
        restoreStateFromNotification,
    required TResult Function(MatchLobbyJoin value) join,
    required TResult Function(MatchLobbyOpponentCheckedIn value)
        opponentCheckedIn,
    required TResult Function(MatchLobbyOpponentSubmittedScore value)
        opponentSubmittedScore,
    required TResult Function(MatchLobbyOpponentConfirmedScore value)
        scoreConfirmed,
    required TResult Function(MatchLobbyGoToScoreSubmissionPage value)
        goToScoreSubmissionPage,
    required TResult Function(MatchLobbySubmitScore value) submitScore,
    required TResult Function(MatchLobbyAcceptScore value) acceptScore,
    required TResult Function(MatchLobbyDisputeScore value) disputeScore,
    required TResult Function(MatchLobbyClose value) close,
    required TResult Function(MatchLobbyMatchmaking value) matchmaking,
  }) {
    return matchmaking(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MatchLobbyCheckInNotification value)? checkInNotification,
    TResult Function(MatchLobbyLeave value)? leave,
    TResult Function(MatchLobbyRestoreState value)? restoreState,
    TResult Function(MatchLobbyRestoreStateFromNotification value)?
        restoreStateFromNotification,
    TResult Function(MatchLobbyJoin value)? join,
    TResult Function(MatchLobbyOpponentCheckedIn value)? opponentCheckedIn,
    TResult Function(MatchLobbyOpponentSubmittedScore value)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyOpponentConfirmedScore value)? scoreConfirmed,
    TResult Function(MatchLobbyGoToScoreSubmissionPage value)?
        goToScoreSubmissionPage,
    TResult Function(MatchLobbySubmitScore value)? submitScore,
    TResult Function(MatchLobbyAcceptScore value)? acceptScore,
    TResult Function(MatchLobbyDisputeScore value)? disputeScore,
    TResult Function(MatchLobbyClose value)? close,
    TResult Function(MatchLobbyMatchmaking value)? matchmaking,
  }) {
    return matchmaking?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MatchLobbyCheckInNotification value)? checkInNotification,
    TResult Function(MatchLobbyLeave value)? leave,
    TResult Function(MatchLobbyRestoreState value)? restoreState,
    TResult Function(MatchLobbyRestoreStateFromNotification value)?
        restoreStateFromNotification,
    TResult Function(MatchLobbyJoin value)? join,
    TResult Function(MatchLobbyOpponentCheckedIn value)? opponentCheckedIn,
    TResult Function(MatchLobbyOpponentSubmittedScore value)?
        opponentSubmittedScore,
    TResult Function(MatchLobbyOpponentConfirmedScore value)? scoreConfirmed,
    TResult Function(MatchLobbyGoToScoreSubmissionPage value)?
        goToScoreSubmissionPage,
    TResult Function(MatchLobbySubmitScore value)? submitScore,
    TResult Function(MatchLobbyAcceptScore value)? acceptScore,
    TResult Function(MatchLobbyDisputeScore value)? disputeScore,
    TResult Function(MatchLobbyClose value)? close,
    TResult Function(MatchLobbyMatchmaking value)? matchmaking,
    required TResult orElse(),
  }) {
    if (matchmaking != null) {
      return matchmaking(this);
    }
    return orElse();
  }
}

abstract class MatchLobbyMatchmaking extends MatchLobbyEvent {
  const factory MatchLobbyMatchmaking({required int tournamentId}) =
      _$MatchLobbyMatchmaking;
  const MatchLobbyMatchmaking._() : super._();

  int get tournamentId;
  @JsonKey(ignore: true)
  $MatchLobbyMatchmakingCopyWith<MatchLobbyMatchmaking> get copyWith =>
      throw _privateConstructorUsedError;
}
