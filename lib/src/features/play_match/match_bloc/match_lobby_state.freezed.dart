// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'match_lobby_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MatchLobbyStateTearOff {
  const _$MatchLobbyStateTearOff();

  _MatchLobbyInitial initial() {
    return const _MatchLobbyInitial();
  }

  _MatchLobbyJoining joining() {
    return const _MatchLobbyJoining();
  }

  MatchLobbyGameInProgress gameInProgress(
      {required MatchLobbyData matchLobbyData,
      required LobbyParameters lobbyParameters}) {
    return MatchLobbyGameInProgress(
      matchLobbyData: matchLobbyData,
      lobbyParameters: lobbyParameters,
    );
  }

  MatchLobbyAddResult addResult({required MatchLobbyData matchLobbyData}) {
    return MatchLobbyAddResult(
      matchLobbyData: matchLobbyData,
    );
  }

  MatchLobbyAwaitingConfirmation awaitingConfirmation(
      {required MatchLobbyData matchLobbyData,
      required int score1,
      required int score2}) {
    return MatchLobbyAwaitingConfirmation(
      matchLobbyData: matchLobbyData,
      score1: score1,
      score2: score2,
    );
  }

  MatchLobbyConfirmResult confirmResult(
      {required MatchLobbyData matchLobbyData,
      required MatchScores matchScores}) {
    return MatchLobbyConfirmResult(
      matchLobbyData: matchLobbyData,
      matchScores: matchScores,
    );
  }

  MatchLobbyGameOver gameOver(
      {required MatchLobbyData matchLobbyData,
      required MatchScores matchScores}) {
    return MatchLobbyGameOver(
      matchLobbyData: matchLobbyData,
      matchScores: matchScores,
    );
  }

  MatchLobbyDisputeInProgress disputeInProgress(
      {required MatchLobbyData matchLobbyData}) {
    return MatchLobbyDisputeInProgress(
      matchLobbyData: matchLobbyData,
    );
  }

  MatchLobbyError error(Object exception,
      {String? message, StackTrace? stackTrace}) {
    return MatchLobbyError(
      exception,
      message: message,
      stackTrace: stackTrace,
    );
  }

  MatchLobbyAwaitingMatchmaking awaitingMatchmaking(
      {required int tournamentId}) {
    return MatchLobbyAwaitingMatchmaking(
      tournamentId: tournamentId,
    );
  }

  MatchLobbyWaitingForOpponentToJoin waitingForOpponentToJoin(
      {required LobbyParameters lobbyParameters}) {
    return MatchLobbyWaitingForOpponentToJoin(
      lobbyParameters: lobbyParameters,
    );
  }
}

/// @nodoc
const $MatchLobbyState = _$MatchLobbyStateTearOff();

/// @nodoc
mixin _$MatchLobbyState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() joining,
    required TResult Function(
            MatchLobbyData matchLobbyData, LobbyParameters lobbyParameters)
        gameInProgress,
    required TResult Function(MatchLobbyData matchLobbyData) addResult,
    required TResult Function(
            MatchLobbyData matchLobbyData, int score1, int score2)
        awaitingConfirmation,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchScores matchScores)
        confirmResult,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchScores matchScores)
        gameOver,
    required TResult Function(MatchLobbyData matchLobbyData) disputeInProgress,
    required TResult Function(
            Object exception, String? message, StackTrace? stackTrace)
        error,
    required TResult Function(int tournamentId) awaitingMatchmaking,
    required TResult Function(LobbyParameters lobbyParameters)
        waitingForOpponentToJoin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? joining,
    TResult Function(
            MatchLobbyData matchLobbyData, LobbyParameters lobbyParameters)?
        gameInProgress,
    TResult Function(MatchLobbyData matchLobbyData)? addResult,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        awaitingConfirmation,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        confirmResult,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        gameOver,
    TResult Function(MatchLobbyData matchLobbyData)? disputeInProgress,
    TResult Function(Object exception, String? message, StackTrace? stackTrace)?
        error,
    TResult Function(int tournamentId)? awaitingMatchmaking,
    TResult Function(LobbyParameters lobbyParameters)? waitingForOpponentToJoin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? joining,
    TResult Function(
            MatchLobbyData matchLobbyData, LobbyParameters lobbyParameters)?
        gameInProgress,
    TResult Function(MatchLobbyData matchLobbyData)? addResult,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        awaitingConfirmation,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        confirmResult,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        gameOver,
    TResult Function(MatchLobbyData matchLobbyData)? disputeInProgress,
    TResult Function(Object exception, String? message, StackTrace? stackTrace)?
        error,
    TResult Function(int tournamentId)? awaitingMatchmaking,
    TResult Function(LobbyParameters lobbyParameters)? waitingForOpponentToJoin,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MatchLobbyInitial value) initial,
    required TResult Function(_MatchLobbyJoining value) joining,
    required TResult Function(MatchLobbyGameInProgress value) gameInProgress,
    required TResult Function(MatchLobbyAddResult value) addResult,
    required TResult Function(MatchLobbyAwaitingConfirmation value)
        awaitingConfirmation,
    required TResult Function(MatchLobbyConfirmResult value) confirmResult,
    required TResult Function(MatchLobbyGameOver value) gameOver,
    required TResult Function(MatchLobbyDisputeInProgress value)
        disputeInProgress,
    required TResult Function(MatchLobbyError value) error,
    required TResult Function(MatchLobbyAwaitingMatchmaking value)
        awaitingMatchmaking,
    required TResult Function(MatchLobbyWaitingForOpponentToJoin value)
        waitingForOpponentToJoin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_MatchLobbyInitial value)? initial,
    TResult Function(_MatchLobbyJoining value)? joining,
    TResult Function(MatchLobbyGameInProgress value)? gameInProgress,
    TResult Function(MatchLobbyAddResult value)? addResult,
    TResult Function(MatchLobbyAwaitingConfirmation value)?
        awaitingConfirmation,
    TResult Function(MatchLobbyConfirmResult value)? confirmResult,
    TResult Function(MatchLobbyGameOver value)? gameOver,
    TResult Function(MatchLobbyDisputeInProgress value)? disputeInProgress,
    TResult Function(MatchLobbyError value)? error,
    TResult Function(MatchLobbyAwaitingMatchmaking value)? awaitingMatchmaking,
    TResult Function(MatchLobbyWaitingForOpponentToJoin value)?
        waitingForOpponentToJoin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MatchLobbyInitial value)? initial,
    TResult Function(_MatchLobbyJoining value)? joining,
    TResult Function(MatchLobbyGameInProgress value)? gameInProgress,
    TResult Function(MatchLobbyAddResult value)? addResult,
    TResult Function(MatchLobbyAwaitingConfirmation value)?
        awaitingConfirmation,
    TResult Function(MatchLobbyConfirmResult value)? confirmResult,
    TResult Function(MatchLobbyGameOver value)? gameOver,
    TResult Function(MatchLobbyDisputeInProgress value)? disputeInProgress,
    TResult Function(MatchLobbyError value)? error,
    TResult Function(MatchLobbyAwaitingMatchmaking value)? awaitingMatchmaking,
    TResult Function(MatchLobbyWaitingForOpponentToJoin value)?
        waitingForOpponentToJoin,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchLobbyStateCopyWith<$Res> {
  factory $MatchLobbyStateCopyWith(
          MatchLobbyState value, $Res Function(MatchLobbyState) then) =
      _$MatchLobbyStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$MatchLobbyStateCopyWithImpl<$Res>
    implements $MatchLobbyStateCopyWith<$Res> {
  _$MatchLobbyStateCopyWithImpl(this._value, this._then);

  final MatchLobbyState _value;
  // ignore: unused_field
  final $Res Function(MatchLobbyState) _then;
}

/// @nodoc
abstract class _$MatchLobbyInitialCopyWith<$Res> {
  factory _$MatchLobbyInitialCopyWith(
          _MatchLobbyInitial value, $Res Function(_MatchLobbyInitial) then) =
      __$MatchLobbyInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$MatchLobbyInitialCopyWithImpl<$Res>
    extends _$MatchLobbyStateCopyWithImpl<$Res>
    implements _$MatchLobbyInitialCopyWith<$Res> {
  __$MatchLobbyInitialCopyWithImpl(
      _MatchLobbyInitial _value, $Res Function(_MatchLobbyInitial) _then)
      : super(_value, (v) => _then(v as _MatchLobbyInitial));

  @override
  _MatchLobbyInitial get _value => super._value as _MatchLobbyInitial;
}

/// @nodoc

class _$_MatchLobbyInitial extends _MatchLobbyInitial
    with DiagnosticableTreeMixin {
  const _$_MatchLobbyInitial() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MatchLobbyState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'MatchLobbyState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _MatchLobbyInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() joining,
    required TResult Function(
            MatchLobbyData matchLobbyData, LobbyParameters lobbyParameters)
        gameInProgress,
    required TResult Function(MatchLobbyData matchLobbyData) addResult,
    required TResult Function(
            MatchLobbyData matchLobbyData, int score1, int score2)
        awaitingConfirmation,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchScores matchScores)
        confirmResult,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchScores matchScores)
        gameOver,
    required TResult Function(MatchLobbyData matchLobbyData) disputeInProgress,
    required TResult Function(
            Object exception, String? message, StackTrace? stackTrace)
        error,
    required TResult Function(int tournamentId) awaitingMatchmaking,
    required TResult Function(LobbyParameters lobbyParameters)
        waitingForOpponentToJoin,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? joining,
    TResult Function(
            MatchLobbyData matchLobbyData, LobbyParameters lobbyParameters)?
        gameInProgress,
    TResult Function(MatchLobbyData matchLobbyData)? addResult,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        awaitingConfirmation,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        confirmResult,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        gameOver,
    TResult Function(MatchLobbyData matchLobbyData)? disputeInProgress,
    TResult Function(Object exception, String? message, StackTrace? stackTrace)?
        error,
    TResult Function(int tournamentId)? awaitingMatchmaking,
    TResult Function(LobbyParameters lobbyParameters)? waitingForOpponentToJoin,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? joining,
    TResult Function(
            MatchLobbyData matchLobbyData, LobbyParameters lobbyParameters)?
        gameInProgress,
    TResult Function(MatchLobbyData matchLobbyData)? addResult,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        awaitingConfirmation,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        confirmResult,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        gameOver,
    TResult Function(MatchLobbyData matchLobbyData)? disputeInProgress,
    TResult Function(Object exception, String? message, StackTrace? stackTrace)?
        error,
    TResult Function(int tournamentId)? awaitingMatchmaking,
    TResult Function(LobbyParameters lobbyParameters)? waitingForOpponentToJoin,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MatchLobbyInitial value) initial,
    required TResult Function(_MatchLobbyJoining value) joining,
    required TResult Function(MatchLobbyGameInProgress value) gameInProgress,
    required TResult Function(MatchLobbyAddResult value) addResult,
    required TResult Function(MatchLobbyAwaitingConfirmation value)
        awaitingConfirmation,
    required TResult Function(MatchLobbyConfirmResult value) confirmResult,
    required TResult Function(MatchLobbyGameOver value) gameOver,
    required TResult Function(MatchLobbyDisputeInProgress value)
        disputeInProgress,
    required TResult Function(MatchLobbyError value) error,
    required TResult Function(MatchLobbyAwaitingMatchmaking value)
        awaitingMatchmaking,
    required TResult Function(MatchLobbyWaitingForOpponentToJoin value)
        waitingForOpponentToJoin,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_MatchLobbyInitial value)? initial,
    TResult Function(_MatchLobbyJoining value)? joining,
    TResult Function(MatchLobbyGameInProgress value)? gameInProgress,
    TResult Function(MatchLobbyAddResult value)? addResult,
    TResult Function(MatchLobbyAwaitingConfirmation value)?
        awaitingConfirmation,
    TResult Function(MatchLobbyConfirmResult value)? confirmResult,
    TResult Function(MatchLobbyGameOver value)? gameOver,
    TResult Function(MatchLobbyDisputeInProgress value)? disputeInProgress,
    TResult Function(MatchLobbyError value)? error,
    TResult Function(MatchLobbyAwaitingMatchmaking value)? awaitingMatchmaking,
    TResult Function(MatchLobbyWaitingForOpponentToJoin value)?
        waitingForOpponentToJoin,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MatchLobbyInitial value)? initial,
    TResult Function(_MatchLobbyJoining value)? joining,
    TResult Function(MatchLobbyGameInProgress value)? gameInProgress,
    TResult Function(MatchLobbyAddResult value)? addResult,
    TResult Function(MatchLobbyAwaitingConfirmation value)?
        awaitingConfirmation,
    TResult Function(MatchLobbyConfirmResult value)? confirmResult,
    TResult Function(MatchLobbyGameOver value)? gameOver,
    TResult Function(MatchLobbyDisputeInProgress value)? disputeInProgress,
    TResult Function(MatchLobbyError value)? error,
    TResult Function(MatchLobbyAwaitingMatchmaking value)? awaitingMatchmaking,
    TResult Function(MatchLobbyWaitingForOpponentToJoin value)?
        waitingForOpponentToJoin,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _MatchLobbyInitial extends MatchLobbyState {
  const factory _MatchLobbyInitial() = _$_MatchLobbyInitial;
  const _MatchLobbyInitial._() : super._();
}

/// @nodoc
abstract class _$MatchLobbyJoiningCopyWith<$Res> {
  factory _$MatchLobbyJoiningCopyWith(
          _MatchLobbyJoining value, $Res Function(_MatchLobbyJoining) then) =
      __$MatchLobbyJoiningCopyWithImpl<$Res>;
}

/// @nodoc
class __$MatchLobbyJoiningCopyWithImpl<$Res>
    extends _$MatchLobbyStateCopyWithImpl<$Res>
    implements _$MatchLobbyJoiningCopyWith<$Res> {
  __$MatchLobbyJoiningCopyWithImpl(
      _MatchLobbyJoining _value, $Res Function(_MatchLobbyJoining) _then)
      : super(_value, (v) => _then(v as _MatchLobbyJoining));

  @override
  _MatchLobbyJoining get _value => super._value as _MatchLobbyJoining;
}

/// @nodoc

class _$_MatchLobbyJoining extends _MatchLobbyJoining
    with DiagnosticableTreeMixin {
  const _$_MatchLobbyJoining() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MatchLobbyState.joining()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'MatchLobbyState.joining'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _MatchLobbyJoining);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() joining,
    required TResult Function(
            MatchLobbyData matchLobbyData, LobbyParameters lobbyParameters)
        gameInProgress,
    required TResult Function(MatchLobbyData matchLobbyData) addResult,
    required TResult Function(
            MatchLobbyData matchLobbyData, int score1, int score2)
        awaitingConfirmation,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchScores matchScores)
        confirmResult,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchScores matchScores)
        gameOver,
    required TResult Function(MatchLobbyData matchLobbyData) disputeInProgress,
    required TResult Function(
            Object exception, String? message, StackTrace? stackTrace)
        error,
    required TResult Function(int tournamentId) awaitingMatchmaking,
    required TResult Function(LobbyParameters lobbyParameters)
        waitingForOpponentToJoin,
  }) {
    return joining();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? joining,
    TResult Function(
            MatchLobbyData matchLobbyData, LobbyParameters lobbyParameters)?
        gameInProgress,
    TResult Function(MatchLobbyData matchLobbyData)? addResult,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        awaitingConfirmation,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        confirmResult,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        gameOver,
    TResult Function(MatchLobbyData matchLobbyData)? disputeInProgress,
    TResult Function(Object exception, String? message, StackTrace? stackTrace)?
        error,
    TResult Function(int tournamentId)? awaitingMatchmaking,
    TResult Function(LobbyParameters lobbyParameters)? waitingForOpponentToJoin,
  }) {
    return joining?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? joining,
    TResult Function(
            MatchLobbyData matchLobbyData, LobbyParameters lobbyParameters)?
        gameInProgress,
    TResult Function(MatchLobbyData matchLobbyData)? addResult,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        awaitingConfirmation,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        confirmResult,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        gameOver,
    TResult Function(MatchLobbyData matchLobbyData)? disputeInProgress,
    TResult Function(Object exception, String? message, StackTrace? stackTrace)?
        error,
    TResult Function(int tournamentId)? awaitingMatchmaking,
    TResult Function(LobbyParameters lobbyParameters)? waitingForOpponentToJoin,
    required TResult orElse(),
  }) {
    if (joining != null) {
      return joining();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MatchLobbyInitial value) initial,
    required TResult Function(_MatchLobbyJoining value) joining,
    required TResult Function(MatchLobbyGameInProgress value) gameInProgress,
    required TResult Function(MatchLobbyAddResult value) addResult,
    required TResult Function(MatchLobbyAwaitingConfirmation value)
        awaitingConfirmation,
    required TResult Function(MatchLobbyConfirmResult value) confirmResult,
    required TResult Function(MatchLobbyGameOver value) gameOver,
    required TResult Function(MatchLobbyDisputeInProgress value)
        disputeInProgress,
    required TResult Function(MatchLobbyError value) error,
    required TResult Function(MatchLobbyAwaitingMatchmaking value)
        awaitingMatchmaking,
    required TResult Function(MatchLobbyWaitingForOpponentToJoin value)
        waitingForOpponentToJoin,
  }) {
    return joining(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_MatchLobbyInitial value)? initial,
    TResult Function(_MatchLobbyJoining value)? joining,
    TResult Function(MatchLobbyGameInProgress value)? gameInProgress,
    TResult Function(MatchLobbyAddResult value)? addResult,
    TResult Function(MatchLobbyAwaitingConfirmation value)?
        awaitingConfirmation,
    TResult Function(MatchLobbyConfirmResult value)? confirmResult,
    TResult Function(MatchLobbyGameOver value)? gameOver,
    TResult Function(MatchLobbyDisputeInProgress value)? disputeInProgress,
    TResult Function(MatchLobbyError value)? error,
    TResult Function(MatchLobbyAwaitingMatchmaking value)? awaitingMatchmaking,
    TResult Function(MatchLobbyWaitingForOpponentToJoin value)?
        waitingForOpponentToJoin,
  }) {
    return joining?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MatchLobbyInitial value)? initial,
    TResult Function(_MatchLobbyJoining value)? joining,
    TResult Function(MatchLobbyGameInProgress value)? gameInProgress,
    TResult Function(MatchLobbyAddResult value)? addResult,
    TResult Function(MatchLobbyAwaitingConfirmation value)?
        awaitingConfirmation,
    TResult Function(MatchLobbyConfirmResult value)? confirmResult,
    TResult Function(MatchLobbyGameOver value)? gameOver,
    TResult Function(MatchLobbyDisputeInProgress value)? disputeInProgress,
    TResult Function(MatchLobbyError value)? error,
    TResult Function(MatchLobbyAwaitingMatchmaking value)? awaitingMatchmaking,
    TResult Function(MatchLobbyWaitingForOpponentToJoin value)?
        waitingForOpponentToJoin,
    required TResult orElse(),
  }) {
    if (joining != null) {
      return joining(this);
    }
    return orElse();
  }
}

abstract class _MatchLobbyJoining extends MatchLobbyState {
  const factory _MatchLobbyJoining() = _$_MatchLobbyJoining;
  const _MatchLobbyJoining._() : super._();
}

/// @nodoc
abstract class $MatchLobbyGameInProgressCopyWith<$Res> {
  factory $MatchLobbyGameInProgressCopyWith(MatchLobbyGameInProgress value,
          $Res Function(MatchLobbyGameInProgress) then) =
      _$MatchLobbyGameInProgressCopyWithImpl<$Res>;
  $Res call({MatchLobbyData matchLobbyData, LobbyParameters lobbyParameters});
}

/// @nodoc
class _$MatchLobbyGameInProgressCopyWithImpl<$Res>
    extends _$MatchLobbyStateCopyWithImpl<$Res>
    implements $MatchLobbyGameInProgressCopyWith<$Res> {
  _$MatchLobbyGameInProgressCopyWithImpl(MatchLobbyGameInProgress _value,
      $Res Function(MatchLobbyGameInProgress) _then)
      : super(_value, (v) => _then(v as MatchLobbyGameInProgress));

  @override
  MatchLobbyGameInProgress get _value =>
      super._value as MatchLobbyGameInProgress;

  @override
  $Res call({
    Object? matchLobbyData = freezed,
    Object? lobbyParameters = freezed,
  }) {
    return _then(MatchLobbyGameInProgress(
      matchLobbyData: matchLobbyData == freezed
          ? _value.matchLobbyData
          : matchLobbyData // ignore: cast_nullable_to_non_nullable
              as MatchLobbyData,
      lobbyParameters: lobbyParameters == freezed
          ? _value.lobbyParameters
          : lobbyParameters // ignore: cast_nullable_to_non_nullable
              as LobbyParameters,
    ));
  }
}

/// @nodoc

class _$MatchLobbyGameInProgress extends MatchLobbyGameInProgress
    with DiagnosticableTreeMixin {
  const _$MatchLobbyGameInProgress(
      {required this.matchLobbyData, required this.lobbyParameters})
      : super._();

  @override
  final MatchLobbyData matchLobbyData;
  @override
  final LobbyParameters lobbyParameters;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MatchLobbyState.gameInProgress(matchLobbyData: $matchLobbyData, lobbyParameters: $lobbyParameters)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MatchLobbyState.gameInProgress'))
      ..add(DiagnosticsProperty('matchLobbyData', matchLobbyData))
      ..add(DiagnosticsProperty('lobbyParameters', lobbyParameters));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MatchLobbyGameInProgress &&
            const DeepCollectionEquality()
                .equals(other.matchLobbyData, matchLobbyData) &&
            const DeepCollectionEquality()
                .equals(other.lobbyParameters, lobbyParameters));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(matchLobbyData),
      const DeepCollectionEquality().hash(lobbyParameters));

  @JsonKey(ignore: true)
  @override
  $MatchLobbyGameInProgressCopyWith<MatchLobbyGameInProgress> get copyWith =>
      _$MatchLobbyGameInProgressCopyWithImpl<MatchLobbyGameInProgress>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() joining,
    required TResult Function(
            MatchLobbyData matchLobbyData, LobbyParameters lobbyParameters)
        gameInProgress,
    required TResult Function(MatchLobbyData matchLobbyData) addResult,
    required TResult Function(
            MatchLobbyData matchLobbyData, int score1, int score2)
        awaitingConfirmation,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchScores matchScores)
        confirmResult,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchScores matchScores)
        gameOver,
    required TResult Function(MatchLobbyData matchLobbyData) disputeInProgress,
    required TResult Function(
            Object exception, String? message, StackTrace? stackTrace)
        error,
    required TResult Function(int tournamentId) awaitingMatchmaking,
    required TResult Function(LobbyParameters lobbyParameters)
        waitingForOpponentToJoin,
  }) {
    return gameInProgress(matchLobbyData, lobbyParameters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? joining,
    TResult Function(
            MatchLobbyData matchLobbyData, LobbyParameters lobbyParameters)?
        gameInProgress,
    TResult Function(MatchLobbyData matchLobbyData)? addResult,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        awaitingConfirmation,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        confirmResult,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        gameOver,
    TResult Function(MatchLobbyData matchLobbyData)? disputeInProgress,
    TResult Function(Object exception, String? message, StackTrace? stackTrace)?
        error,
    TResult Function(int tournamentId)? awaitingMatchmaking,
    TResult Function(LobbyParameters lobbyParameters)? waitingForOpponentToJoin,
  }) {
    return gameInProgress?.call(matchLobbyData, lobbyParameters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? joining,
    TResult Function(
            MatchLobbyData matchLobbyData, LobbyParameters lobbyParameters)?
        gameInProgress,
    TResult Function(MatchLobbyData matchLobbyData)? addResult,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        awaitingConfirmation,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        confirmResult,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        gameOver,
    TResult Function(MatchLobbyData matchLobbyData)? disputeInProgress,
    TResult Function(Object exception, String? message, StackTrace? stackTrace)?
        error,
    TResult Function(int tournamentId)? awaitingMatchmaking,
    TResult Function(LobbyParameters lobbyParameters)? waitingForOpponentToJoin,
    required TResult orElse(),
  }) {
    if (gameInProgress != null) {
      return gameInProgress(matchLobbyData, lobbyParameters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MatchLobbyInitial value) initial,
    required TResult Function(_MatchLobbyJoining value) joining,
    required TResult Function(MatchLobbyGameInProgress value) gameInProgress,
    required TResult Function(MatchLobbyAddResult value) addResult,
    required TResult Function(MatchLobbyAwaitingConfirmation value)
        awaitingConfirmation,
    required TResult Function(MatchLobbyConfirmResult value) confirmResult,
    required TResult Function(MatchLobbyGameOver value) gameOver,
    required TResult Function(MatchLobbyDisputeInProgress value)
        disputeInProgress,
    required TResult Function(MatchLobbyError value) error,
    required TResult Function(MatchLobbyAwaitingMatchmaking value)
        awaitingMatchmaking,
    required TResult Function(MatchLobbyWaitingForOpponentToJoin value)
        waitingForOpponentToJoin,
  }) {
    return gameInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_MatchLobbyInitial value)? initial,
    TResult Function(_MatchLobbyJoining value)? joining,
    TResult Function(MatchLobbyGameInProgress value)? gameInProgress,
    TResult Function(MatchLobbyAddResult value)? addResult,
    TResult Function(MatchLobbyAwaitingConfirmation value)?
        awaitingConfirmation,
    TResult Function(MatchLobbyConfirmResult value)? confirmResult,
    TResult Function(MatchLobbyGameOver value)? gameOver,
    TResult Function(MatchLobbyDisputeInProgress value)? disputeInProgress,
    TResult Function(MatchLobbyError value)? error,
    TResult Function(MatchLobbyAwaitingMatchmaking value)? awaitingMatchmaking,
    TResult Function(MatchLobbyWaitingForOpponentToJoin value)?
        waitingForOpponentToJoin,
  }) {
    return gameInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MatchLobbyInitial value)? initial,
    TResult Function(_MatchLobbyJoining value)? joining,
    TResult Function(MatchLobbyGameInProgress value)? gameInProgress,
    TResult Function(MatchLobbyAddResult value)? addResult,
    TResult Function(MatchLobbyAwaitingConfirmation value)?
        awaitingConfirmation,
    TResult Function(MatchLobbyConfirmResult value)? confirmResult,
    TResult Function(MatchLobbyGameOver value)? gameOver,
    TResult Function(MatchLobbyDisputeInProgress value)? disputeInProgress,
    TResult Function(MatchLobbyError value)? error,
    TResult Function(MatchLobbyAwaitingMatchmaking value)? awaitingMatchmaking,
    TResult Function(MatchLobbyWaitingForOpponentToJoin value)?
        waitingForOpponentToJoin,
    required TResult orElse(),
  }) {
    if (gameInProgress != null) {
      return gameInProgress(this);
    }
    return orElse();
  }
}

abstract class MatchLobbyGameInProgress extends MatchLobbyState {
  const factory MatchLobbyGameInProgress(
      {required MatchLobbyData matchLobbyData,
      required LobbyParameters lobbyParameters}) = _$MatchLobbyGameInProgress;
  const MatchLobbyGameInProgress._() : super._();

  MatchLobbyData get matchLobbyData;
  LobbyParameters get lobbyParameters;
  @JsonKey(ignore: true)
  $MatchLobbyGameInProgressCopyWith<MatchLobbyGameInProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchLobbyAddResultCopyWith<$Res> {
  factory $MatchLobbyAddResultCopyWith(
          MatchLobbyAddResult value, $Res Function(MatchLobbyAddResult) then) =
      _$MatchLobbyAddResultCopyWithImpl<$Res>;
  $Res call({MatchLobbyData matchLobbyData});
}

/// @nodoc
class _$MatchLobbyAddResultCopyWithImpl<$Res>
    extends _$MatchLobbyStateCopyWithImpl<$Res>
    implements $MatchLobbyAddResultCopyWith<$Res> {
  _$MatchLobbyAddResultCopyWithImpl(
      MatchLobbyAddResult _value, $Res Function(MatchLobbyAddResult) _then)
      : super(_value, (v) => _then(v as MatchLobbyAddResult));

  @override
  MatchLobbyAddResult get _value => super._value as MatchLobbyAddResult;

  @override
  $Res call({
    Object? matchLobbyData = freezed,
  }) {
    return _then(MatchLobbyAddResult(
      matchLobbyData: matchLobbyData == freezed
          ? _value.matchLobbyData
          : matchLobbyData // ignore: cast_nullable_to_non_nullable
              as MatchLobbyData,
    ));
  }
}

/// @nodoc

class _$MatchLobbyAddResult extends MatchLobbyAddResult
    with DiagnosticableTreeMixin {
  const _$MatchLobbyAddResult({required this.matchLobbyData}) : super._();

  @override
  final MatchLobbyData matchLobbyData;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MatchLobbyState.addResult(matchLobbyData: $matchLobbyData)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MatchLobbyState.addResult'))
      ..add(DiagnosticsProperty('matchLobbyData', matchLobbyData));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MatchLobbyAddResult &&
            const DeepCollectionEquality()
                .equals(other.matchLobbyData, matchLobbyData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(matchLobbyData));

  @JsonKey(ignore: true)
  @override
  $MatchLobbyAddResultCopyWith<MatchLobbyAddResult> get copyWith =>
      _$MatchLobbyAddResultCopyWithImpl<MatchLobbyAddResult>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() joining,
    required TResult Function(
            MatchLobbyData matchLobbyData, LobbyParameters lobbyParameters)
        gameInProgress,
    required TResult Function(MatchLobbyData matchLobbyData) addResult,
    required TResult Function(
            MatchLobbyData matchLobbyData, int score1, int score2)
        awaitingConfirmation,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchScores matchScores)
        confirmResult,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchScores matchScores)
        gameOver,
    required TResult Function(MatchLobbyData matchLobbyData) disputeInProgress,
    required TResult Function(
            Object exception, String? message, StackTrace? stackTrace)
        error,
    required TResult Function(int tournamentId) awaitingMatchmaking,
    required TResult Function(LobbyParameters lobbyParameters)
        waitingForOpponentToJoin,
  }) {
    return addResult(matchLobbyData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? joining,
    TResult Function(
            MatchLobbyData matchLobbyData, LobbyParameters lobbyParameters)?
        gameInProgress,
    TResult Function(MatchLobbyData matchLobbyData)? addResult,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        awaitingConfirmation,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        confirmResult,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        gameOver,
    TResult Function(MatchLobbyData matchLobbyData)? disputeInProgress,
    TResult Function(Object exception, String? message, StackTrace? stackTrace)?
        error,
    TResult Function(int tournamentId)? awaitingMatchmaking,
    TResult Function(LobbyParameters lobbyParameters)? waitingForOpponentToJoin,
  }) {
    return addResult?.call(matchLobbyData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? joining,
    TResult Function(
            MatchLobbyData matchLobbyData, LobbyParameters lobbyParameters)?
        gameInProgress,
    TResult Function(MatchLobbyData matchLobbyData)? addResult,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        awaitingConfirmation,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        confirmResult,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        gameOver,
    TResult Function(MatchLobbyData matchLobbyData)? disputeInProgress,
    TResult Function(Object exception, String? message, StackTrace? stackTrace)?
        error,
    TResult Function(int tournamentId)? awaitingMatchmaking,
    TResult Function(LobbyParameters lobbyParameters)? waitingForOpponentToJoin,
    required TResult orElse(),
  }) {
    if (addResult != null) {
      return addResult(matchLobbyData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MatchLobbyInitial value) initial,
    required TResult Function(_MatchLobbyJoining value) joining,
    required TResult Function(MatchLobbyGameInProgress value) gameInProgress,
    required TResult Function(MatchLobbyAddResult value) addResult,
    required TResult Function(MatchLobbyAwaitingConfirmation value)
        awaitingConfirmation,
    required TResult Function(MatchLobbyConfirmResult value) confirmResult,
    required TResult Function(MatchLobbyGameOver value) gameOver,
    required TResult Function(MatchLobbyDisputeInProgress value)
        disputeInProgress,
    required TResult Function(MatchLobbyError value) error,
    required TResult Function(MatchLobbyAwaitingMatchmaking value)
        awaitingMatchmaking,
    required TResult Function(MatchLobbyWaitingForOpponentToJoin value)
        waitingForOpponentToJoin,
  }) {
    return addResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_MatchLobbyInitial value)? initial,
    TResult Function(_MatchLobbyJoining value)? joining,
    TResult Function(MatchLobbyGameInProgress value)? gameInProgress,
    TResult Function(MatchLobbyAddResult value)? addResult,
    TResult Function(MatchLobbyAwaitingConfirmation value)?
        awaitingConfirmation,
    TResult Function(MatchLobbyConfirmResult value)? confirmResult,
    TResult Function(MatchLobbyGameOver value)? gameOver,
    TResult Function(MatchLobbyDisputeInProgress value)? disputeInProgress,
    TResult Function(MatchLobbyError value)? error,
    TResult Function(MatchLobbyAwaitingMatchmaking value)? awaitingMatchmaking,
    TResult Function(MatchLobbyWaitingForOpponentToJoin value)?
        waitingForOpponentToJoin,
  }) {
    return addResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MatchLobbyInitial value)? initial,
    TResult Function(_MatchLobbyJoining value)? joining,
    TResult Function(MatchLobbyGameInProgress value)? gameInProgress,
    TResult Function(MatchLobbyAddResult value)? addResult,
    TResult Function(MatchLobbyAwaitingConfirmation value)?
        awaitingConfirmation,
    TResult Function(MatchLobbyConfirmResult value)? confirmResult,
    TResult Function(MatchLobbyGameOver value)? gameOver,
    TResult Function(MatchLobbyDisputeInProgress value)? disputeInProgress,
    TResult Function(MatchLobbyError value)? error,
    TResult Function(MatchLobbyAwaitingMatchmaking value)? awaitingMatchmaking,
    TResult Function(MatchLobbyWaitingForOpponentToJoin value)?
        waitingForOpponentToJoin,
    required TResult orElse(),
  }) {
    if (addResult != null) {
      return addResult(this);
    }
    return orElse();
  }
}

abstract class MatchLobbyAddResult extends MatchLobbyState {
  const factory MatchLobbyAddResult({required MatchLobbyData matchLobbyData}) =
      _$MatchLobbyAddResult;
  const MatchLobbyAddResult._() : super._();

  MatchLobbyData get matchLobbyData;
  @JsonKey(ignore: true)
  $MatchLobbyAddResultCopyWith<MatchLobbyAddResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchLobbyAwaitingConfirmationCopyWith<$Res> {
  factory $MatchLobbyAwaitingConfirmationCopyWith(
          MatchLobbyAwaitingConfirmation value,
          $Res Function(MatchLobbyAwaitingConfirmation) then) =
      _$MatchLobbyAwaitingConfirmationCopyWithImpl<$Res>;
  $Res call({MatchLobbyData matchLobbyData, int score1, int score2});
}

/// @nodoc
class _$MatchLobbyAwaitingConfirmationCopyWithImpl<$Res>
    extends _$MatchLobbyStateCopyWithImpl<$Res>
    implements $MatchLobbyAwaitingConfirmationCopyWith<$Res> {
  _$MatchLobbyAwaitingConfirmationCopyWithImpl(
      MatchLobbyAwaitingConfirmation _value,
      $Res Function(MatchLobbyAwaitingConfirmation) _then)
      : super(_value, (v) => _then(v as MatchLobbyAwaitingConfirmation));

  @override
  MatchLobbyAwaitingConfirmation get _value =>
      super._value as MatchLobbyAwaitingConfirmation;

  @override
  $Res call({
    Object? matchLobbyData = freezed,
    Object? score1 = freezed,
    Object? score2 = freezed,
  }) {
    return _then(MatchLobbyAwaitingConfirmation(
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

class _$MatchLobbyAwaitingConfirmation extends MatchLobbyAwaitingConfirmation
    with DiagnosticableTreeMixin {
  const _$MatchLobbyAwaitingConfirmation(
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
    return 'MatchLobbyState.awaitingConfirmation(matchLobbyData: $matchLobbyData, score1: $score1, score2: $score2)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MatchLobbyState.awaitingConfirmation'))
      ..add(DiagnosticsProperty('matchLobbyData', matchLobbyData))
      ..add(DiagnosticsProperty('score1', score1))
      ..add(DiagnosticsProperty('score2', score2));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MatchLobbyAwaitingConfirmation &&
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
  $MatchLobbyAwaitingConfirmationCopyWith<MatchLobbyAwaitingConfirmation>
      get copyWith => _$MatchLobbyAwaitingConfirmationCopyWithImpl<
          MatchLobbyAwaitingConfirmation>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() joining,
    required TResult Function(
            MatchLobbyData matchLobbyData, LobbyParameters lobbyParameters)
        gameInProgress,
    required TResult Function(MatchLobbyData matchLobbyData) addResult,
    required TResult Function(
            MatchLobbyData matchLobbyData, int score1, int score2)
        awaitingConfirmation,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchScores matchScores)
        confirmResult,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchScores matchScores)
        gameOver,
    required TResult Function(MatchLobbyData matchLobbyData) disputeInProgress,
    required TResult Function(
            Object exception, String? message, StackTrace? stackTrace)
        error,
    required TResult Function(int tournamentId) awaitingMatchmaking,
    required TResult Function(LobbyParameters lobbyParameters)
        waitingForOpponentToJoin,
  }) {
    return awaitingConfirmation(matchLobbyData, score1, score2);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? joining,
    TResult Function(
            MatchLobbyData matchLobbyData, LobbyParameters lobbyParameters)?
        gameInProgress,
    TResult Function(MatchLobbyData matchLobbyData)? addResult,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        awaitingConfirmation,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        confirmResult,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        gameOver,
    TResult Function(MatchLobbyData matchLobbyData)? disputeInProgress,
    TResult Function(Object exception, String? message, StackTrace? stackTrace)?
        error,
    TResult Function(int tournamentId)? awaitingMatchmaking,
    TResult Function(LobbyParameters lobbyParameters)? waitingForOpponentToJoin,
  }) {
    return awaitingConfirmation?.call(matchLobbyData, score1, score2);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? joining,
    TResult Function(
            MatchLobbyData matchLobbyData, LobbyParameters lobbyParameters)?
        gameInProgress,
    TResult Function(MatchLobbyData matchLobbyData)? addResult,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        awaitingConfirmation,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        confirmResult,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        gameOver,
    TResult Function(MatchLobbyData matchLobbyData)? disputeInProgress,
    TResult Function(Object exception, String? message, StackTrace? stackTrace)?
        error,
    TResult Function(int tournamentId)? awaitingMatchmaking,
    TResult Function(LobbyParameters lobbyParameters)? waitingForOpponentToJoin,
    required TResult orElse(),
  }) {
    if (awaitingConfirmation != null) {
      return awaitingConfirmation(matchLobbyData, score1, score2);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MatchLobbyInitial value) initial,
    required TResult Function(_MatchLobbyJoining value) joining,
    required TResult Function(MatchLobbyGameInProgress value) gameInProgress,
    required TResult Function(MatchLobbyAddResult value) addResult,
    required TResult Function(MatchLobbyAwaitingConfirmation value)
        awaitingConfirmation,
    required TResult Function(MatchLobbyConfirmResult value) confirmResult,
    required TResult Function(MatchLobbyGameOver value) gameOver,
    required TResult Function(MatchLobbyDisputeInProgress value)
        disputeInProgress,
    required TResult Function(MatchLobbyError value) error,
    required TResult Function(MatchLobbyAwaitingMatchmaking value)
        awaitingMatchmaking,
    required TResult Function(MatchLobbyWaitingForOpponentToJoin value)
        waitingForOpponentToJoin,
  }) {
    return awaitingConfirmation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_MatchLobbyInitial value)? initial,
    TResult Function(_MatchLobbyJoining value)? joining,
    TResult Function(MatchLobbyGameInProgress value)? gameInProgress,
    TResult Function(MatchLobbyAddResult value)? addResult,
    TResult Function(MatchLobbyAwaitingConfirmation value)?
        awaitingConfirmation,
    TResult Function(MatchLobbyConfirmResult value)? confirmResult,
    TResult Function(MatchLobbyGameOver value)? gameOver,
    TResult Function(MatchLobbyDisputeInProgress value)? disputeInProgress,
    TResult Function(MatchLobbyError value)? error,
    TResult Function(MatchLobbyAwaitingMatchmaking value)? awaitingMatchmaking,
    TResult Function(MatchLobbyWaitingForOpponentToJoin value)?
        waitingForOpponentToJoin,
  }) {
    return awaitingConfirmation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MatchLobbyInitial value)? initial,
    TResult Function(_MatchLobbyJoining value)? joining,
    TResult Function(MatchLobbyGameInProgress value)? gameInProgress,
    TResult Function(MatchLobbyAddResult value)? addResult,
    TResult Function(MatchLobbyAwaitingConfirmation value)?
        awaitingConfirmation,
    TResult Function(MatchLobbyConfirmResult value)? confirmResult,
    TResult Function(MatchLobbyGameOver value)? gameOver,
    TResult Function(MatchLobbyDisputeInProgress value)? disputeInProgress,
    TResult Function(MatchLobbyError value)? error,
    TResult Function(MatchLobbyAwaitingMatchmaking value)? awaitingMatchmaking,
    TResult Function(MatchLobbyWaitingForOpponentToJoin value)?
        waitingForOpponentToJoin,
    required TResult orElse(),
  }) {
    if (awaitingConfirmation != null) {
      return awaitingConfirmation(this);
    }
    return orElse();
  }
}

abstract class MatchLobbyAwaitingConfirmation extends MatchLobbyState {
  const factory MatchLobbyAwaitingConfirmation(
      {required MatchLobbyData matchLobbyData,
      required int score1,
      required int score2}) = _$MatchLobbyAwaitingConfirmation;
  const MatchLobbyAwaitingConfirmation._() : super._();

  MatchLobbyData get matchLobbyData;
  int get score1;
  int get score2;
  @JsonKey(ignore: true)
  $MatchLobbyAwaitingConfirmationCopyWith<MatchLobbyAwaitingConfirmation>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchLobbyConfirmResultCopyWith<$Res> {
  factory $MatchLobbyConfirmResultCopyWith(MatchLobbyConfirmResult value,
          $Res Function(MatchLobbyConfirmResult) then) =
      _$MatchLobbyConfirmResultCopyWithImpl<$Res>;
  $Res call({MatchLobbyData matchLobbyData, MatchScores matchScores});
}

/// @nodoc
class _$MatchLobbyConfirmResultCopyWithImpl<$Res>
    extends _$MatchLobbyStateCopyWithImpl<$Res>
    implements $MatchLobbyConfirmResultCopyWith<$Res> {
  _$MatchLobbyConfirmResultCopyWithImpl(MatchLobbyConfirmResult _value,
      $Res Function(MatchLobbyConfirmResult) _then)
      : super(_value, (v) => _then(v as MatchLobbyConfirmResult));

  @override
  MatchLobbyConfirmResult get _value => super._value as MatchLobbyConfirmResult;

  @override
  $Res call({
    Object? matchLobbyData = freezed,
    Object? matchScores = freezed,
  }) {
    return _then(MatchLobbyConfirmResult(
      matchLobbyData: matchLobbyData == freezed
          ? _value.matchLobbyData
          : matchLobbyData // ignore: cast_nullable_to_non_nullable
              as MatchLobbyData,
      matchScores: matchScores == freezed
          ? _value.matchScores
          : matchScores // ignore: cast_nullable_to_non_nullable
              as MatchScores,
    ));
  }
}

/// @nodoc

class _$MatchLobbyConfirmResult extends MatchLobbyConfirmResult
    with DiagnosticableTreeMixin {
  const _$MatchLobbyConfirmResult(
      {required this.matchLobbyData, required this.matchScores})
      : super._();

  @override
  final MatchLobbyData matchLobbyData;
  @override
  final MatchScores matchScores;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MatchLobbyState.confirmResult(matchLobbyData: $matchLobbyData, matchScores: $matchScores)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MatchLobbyState.confirmResult'))
      ..add(DiagnosticsProperty('matchLobbyData', matchLobbyData))
      ..add(DiagnosticsProperty('matchScores', matchScores));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MatchLobbyConfirmResult &&
            const DeepCollectionEquality()
                .equals(other.matchLobbyData, matchLobbyData) &&
            const DeepCollectionEquality()
                .equals(other.matchScores, matchScores));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(matchLobbyData),
      const DeepCollectionEquality().hash(matchScores));

  @JsonKey(ignore: true)
  @override
  $MatchLobbyConfirmResultCopyWith<MatchLobbyConfirmResult> get copyWith =>
      _$MatchLobbyConfirmResultCopyWithImpl<MatchLobbyConfirmResult>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() joining,
    required TResult Function(
            MatchLobbyData matchLobbyData, LobbyParameters lobbyParameters)
        gameInProgress,
    required TResult Function(MatchLobbyData matchLobbyData) addResult,
    required TResult Function(
            MatchLobbyData matchLobbyData, int score1, int score2)
        awaitingConfirmation,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchScores matchScores)
        confirmResult,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchScores matchScores)
        gameOver,
    required TResult Function(MatchLobbyData matchLobbyData) disputeInProgress,
    required TResult Function(
            Object exception, String? message, StackTrace? stackTrace)
        error,
    required TResult Function(int tournamentId) awaitingMatchmaking,
    required TResult Function(LobbyParameters lobbyParameters)
        waitingForOpponentToJoin,
  }) {
    return confirmResult(matchLobbyData, matchScores);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? joining,
    TResult Function(
            MatchLobbyData matchLobbyData, LobbyParameters lobbyParameters)?
        gameInProgress,
    TResult Function(MatchLobbyData matchLobbyData)? addResult,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        awaitingConfirmation,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        confirmResult,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        gameOver,
    TResult Function(MatchLobbyData matchLobbyData)? disputeInProgress,
    TResult Function(Object exception, String? message, StackTrace? stackTrace)?
        error,
    TResult Function(int tournamentId)? awaitingMatchmaking,
    TResult Function(LobbyParameters lobbyParameters)? waitingForOpponentToJoin,
  }) {
    return confirmResult?.call(matchLobbyData, matchScores);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? joining,
    TResult Function(
            MatchLobbyData matchLobbyData, LobbyParameters lobbyParameters)?
        gameInProgress,
    TResult Function(MatchLobbyData matchLobbyData)? addResult,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        awaitingConfirmation,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        confirmResult,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        gameOver,
    TResult Function(MatchLobbyData matchLobbyData)? disputeInProgress,
    TResult Function(Object exception, String? message, StackTrace? stackTrace)?
        error,
    TResult Function(int tournamentId)? awaitingMatchmaking,
    TResult Function(LobbyParameters lobbyParameters)? waitingForOpponentToJoin,
    required TResult orElse(),
  }) {
    if (confirmResult != null) {
      return confirmResult(matchLobbyData, matchScores);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MatchLobbyInitial value) initial,
    required TResult Function(_MatchLobbyJoining value) joining,
    required TResult Function(MatchLobbyGameInProgress value) gameInProgress,
    required TResult Function(MatchLobbyAddResult value) addResult,
    required TResult Function(MatchLobbyAwaitingConfirmation value)
        awaitingConfirmation,
    required TResult Function(MatchLobbyConfirmResult value) confirmResult,
    required TResult Function(MatchLobbyGameOver value) gameOver,
    required TResult Function(MatchLobbyDisputeInProgress value)
        disputeInProgress,
    required TResult Function(MatchLobbyError value) error,
    required TResult Function(MatchLobbyAwaitingMatchmaking value)
        awaitingMatchmaking,
    required TResult Function(MatchLobbyWaitingForOpponentToJoin value)
        waitingForOpponentToJoin,
  }) {
    return confirmResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_MatchLobbyInitial value)? initial,
    TResult Function(_MatchLobbyJoining value)? joining,
    TResult Function(MatchLobbyGameInProgress value)? gameInProgress,
    TResult Function(MatchLobbyAddResult value)? addResult,
    TResult Function(MatchLobbyAwaitingConfirmation value)?
        awaitingConfirmation,
    TResult Function(MatchLobbyConfirmResult value)? confirmResult,
    TResult Function(MatchLobbyGameOver value)? gameOver,
    TResult Function(MatchLobbyDisputeInProgress value)? disputeInProgress,
    TResult Function(MatchLobbyError value)? error,
    TResult Function(MatchLobbyAwaitingMatchmaking value)? awaitingMatchmaking,
    TResult Function(MatchLobbyWaitingForOpponentToJoin value)?
        waitingForOpponentToJoin,
  }) {
    return confirmResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MatchLobbyInitial value)? initial,
    TResult Function(_MatchLobbyJoining value)? joining,
    TResult Function(MatchLobbyGameInProgress value)? gameInProgress,
    TResult Function(MatchLobbyAddResult value)? addResult,
    TResult Function(MatchLobbyAwaitingConfirmation value)?
        awaitingConfirmation,
    TResult Function(MatchLobbyConfirmResult value)? confirmResult,
    TResult Function(MatchLobbyGameOver value)? gameOver,
    TResult Function(MatchLobbyDisputeInProgress value)? disputeInProgress,
    TResult Function(MatchLobbyError value)? error,
    TResult Function(MatchLobbyAwaitingMatchmaking value)? awaitingMatchmaking,
    TResult Function(MatchLobbyWaitingForOpponentToJoin value)?
        waitingForOpponentToJoin,
    required TResult orElse(),
  }) {
    if (confirmResult != null) {
      return confirmResult(this);
    }
    return orElse();
  }
}

abstract class MatchLobbyConfirmResult extends MatchLobbyState {
  const factory MatchLobbyConfirmResult(
      {required MatchLobbyData matchLobbyData,
      required MatchScores matchScores}) = _$MatchLobbyConfirmResult;
  const MatchLobbyConfirmResult._() : super._();

  MatchLobbyData get matchLobbyData;
  MatchScores get matchScores;
  @JsonKey(ignore: true)
  $MatchLobbyConfirmResultCopyWith<MatchLobbyConfirmResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchLobbyGameOverCopyWith<$Res> {
  factory $MatchLobbyGameOverCopyWith(
          MatchLobbyGameOver value, $Res Function(MatchLobbyGameOver) then) =
      _$MatchLobbyGameOverCopyWithImpl<$Res>;
  $Res call({MatchLobbyData matchLobbyData, MatchScores matchScores});
}

/// @nodoc
class _$MatchLobbyGameOverCopyWithImpl<$Res>
    extends _$MatchLobbyStateCopyWithImpl<$Res>
    implements $MatchLobbyGameOverCopyWith<$Res> {
  _$MatchLobbyGameOverCopyWithImpl(
      MatchLobbyGameOver _value, $Res Function(MatchLobbyGameOver) _then)
      : super(_value, (v) => _then(v as MatchLobbyGameOver));

  @override
  MatchLobbyGameOver get _value => super._value as MatchLobbyGameOver;

  @override
  $Res call({
    Object? matchLobbyData = freezed,
    Object? matchScores = freezed,
  }) {
    return _then(MatchLobbyGameOver(
      matchLobbyData: matchLobbyData == freezed
          ? _value.matchLobbyData
          : matchLobbyData // ignore: cast_nullable_to_non_nullable
              as MatchLobbyData,
      matchScores: matchScores == freezed
          ? _value.matchScores
          : matchScores // ignore: cast_nullable_to_non_nullable
              as MatchScores,
    ));
  }
}

/// @nodoc

class _$MatchLobbyGameOver extends MatchLobbyGameOver
    with DiagnosticableTreeMixin {
  const _$MatchLobbyGameOver(
      {required this.matchLobbyData, required this.matchScores})
      : super._();

  @override
  final MatchLobbyData matchLobbyData;
  @override
  final MatchScores matchScores;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MatchLobbyState.gameOver(matchLobbyData: $matchLobbyData, matchScores: $matchScores)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MatchLobbyState.gameOver'))
      ..add(DiagnosticsProperty('matchLobbyData', matchLobbyData))
      ..add(DiagnosticsProperty('matchScores', matchScores));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MatchLobbyGameOver &&
            const DeepCollectionEquality()
                .equals(other.matchLobbyData, matchLobbyData) &&
            const DeepCollectionEquality()
                .equals(other.matchScores, matchScores));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(matchLobbyData),
      const DeepCollectionEquality().hash(matchScores));

  @JsonKey(ignore: true)
  @override
  $MatchLobbyGameOverCopyWith<MatchLobbyGameOver> get copyWith =>
      _$MatchLobbyGameOverCopyWithImpl<MatchLobbyGameOver>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() joining,
    required TResult Function(
            MatchLobbyData matchLobbyData, LobbyParameters lobbyParameters)
        gameInProgress,
    required TResult Function(MatchLobbyData matchLobbyData) addResult,
    required TResult Function(
            MatchLobbyData matchLobbyData, int score1, int score2)
        awaitingConfirmation,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchScores matchScores)
        confirmResult,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchScores matchScores)
        gameOver,
    required TResult Function(MatchLobbyData matchLobbyData) disputeInProgress,
    required TResult Function(
            Object exception, String? message, StackTrace? stackTrace)
        error,
    required TResult Function(int tournamentId) awaitingMatchmaking,
    required TResult Function(LobbyParameters lobbyParameters)
        waitingForOpponentToJoin,
  }) {
    return gameOver(matchLobbyData, matchScores);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? joining,
    TResult Function(
            MatchLobbyData matchLobbyData, LobbyParameters lobbyParameters)?
        gameInProgress,
    TResult Function(MatchLobbyData matchLobbyData)? addResult,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        awaitingConfirmation,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        confirmResult,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        gameOver,
    TResult Function(MatchLobbyData matchLobbyData)? disputeInProgress,
    TResult Function(Object exception, String? message, StackTrace? stackTrace)?
        error,
    TResult Function(int tournamentId)? awaitingMatchmaking,
    TResult Function(LobbyParameters lobbyParameters)? waitingForOpponentToJoin,
  }) {
    return gameOver?.call(matchLobbyData, matchScores);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? joining,
    TResult Function(
            MatchLobbyData matchLobbyData, LobbyParameters lobbyParameters)?
        gameInProgress,
    TResult Function(MatchLobbyData matchLobbyData)? addResult,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        awaitingConfirmation,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        confirmResult,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        gameOver,
    TResult Function(MatchLobbyData matchLobbyData)? disputeInProgress,
    TResult Function(Object exception, String? message, StackTrace? stackTrace)?
        error,
    TResult Function(int tournamentId)? awaitingMatchmaking,
    TResult Function(LobbyParameters lobbyParameters)? waitingForOpponentToJoin,
    required TResult orElse(),
  }) {
    if (gameOver != null) {
      return gameOver(matchLobbyData, matchScores);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MatchLobbyInitial value) initial,
    required TResult Function(_MatchLobbyJoining value) joining,
    required TResult Function(MatchLobbyGameInProgress value) gameInProgress,
    required TResult Function(MatchLobbyAddResult value) addResult,
    required TResult Function(MatchLobbyAwaitingConfirmation value)
        awaitingConfirmation,
    required TResult Function(MatchLobbyConfirmResult value) confirmResult,
    required TResult Function(MatchLobbyGameOver value) gameOver,
    required TResult Function(MatchLobbyDisputeInProgress value)
        disputeInProgress,
    required TResult Function(MatchLobbyError value) error,
    required TResult Function(MatchLobbyAwaitingMatchmaking value)
        awaitingMatchmaking,
    required TResult Function(MatchLobbyWaitingForOpponentToJoin value)
        waitingForOpponentToJoin,
  }) {
    return gameOver(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_MatchLobbyInitial value)? initial,
    TResult Function(_MatchLobbyJoining value)? joining,
    TResult Function(MatchLobbyGameInProgress value)? gameInProgress,
    TResult Function(MatchLobbyAddResult value)? addResult,
    TResult Function(MatchLobbyAwaitingConfirmation value)?
        awaitingConfirmation,
    TResult Function(MatchLobbyConfirmResult value)? confirmResult,
    TResult Function(MatchLobbyGameOver value)? gameOver,
    TResult Function(MatchLobbyDisputeInProgress value)? disputeInProgress,
    TResult Function(MatchLobbyError value)? error,
    TResult Function(MatchLobbyAwaitingMatchmaking value)? awaitingMatchmaking,
    TResult Function(MatchLobbyWaitingForOpponentToJoin value)?
        waitingForOpponentToJoin,
  }) {
    return gameOver?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MatchLobbyInitial value)? initial,
    TResult Function(_MatchLobbyJoining value)? joining,
    TResult Function(MatchLobbyGameInProgress value)? gameInProgress,
    TResult Function(MatchLobbyAddResult value)? addResult,
    TResult Function(MatchLobbyAwaitingConfirmation value)?
        awaitingConfirmation,
    TResult Function(MatchLobbyConfirmResult value)? confirmResult,
    TResult Function(MatchLobbyGameOver value)? gameOver,
    TResult Function(MatchLobbyDisputeInProgress value)? disputeInProgress,
    TResult Function(MatchLobbyError value)? error,
    TResult Function(MatchLobbyAwaitingMatchmaking value)? awaitingMatchmaking,
    TResult Function(MatchLobbyWaitingForOpponentToJoin value)?
        waitingForOpponentToJoin,
    required TResult orElse(),
  }) {
    if (gameOver != null) {
      return gameOver(this);
    }
    return orElse();
  }
}

abstract class MatchLobbyGameOver extends MatchLobbyState {
  const factory MatchLobbyGameOver(
      {required MatchLobbyData matchLobbyData,
      required MatchScores matchScores}) = _$MatchLobbyGameOver;
  const MatchLobbyGameOver._() : super._();

  MatchLobbyData get matchLobbyData;
  MatchScores get matchScores;
  @JsonKey(ignore: true)
  $MatchLobbyGameOverCopyWith<MatchLobbyGameOver> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchLobbyDisputeInProgressCopyWith<$Res> {
  factory $MatchLobbyDisputeInProgressCopyWith(
          MatchLobbyDisputeInProgress value,
          $Res Function(MatchLobbyDisputeInProgress) then) =
      _$MatchLobbyDisputeInProgressCopyWithImpl<$Res>;
  $Res call({MatchLobbyData matchLobbyData});
}

/// @nodoc
class _$MatchLobbyDisputeInProgressCopyWithImpl<$Res>
    extends _$MatchLobbyStateCopyWithImpl<$Res>
    implements $MatchLobbyDisputeInProgressCopyWith<$Res> {
  _$MatchLobbyDisputeInProgressCopyWithImpl(MatchLobbyDisputeInProgress _value,
      $Res Function(MatchLobbyDisputeInProgress) _then)
      : super(_value, (v) => _then(v as MatchLobbyDisputeInProgress));

  @override
  MatchLobbyDisputeInProgress get _value =>
      super._value as MatchLobbyDisputeInProgress;

  @override
  $Res call({
    Object? matchLobbyData = freezed,
  }) {
    return _then(MatchLobbyDisputeInProgress(
      matchLobbyData: matchLobbyData == freezed
          ? _value.matchLobbyData
          : matchLobbyData // ignore: cast_nullable_to_non_nullable
              as MatchLobbyData,
    ));
  }
}

/// @nodoc

class _$MatchLobbyDisputeInProgress extends MatchLobbyDisputeInProgress
    with DiagnosticableTreeMixin {
  const _$MatchLobbyDisputeInProgress({required this.matchLobbyData})
      : super._();

  @override
  final MatchLobbyData matchLobbyData;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MatchLobbyState.disputeInProgress(matchLobbyData: $matchLobbyData)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MatchLobbyState.disputeInProgress'))
      ..add(DiagnosticsProperty('matchLobbyData', matchLobbyData));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MatchLobbyDisputeInProgress &&
            const DeepCollectionEquality()
                .equals(other.matchLobbyData, matchLobbyData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(matchLobbyData));

  @JsonKey(ignore: true)
  @override
  $MatchLobbyDisputeInProgressCopyWith<MatchLobbyDisputeInProgress>
      get copyWith => _$MatchLobbyDisputeInProgressCopyWithImpl<
          MatchLobbyDisputeInProgress>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() joining,
    required TResult Function(
            MatchLobbyData matchLobbyData, LobbyParameters lobbyParameters)
        gameInProgress,
    required TResult Function(MatchLobbyData matchLobbyData) addResult,
    required TResult Function(
            MatchLobbyData matchLobbyData, int score1, int score2)
        awaitingConfirmation,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchScores matchScores)
        confirmResult,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchScores matchScores)
        gameOver,
    required TResult Function(MatchLobbyData matchLobbyData) disputeInProgress,
    required TResult Function(
            Object exception, String? message, StackTrace? stackTrace)
        error,
    required TResult Function(int tournamentId) awaitingMatchmaking,
    required TResult Function(LobbyParameters lobbyParameters)
        waitingForOpponentToJoin,
  }) {
    return disputeInProgress(matchLobbyData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? joining,
    TResult Function(
            MatchLobbyData matchLobbyData, LobbyParameters lobbyParameters)?
        gameInProgress,
    TResult Function(MatchLobbyData matchLobbyData)? addResult,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        awaitingConfirmation,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        confirmResult,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        gameOver,
    TResult Function(MatchLobbyData matchLobbyData)? disputeInProgress,
    TResult Function(Object exception, String? message, StackTrace? stackTrace)?
        error,
    TResult Function(int tournamentId)? awaitingMatchmaking,
    TResult Function(LobbyParameters lobbyParameters)? waitingForOpponentToJoin,
  }) {
    return disputeInProgress?.call(matchLobbyData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? joining,
    TResult Function(
            MatchLobbyData matchLobbyData, LobbyParameters lobbyParameters)?
        gameInProgress,
    TResult Function(MatchLobbyData matchLobbyData)? addResult,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        awaitingConfirmation,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        confirmResult,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        gameOver,
    TResult Function(MatchLobbyData matchLobbyData)? disputeInProgress,
    TResult Function(Object exception, String? message, StackTrace? stackTrace)?
        error,
    TResult Function(int tournamentId)? awaitingMatchmaking,
    TResult Function(LobbyParameters lobbyParameters)? waitingForOpponentToJoin,
    required TResult orElse(),
  }) {
    if (disputeInProgress != null) {
      return disputeInProgress(matchLobbyData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MatchLobbyInitial value) initial,
    required TResult Function(_MatchLobbyJoining value) joining,
    required TResult Function(MatchLobbyGameInProgress value) gameInProgress,
    required TResult Function(MatchLobbyAddResult value) addResult,
    required TResult Function(MatchLobbyAwaitingConfirmation value)
        awaitingConfirmation,
    required TResult Function(MatchLobbyConfirmResult value) confirmResult,
    required TResult Function(MatchLobbyGameOver value) gameOver,
    required TResult Function(MatchLobbyDisputeInProgress value)
        disputeInProgress,
    required TResult Function(MatchLobbyError value) error,
    required TResult Function(MatchLobbyAwaitingMatchmaking value)
        awaitingMatchmaking,
    required TResult Function(MatchLobbyWaitingForOpponentToJoin value)
        waitingForOpponentToJoin,
  }) {
    return disputeInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_MatchLobbyInitial value)? initial,
    TResult Function(_MatchLobbyJoining value)? joining,
    TResult Function(MatchLobbyGameInProgress value)? gameInProgress,
    TResult Function(MatchLobbyAddResult value)? addResult,
    TResult Function(MatchLobbyAwaitingConfirmation value)?
        awaitingConfirmation,
    TResult Function(MatchLobbyConfirmResult value)? confirmResult,
    TResult Function(MatchLobbyGameOver value)? gameOver,
    TResult Function(MatchLobbyDisputeInProgress value)? disputeInProgress,
    TResult Function(MatchLobbyError value)? error,
    TResult Function(MatchLobbyAwaitingMatchmaking value)? awaitingMatchmaking,
    TResult Function(MatchLobbyWaitingForOpponentToJoin value)?
        waitingForOpponentToJoin,
  }) {
    return disputeInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MatchLobbyInitial value)? initial,
    TResult Function(_MatchLobbyJoining value)? joining,
    TResult Function(MatchLobbyGameInProgress value)? gameInProgress,
    TResult Function(MatchLobbyAddResult value)? addResult,
    TResult Function(MatchLobbyAwaitingConfirmation value)?
        awaitingConfirmation,
    TResult Function(MatchLobbyConfirmResult value)? confirmResult,
    TResult Function(MatchLobbyGameOver value)? gameOver,
    TResult Function(MatchLobbyDisputeInProgress value)? disputeInProgress,
    TResult Function(MatchLobbyError value)? error,
    TResult Function(MatchLobbyAwaitingMatchmaking value)? awaitingMatchmaking,
    TResult Function(MatchLobbyWaitingForOpponentToJoin value)?
        waitingForOpponentToJoin,
    required TResult orElse(),
  }) {
    if (disputeInProgress != null) {
      return disputeInProgress(this);
    }
    return orElse();
  }
}

abstract class MatchLobbyDisputeInProgress extends MatchLobbyState {
  const factory MatchLobbyDisputeInProgress(
      {required MatchLobbyData matchLobbyData}) = _$MatchLobbyDisputeInProgress;
  const MatchLobbyDisputeInProgress._() : super._();

  MatchLobbyData get matchLobbyData;
  @JsonKey(ignore: true)
  $MatchLobbyDisputeInProgressCopyWith<MatchLobbyDisputeInProgress>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchLobbyErrorCopyWith<$Res> {
  factory $MatchLobbyErrorCopyWith(
          MatchLobbyError value, $Res Function(MatchLobbyError) then) =
      _$MatchLobbyErrorCopyWithImpl<$Res>;
  $Res call({Object exception, String? message, StackTrace? stackTrace});
}

/// @nodoc
class _$MatchLobbyErrorCopyWithImpl<$Res>
    extends _$MatchLobbyStateCopyWithImpl<$Res>
    implements $MatchLobbyErrorCopyWith<$Res> {
  _$MatchLobbyErrorCopyWithImpl(
      MatchLobbyError _value, $Res Function(MatchLobbyError) _then)
      : super(_value, (v) => _then(v as MatchLobbyError));

  @override
  MatchLobbyError get _value => super._value as MatchLobbyError;

  @override
  $Res call({
    Object? exception = freezed,
    Object? message = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(MatchLobbyError(
      exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Object,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      stackTrace: stackTrace == freezed
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$MatchLobbyError extends MatchLobbyError with DiagnosticableTreeMixin {
  const _$MatchLobbyError(this.exception, {this.message, this.stackTrace})
      : super._();

  @override
  final Object exception;
  @override
  final String? message;
  @override
  final StackTrace? stackTrace;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MatchLobbyState.error(exception: $exception, message: $message, stackTrace: $stackTrace)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MatchLobbyState.error'))
      ..add(DiagnosticsProperty('exception', exception))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('stackTrace', stackTrace));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MatchLobbyError &&
            const DeepCollectionEquality().equals(other.exception, exception) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality()
                .equals(other.stackTrace, stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(exception),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(stackTrace));

  @JsonKey(ignore: true)
  @override
  $MatchLobbyErrorCopyWith<MatchLobbyError> get copyWith =>
      _$MatchLobbyErrorCopyWithImpl<MatchLobbyError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() joining,
    required TResult Function(
            MatchLobbyData matchLobbyData, LobbyParameters lobbyParameters)
        gameInProgress,
    required TResult Function(MatchLobbyData matchLobbyData) addResult,
    required TResult Function(
            MatchLobbyData matchLobbyData, int score1, int score2)
        awaitingConfirmation,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchScores matchScores)
        confirmResult,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchScores matchScores)
        gameOver,
    required TResult Function(MatchLobbyData matchLobbyData) disputeInProgress,
    required TResult Function(
            Object exception, String? message, StackTrace? stackTrace)
        error,
    required TResult Function(int tournamentId) awaitingMatchmaking,
    required TResult Function(LobbyParameters lobbyParameters)
        waitingForOpponentToJoin,
  }) {
    return error(exception, message, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? joining,
    TResult Function(
            MatchLobbyData matchLobbyData, LobbyParameters lobbyParameters)?
        gameInProgress,
    TResult Function(MatchLobbyData matchLobbyData)? addResult,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        awaitingConfirmation,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        confirmResult,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        gameOver,
    TResult Function(MatchLobbyData matchLobbyData)? disputeInProgress,
    TResult Function(Object exception, String? message, StackTrace? stackTrace)?
        error,
    TResult Function(int tournamentId)? awaitingMatchmaking,
    TResult Function(LobbyParameters lobbyParameters)? waitingForOpponentToJoin,
  }) {
    return error?.call(exception, message, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? joining,
    TResult Function(
            MatchLobbyData matchLobbyData, LobbyParameters lobbyParameters)?
        gameInProgress,
    TResult Function(MatchLobbyData matchLobbyData)? addResult,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        awaitingConfirmation,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        confirmResult,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        gameOver,
    TResult Function(MatchLobbyData matchLobbyData)? disputeInProgress,
    TResult Function(Object exception, String? message, StackTrace? stackTrace)?
        error,
    TResult Function(int tournamentId)? awaitingMatchmaking,
    TResult Function(LobbyParameters lobbyParameters)? waitingForOpponentToJoin,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(exception, message, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MatchLobbyInitial value) initial,
    required TResult Function(_MatchLobbyJoining value) joining,
    required TResult Function(MatchLobbyGameInProgress value) gameInProgress,
    required TResult Function(MatchLobbyAddResult value) addResult,
    required TResult Function(MatchLobbyAwaitingConfirmation value)
        awaitingConfirmation,
    required TResult Function(MatchLobbyConfirmResult value) confirmResult,
    required TResult Function(MatchLobbyGameOver value) gameOver,
    required TResult Function(MatchLobbyDisputeInProgress value)
        disputeInProgress,
    required TResult Function(MatchLobbyError value) error,
    required TResult Function(MatchLobbyAwaitingMatchmaking value)
        awaitingMatchmaking,
    required TResult Function(MatchLobbyWaitingForOpponentToJoin value)
        waitingForOpponentToJoin,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_MatchLobbyInitial value)? initial,
    TResult Function(_MatchLobbyJoining value)? joining,
    TResult Function(MatchLobbyGameInProgress value)? gameInProgress,
    TResult Function(MatchLobbyAddResult value)? addResult,
    TResult Function(MatchLobbyAwaitingConfirmation value)?
        awaitingConfirmation,
    TResult Function(MatchLobbyConfirmResult value)? confirmResult,
    TResult Function(MatchLobbyGameOver value)? gameOver,
    TResult Function(MatchLobbyDisputeInProgress value)? disputeInProgress,
    TResult Function(MatchLobbyError value)? error,
    TResult Function(MatchLobbyAwaitingMatchmaking value)? awaitingMatchmaking,
    TResult Function(MatchLobbyWaitingForOpponentToJoin value)?
        waitingForOpponentToJoin,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MatchLobbyInitial value)? initial,
    TResult Function(_MatchLobbyJoining value)? joining,
    TResult Function(MatchLobbyGameInProgress value)? gameInProgress,
    TResult Function(MatchLobbyAddResult value)? addResult,
    TResult Function(MatchLobbyAwaitingConfirmation value)?
        awaitingConfirmation,
    TResult Function(MatchLobbyConfirmResult value)? confirmResult,
    TResult Function(MatchLobbyGameOver value)? gameOver,
    TResult Function(MatchLobbyDisputeInProgress value)? disputeInProgress,
    TResult Function(MatchLobbyError value)? error,
    TResult Function(MatchLobbyAwaitingMatchmaking value)? awaitingMatchmaking,
    TResult Function(MatchLobbyWaitingForOpponentToJoin value)?
        waitingForOpponentToJoin,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class MatchLobbyError extends MatchLobbyState {
  const factory MatchLobbyError(Object exception,
      {String? message, StackTrace? stackTrace}) = _$MatchLobbyError;
  const MatchLobbyError._() : super._();

  Object get exception;
  String? get message;
  StackTrace? get stackTrace;
  @JsonKey(ignore: true)
  $MatchLobbyErrorCopyWith<MatchLobbyError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchLobbyAwaitingMatchmakingCopyWith<$Res> {
  factory $MatchLobbyAwaitingMatchmakingCopyWith(
          MatchLobbyAwaitingMatchmaking value,
          $Res Function(MatchLobbyAwaitingMatchmaking) then) =
      _$MatchLobbyAwaitingMatchmakingCopyWithImpl<$Res>;
  $Res call({int tournamentId});
}

/// @nodoc
class _$MatchLobbyAwaitingMatchmakingCopyWithImpl<$Res>
    extends _$MatchLobbyStateCopyWithImpl<$Res>
    implements $MatchLobbyAwaitingMatchmakingCopyWith<$Res> {
  _$MatchLobbyAwaitingMatchmakingCopyWithImpl(
      MatchLobbyAwaitingMatchmaking _value,
      $Res Function(MatchLobbyAwaitingMatchmaking) _then)
      : super(_value, (v) => _then(v as MatchLobbyAwaitingMatchmaking));

  @override
  MatchLobbyAwaitingMatchmaking get _value =>
      super._value as MatchLobbyAwaitingMatchmaking;

  @override
  $Res call({
    Object? tournamentId = freezed,
  }) {
    return _then(MatchLobbyAwaitingMatchmaking(
      tournamentId: tournamentId == freezed
          ? _value.tournamentId
          : tournamentId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$MatchLobbyAwaitingMatchmaking extends MatchLobbyAwaitingMatchmaking
    with DiagnosticableTreeMixin {
  const _$MatchLobbyAwaitingMatchmaking({required this.tournamentId})
      : super._();

  @override
  final int tournamentId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MatchLobbyState.awaitingMatchmaking(tournamentId: $tournamentId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MatchLobbyState.awaitingMatchmaking'))
      ..add(DiagnosticsProperty('tournamentId', tournamentId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MatchLobbyAwaitingMatchmaking &&
            const DeepCollectionEquality()
                .equals(other.tournamentId, tournamentId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(tournamentId));

  @JsonKey(ignore: true)
  @override
  $MatchLobbyAwaitingMatchmakingCopyWith<MatchLobbyAwaitingMatchmaking>
      get copyWith => _$MatchLobbyAwaitingMatchmakingCopyWithImpl<
          MatchLobbyAwaitingMatchmaking>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() joining,
    required TResult Function(
            MatchLobbyData matchLobbyData, LobbyParameters lobbyParameters)
        gameInProgress,
    required TResult Function(MatchLobbyData matchLobbyData) addResult,
    required TResult Function(
            MatchLobbyData matchLobbyData, int score1, int score2)
        awaitingConfirmation,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchScores matchScores)
        confirmResult,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchScores matchScores)
        gameOver,
    required TResult Function(MatchLobbyData matchLobbyData) disputeInProgress,
    required TResult Function(
            Object exception, String? message, StackTrace? stackTrace)
        error,
    required TResult Function(int tournamentId) awaitingMatchmaking,
    required TResult Function(LobbyParameters lobbyParameters)
        waitingForOpponentToJoin,
  }) {
    return awaitingMatchmaking(tournamentId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? joining,
    TResult Function(
            MatchLobbyData matchLobbyData, LobbyParameters lobbyParameters)?
        gameInProgress,
    TResult Function(MatchLobbyData matchLobbyData)? addResult,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        awaitingConfirmation,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        confirmResult,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        gameOver,
    TResult Function(MatchLobbyData matchLobbyData)? disputeInProgress,
    TResult Function(Object exception, String? message, StackTrace? stackTrace)?
        error,
    TResult Function(int tournamentId)? awaitingMatchmaking,
    TResult Function(LobbyParameters lobbyParameters)? waitingForOpponentToJoin,
  }) {
    return awaitingMatchmaking?.call(tournamentId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? joining,
    TResult Function(
            MatchLobbyData matchLobbyData, LobbyParameters lobbyParameters)?
        gameInProgress,
    TResult Function(MatchLobbyData matchLobbyData)? addResult,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        awaitingConfirmation,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        confirmResult,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        gameOver,
    TResult Function(MatchLobbyData matchLobbyData)? disputeInProgress,
    TResult Function(Object exception, String? message, StackTrace? stackTrace)?
        error,
    TResult Function(int tournamentId)? awaitingMatchmaking,
    TResult Function(LobbyParameters lobbyParameters)? waitingForOpponentToJoin,
    required TResult orElse(),
  }) {
    if (awaitingMatchmaking != null) {
      return awaitingMatchmaking(tournamentId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MatchLobbyInitial value) initial,
    required TResult Function(_MatchLobbyJoining value) joining,
    required TResult Function(MatchLobbyGameInProgress value) gameInProgress,
    required TResult Function(MatchLobbyAddResult value) addResult,
    required TResult Function(MatchLobbyAwaitingConfirmation value)
        awaitingConfirmation,
    required TResult Function(MatchLobbyConfirmResult value) confirmResult,
    required TResult Function(MatchLobbyGameOver value) gameOver,
    required TResult Function(MatchLobbyDisputeInProgress value)
        disputeInProgress,
    required TResult Function(MatchLobbyError value) error,
    required TResult Function(MatchLobbyAwaitingMatchmaking value)
        awaitingMatchmaking,
    required TResult Function(MatchLobbyWaitingForOpponentToJoin value)
        waitingForOpponentToJoin,
  }) {
    return awaitingMatchmaking(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_MatchLobbyInitial value)? initial,
    TResult Function(_MatchLobbyJoining value)? joining,
    TResult Function(MatchLobbyGameInProgress value)? gameInProgress,
    TResult Function(MatchLobbyAddResult value)? addResult,
    TResult Function(MatchLobbyAwaitingConfirmation value)?
        awaitingConfirmation,
    TResult Function(MatchLobbyConfirmResult value)? confirmResult,
    TResult Function(MatchLobbyGameOver value)? gameOver,
    TResult Function(MatchLobbyDisputeInProgress value)? disputeInProgress,
    TResult Function(MatchLobbyError value)? error,
    TResult Function(MatchLobbyAwaitingMatchmaking value)? awaitingMatchmaking,
    TResult Function(MatchLobbyWaitingForOpponentToJoin value)?
        waitingForOpponentToJoin,
  }) {
    return awaitingMatchmaking?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MatchLobbyInitial value)? initial,
    TResult Function(_MatchLobbyJoining value)? joining,
    TResult Function(MatchLobbyGameInProgress value)? gameInProgress,
    TResult Function(MatchLobbyAddResult value)? addResult,
    TResult Function(MatchLobbyAwaitingConfirmation value)?
        awaitingConfirmation,
    TResult Function(MatchLobbyConfirmResult value)? confirmResult,
    TResult Function(MatchLobbyGameOver value)? gameOver,
    TResult Function(MatchLobbyDisputeInProgress value)? disputeInProgress,
    TResult Function(MatchLobbyError value)? error,
    TResult Function(MatchLobbyAwaitingMatchmaking value)? awaitingMatchmaking,
    TResult Function(MatchLobbyWaitingForOpponentToJoin value)?
        waitingForOpponentToJoin,
    required TResult orElse(),
  }) {
    if (awaitingMatchmaking != null) {
      return awaitingMatchmaking(this);
    }
    return orElse();
  }
}

abstract class MatchLobbyAwaitingMatchmaking extends MatchLobbyState {
  const factory MatchLobbyAwaitingMatchmaking({required int tournamentId}) =
      _$MatchLobbyAwaitingMatchmaking;
  const MatchLobbyAwaitingMatchmaking._() : super._();

  int get tournamentId;
  @JsonKey(ignore: true)
  $MatchLobbyAwaitingMatchmakingCopyWith<MatchLobbyAwaitingMatchmaking>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchLobbyWaitingForOpponentToJoinCopyWith<$Res> {
  factory $MatchLobbyWaitingForOpponentToJoinCopyWith(
          MatchLobbyWaitingForOpponentToJoin value,
          $Res Function(MatchLobbyWaitingForOpponentToJoin) then) =
      _$MatchLobbyWaitingForOpponentToJoinCopyWithImpl<$Res>;
  $Res call({LobbyParameters lobbyParameters});
}

/// @nodoc
class _$MatchLobbyWaitingForOpponentToJoinCopyWithImpl<$Res>
    extends _$MatchLobbyStateCopyWithImpl<$Res>
    implements $MatchLobbyWaitingForOpponentToJoinCopyWith<$Res> {
  _$MatchLobbyWaitingForOpponentToJoinCopyWithImpl(
      MatchLobbyWaitingForOpponentToJoin _value,
      $Res Function(MatchLobbyWaitingForOpponentToJoin) _then)
      : super(_value, (v) => _then(v as MatchLobbyWaitingForOpponentToJoin));

  @override
  MatchLobbyWaitingForOpponentToJoin get _value =>
      super._value as MatchLobbyWaitingForOpponentToJoin;

  @override
  $Res call({
    Object? lobbyParameters = freezed,
  }) {
    return _then(MatchLobbyWaitingForOpponentToJoin(
      lobbyParameters: lobbyParameters == freezed
          ? _value.lobbyParameters
          : lobbyParameters // ignore: cast_nullable_to_non_nullable
              as LobbyParameters,
    ));
  }
}

/// @nodoc

class _$MatchLobbyWaitingForOpponentToJoin
    extends MatchLobbyWaitingForOpponentToJoin with DiagnosticableTreeMixin {
  const _$MatchLobbyWaitingForOpponentToJoin({required this.lobbyParameters})
      : super._();

  @override
  final LobbyParameters lobbyParameters;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MatchLobbyState.waitingForOpponentToJoin(lobbyParameters: $lobbyParameters)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'MatchLobbyState.waitingForOpponentToJoin'))
      ..add(DiagnosticsProperty('lobbyParameters', lobbyParameters));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MatchLobbyWaitingForOpponentToJoin &&
            const DeepCollectionEquality()
                .equals(other.lobbyParameters, lobbyParameters));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(lobbyParameters));

  @JsonKey(ignore: true)
  @override
  $MatchLobbyWaitingForOpponentToJoinCopyWith<
          MatchLobbyWaitingForOpponentToJoin>
      get copyWith => _$MatchLobbyWaitingForOpponentToJoinCopyWithImpl<
          MatchLobbyWaitingForOpponentToJoin>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() joining,
    required TResult Function(
            MatchLobbyData matchLobbyData, LobbyParameters lobbyParameters)
        gameInProgress,
    required TResult Function(MatchLobbyData matchLobbyData) addResult,
    required TResult Function(
            MatchLobbyData matchLobbyData, int score1, int score2)
        awaitingConfirmation,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchScores matchScores)
        confirmResult,
    required TResult Function(
            MatchLobbyData matchLobbyData, MatchScores matchScores)
        gameOver,
    required TResult Function(MatchLobbyData matchLobbyData) disputeInProgress,
    required TResult Function(
            Object exception, String? message, StackTrace? stackTrace)
        error,
    required TResult Function(int tournamentId) awaitingMatchmaking,
    required TResult Function(LobbyParameters lobbyParameters)
        waitingForOpponentToJoin,
  }) {
    return waitingForOpponentToJoin(lobbyParameters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? joining,
    TResult Function(
            MatchLobbyData matchLobbyData, LobbyParameters lobbyParameters)?
        gameInProgress,
    TResult Function(MatchLobbyData matchLobbyData)? addResult,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        awaitingConfirmation,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        confirmResult,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        gameOver,
    TResult Function(MatchLobbyData matchLobbyData)? disputeInProgress,
    TResult Function(Object exception, String? message, StackTrace? stackTrace)?
        error,
    TResult Function(int tournamentId)? awaitingMatchmaking,
    TResult Function(LobbyParameters lobbyParameters)? waitingForOpponentToJoin,
  }) {
    return waitingForOpponentToJoin?.call(lobbyParameters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? joining,
    TResult Function(
            MatchLobbyData matchLobbyData, LobbyParameters lobbyParameters)?
        gameInProgress,
    TResult Function(MatchLobbyData matchLobbyData)? addResult,
    TResult Function(MatchLobbyData matchLobbyData, int score1, int score2)?
        awaitingConfirmation,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        confirmResult,
    TResult Function(MatchLobbyData matchLobbyData, MatchScores matchScores)?
        gameOver,
    TResult Function(MatchLobbyData matchLobbyData)? disputeInProgress,
    TResult Function(Object exception, String? message, StackTrace? stackTrace)?
        error,
    TResult Function(int tournamentId)? awaitingMatchmaking,
    TResult Function(LobbyParameters lobbyParameters)? waitingForOpponentToJoin,
    required TResult orElse(),
  }) {
    if (waitingForOpponentToJoin != null) {
      return waitingForOpponentToJoin(lobbyParameters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MatchLobbyInitial value) initial,
    required TResult Function(_MatchLobbyJoining value) joining,
    required TResult Function(MatchLobbyGameInProgress value) gameInProgress,
    required TResult Function(MatchLobbyAddResult value) addResult,
    required TResult Function(MatchLobbyAwaitingConfirmation value)
        awaitingConfirmation,
    required TResult Function(MatchLobbyConfirmResult value) confirmResult,
    required TResult Function(MatchLobbyGameOver value) gameOver,
    required TResult Function(MatchLobbyDisputeInProgress value)
        disputeInProgress,
    required TResult Function(MatchLobbyError value) error,
    required TResult Function(MatchLobbyAwaitingMatchmaking value)
        awaitingMatchmaking,
    required TResult Function(MatchLobbyWaitingForOpponentToJoin value)
        waitingForOpponentToJoin,
  }) {
    return waitingForOpponentToJoin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_MatchLobbyInitial value)? initial,
    TResult Function(_MatchLobbyJoining value)? joining,
    TResult Function(MatchLobbyGameInProgress value)? gameInProgress,
    TResult Function(MatchLobbyAddResult value)? addResult,
    TResult Function(MatchLobbyAwaitingConfirmation value)?
        awaitingConfirmation,
    TResult Function(MatchLobbyConfirmResult value)? confirmResult,
    TResult Function(MatchLobbyGameOver value)? gameOver,
    TResult Function(MatchLobbyDisputeInProgress value)? disputeInProgress,
    TResult Function(MatchLobbyError value)? error,
    TResult Function(MatchLobbyAwaitingMatchmaking value)? awaitingMatchmaking,
    TResult Function(MatchLobbyWaitingForOpponentToJoin value)?
        waitingForOpponentToJoin,
  }) {
    return waitingForOpponentToJoin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MatchLobbyInitial value)? initial,
    TResult Function(_MatchLobbyJoining value)? joining,
    TResult Function(MatchLobbyGameInProgress value)? gameInProgress,
    TResult Function(MatchLobbyAddResult value)? addResult,
    TResult Function(MatchLobbyAwaitingConfirmation value)?
        awaitingConfirmation,
    TResult Function(MatchLobbyConfirmResult value)? confirmResult,
    TResult Function(MatchLobbyGameOver value)? gameOver,
    TResult Function(MatchLobbyDisputeInProgress value)? disputeInProgress,
    TResult Function(MatchLobbyError value)? error,
    TResult Function(MatchLobbyAwaitingMatchmaking value)? awaitingMatchmaking,
    TResult Function(MatchLobbyWaitingForOpponentToJoin value)?
        waitingForOpponentToJoin,
    required TResult orElse(),
  }) {
    if (waitingForOpponentToJoin != null) {
      return waitingForOpponentToJoin(this);
    }
    return orElse();
  }
}

abstract class MatchLobbyWaitingForOpponentToJoin extends MatchLobbyState {
  const factory MatchLobbyWaitingForOpponentToJoin(
          {required LobbyParameters lobbyParameters}) =
      _$MatchLobbyWaitingForOpponentToJoin;
  const MatchLobbyWaitingForOpponentToJoin._() : super._();

  LobbyParameters get lobbyParameters;
  @JsonKey(ignore: true)
  $MatchLobbyWaitingForOpponentToJoinCopyWith<
          MatchLobbyWaitingForOpponentToJoin>
      get copyWith => throw _privateConstructorUsedError;
}
