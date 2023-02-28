// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'check_in_dialog_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CheckInDialogStateTearOff {
  const _$CheckInDialogStateTearOff();

  _Initial initial({required LobbyCheckIn checkIn}) {
    return _Initial(
      checkIn: checkIn,
    );
  }

  _Error error({required NetworkException exception}) {
    return _Error(
      exception: exception,
    );
  }

  _WatingForResponse waitingForResponse() {
    return const _WatingForResponse();
  }

  _LeaveSuccess leaveSuccess({String? reason}) {
    return _LeaveSuccess(
      reason: reason,
    );
  }

  _CheckInSuccess checkInSuccess({required DateTime checkInTime}) {
    return _CheckInSuccess(
      checkInTime: checkInTime,
    );
  }
}

/// @nodoc
const $CheckInDialogState = _$CheckInDialogStateTearOff();

/// @nodoc
mixin _$CheckInDialogState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LobbyCheckIn checkIn) initial,
    required TResult Function(NetworkException exception) error,
    required TResult Function() waitingForResponse,
    required TResult Function(String? reason) leaveSuccess,
    required TResult Function(DateTime checkInTime) checkInSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LobbyCheckIn checkIn)? initial,
    TResult Function(NetworkException exception)? error,
    TResult Function()? waitingForResponse,
    TResult Function(String? reason)? leaveSuccess,
    TResult Function(DateTime checkInTime)? checkInSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LobbyCheckIn checkIn)? initial,
    TResult Function(NetworkException exception)? error,
    TResult Function()? waitingForResponse,
    TResult Function(String? reason)? leaveSuccess,
    TResult Function(DateTime checkInTime)? checkInSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_WatingForResponse value) waitingForResponse,
    required TResult Function(_LeaveSuccess value) leaveSuccess,
    required TResult Function(_CheckInSuccess value) checkInSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_WatingForResponse value)? waitingForResponse,
    TResult Function(_LeaveSuccess value)? leaveSuccess,
    TResult Function(_CheckInSuccess value)? checkInSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_WatingForResponse value)? waitingForResponse,
    TResult Function(_LeaveSuccess value)? leaveSuccess,
    TResult Function(_CheckInSuccess value)? checkInSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckInDialogStateCopyWith<$Res> {
  factory $CheckInDialogStateCopyWith(
          CheckInDialogState value, $Res Function(CheckInDialogState) then) =
      _$CheckInDialogStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CheckInDialogStateCopyWithImpl<$Res>
    implements $CheckInDialogStateCopyWith<$Res> {
  _$CheckInDialogStateCopyWithImpl(this._value, this._then);

  final CheckInDialogState _value;
  // ignore: unused_field
  final $Res Function(CheckInDialogState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  $Res call({LobbyCheckIn checkIn});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$CheckInDialogStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object? checkIn = freezed,
  }) {
    return _then(_Initial(
      checkIn: checkIn == freezed
          ? _value.checkIn
          : checkIn // ignore: cast_nullable_to_non_nullable
              as LobbyCheckIn,
    ));
  }
}

/// @nodoc

class _$_Initial extends _Initial with DiagnosticableTreeMixin {
  const _$_Initial({required this.checkIn}) : super._();

  @override
  final LobbyCheckIn checkIn;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckInDialogState.initial(checkIn: $checkIn)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CheckInDialogState.initial'))
      ..add(DiagnosticsProperty('checkIn', checkIn));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Initial &&
            const DeepCollectionEquality().equals(other.checkIn, checkIn));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(checkIn));

  @JsonKey(ignore: true)
  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LobbyCheckIn checkIn) initial,
    required TResult Function(NetworkException exception) error,
    required TResult Function() waitingForResponse,
    required TResult Function(String? reason) leaveSuccess,
    required TResult Function(DateTime checkInTime) checkInSuccess,
  }) {
    return initial(checkIn);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LobbyCheckIn checkIn)? initial,
    TResult Function(NetworkException exception)? error,
    TResult Function()? waitingForResponse,
    TResult Function(String? reason)? leaveSuccess,
    TResult Function(DateTime checkInTime)? checkInSuccess,
  }) {
    return initial?.call(checkIn);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LobbyCheckIn checkIn)? initial,
    TResult Function(NetworkException exception)? error,
    TResult Function()? waitingForResponse,
    TResult Function(String? reason)? leaveSuccess,
    TResult Function(DateTime checkInTime)? checkInSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(checkIn);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_WatingForResponse value) waitingForResponse,
    required TResult Function(_LeaveSuccess value) leaveSuccess,
    required TResult Function(_CheckInSuccess value) checkInSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_WatingForResponse value)? waitingForResponse,
    TResult Function(_LeaveSuccess value)? leaveSuccess,
    TResult Function(_CheckInSuccess value)? checkInSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_WatingForResponse value)? waitingForResponse,
    TResult Function(_LeaveSuccess value)? leaveSuccess,
    TResult Function(_CheckInSuccess value)? checkInSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends CheckInDialogState {
  const factory _Initial({required LobbyCheckIn checkIn}) = _$_Initial;
  const _Initial._() : super._();

  LobbyCheckIn get checkIn;
  @JsonKey(ignore: true)
  _$InitialCopyWith<_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
  $Res call({NetworkException exception});

  $NetworkExceptionCopyWith<$Res> get exception;
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$CheckInDialogStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;

  @override
  $Res call({
    Object? exception = freezed,
  }) {
    return _then(_Error(
      exception: exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as NetworkException,
    ));
  }

  @override
  $NetworkExceptionCopyWith<$Res> get exception {
    return $NetworkExceptionCopyWith<$Res>(_value.exception, (value) {
      return _then(_value.copyWith(exception: value));
    });
  }
}

/// @nodoc

class _$_Error extends _Error with DiagnosticableTreeMixin {
  const _$_Error({required this.exception}) : super._();

  @override
  final NetworkException exception;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckInDialogState.error(exception: $exception)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CheckInDialogState.error'))
      ..add(DiagnosticsProperty('exception', exception));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            const DeepCollectionEquality().equals(other.exception, exception));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(exception));

  @JsonKey(ignore: true)
  @override
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LobbyCheckIn checkIn) initial,
    required TResult Function(NetworkException exception) error,
    required TResult Function() waitingForResponse,
    required TResult Function(String? reason) leaveSuccess,
    required TResult Function(DateTime checkInTime) checkInSuccess,
  }) {
    return error(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LobbyCheckIn checkIn)? initial,
    TResult Function(NetworkException exception)? error,
    TResult Function()? waitingForResponse,
    TResult Function(String? reason)? leaveSuccess,
    TResult Function(DateTime checkInTime)? checkInSuccess,
  }) {
    return error?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LobbyCheckIn checkIn)? initial,
    TResult Function(NetworkException exception)? error,
    TResult Function()? waitingForResponse,
    TResult Function(String? reason)? leaveSuccess,
    TResult Function(DateTime checkInTime)? checkInSuccess,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_WatingForResponse value) waitingForResponse,
    required TResult Function(_LeaveSuccess value) leaveSuccess,
    required TResult Function(_CheckInSuccess value) checkInSuccess,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_WatingForResponse value)? waitingForResponse,
    TResult Function(_LeaveSuccess value)? leaveSuccess,
    TResult Function(_CheckInSuccess value)? checkInSuccess,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_WatingForResponse value)? waitingForResponse,
    TResult Function(_LeaveSuccess value)? leaveSuccess,
    TResult Function(_CheckInSuccess value)? checkInSuccess,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error extends CheckInDialogState {
  const factory _Error({required NetworkException exception}) = _$_Error;
  const _Error._() : super._();

  NetworkException get exception;
  @JsonKey(ignore: true)
  _$ErrorCopyWith<_Error> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$WatingForResponseCopyWith<$Res> {
  factory _$WatingForResponseCopyWith(
          _WatingForResponse value, $Res Function(_WatingForResponse) then) =
      __$WatingForResponseCopyWithImpl<$Res>;
}

/// @nodoc
class __$WatingForResponseCopyWithImpl<$Res>
    extends _$CheckInDialogStateCopyWithImpl<$Res>
    implements _$WatingForResponseCopyWith<$Res> {
  __$WatingForResponseCopyWithImpl(
      _WatingForResponse _value, $Res Function(_WatingForResponse) _then)
      : super(_value, (v) => _then(v as _WatingForResponse));

  @override
  _WatingForResponse get _value => super._value as _WatingForResponse;
}

/// @nodoc

class _$_WatingForResponse extends _WatingForResponse
    with DiagnosticableTreeMixin {
  const _$_WatingForResponse() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckInDialogState.waitingForResponse()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'CheckInDialogState.waitingForResponse'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _WatingForResponse);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LobbyCheckIn checkIn) initial,
    required TResult Function(NetworkException exception) error,
    required TResult Function() waitingForResponse,
    required TResult Function(String? reason) leaveSuccess,
    required TResult Function(DateTime checkInTime) checkInSuccess,
  }) {
    return waitingForResponse();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LobbyCheckIn checkIn)? initial,
    TResult Function(NetworkException exception)? error,
    TResult Function()? waitingForResponse,
    TResult Function(String? reason)? leaveSuccess,
    TResult Function(DateTime checkInTime)? checkInSuccess,
  }) {
    return waitingForResponse?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LobbyCheckIn checkIn)? initial,
    TResult Function(NetworkException exception)? error,
    TResult Function()? waitingForResponse,
    TResult Function(String? reason)? leaveSuccess,
    TResult Function(DateTime checkInTime)? checkInSuccess,
    required TResult orElse(),
  }) {
    if (waitingForResponse != null) {
      return waitingForResponse();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_WatingForResponse value) waitingForResponse,
    required TResult Function(_LeaveSuccess value) leaveSuccess,
    required TResult Function(_CheckInSuccess value) checkInSuccess,
  }) {
    return waitingForResponse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_WatingForResponse value)? waitingForResponse,
    TResult Function(_LeaveSuccess value)? leaveSuccess,
    TResult Function(_CheckInSuccess value)? checkInSuccess,
  }) {
    return waitingForResponse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_WatingForResponse value)? waitingForResponse,
    TResult Function(_LeaveSuccess value)? leaveSuccess,
    TResult Function(_CheckInSuccess value)? checkInSuccess,
    required TResult orElse(),
  }) {
    if (waitingForResponse != null) {
      return waitingForResponse(this);
    }
    return orElse();
  }
}

abstract class _WatingForResponse extends CheckInDialogState {
  const factory _WatingForResponse() = _$_WatingForResponse;
  const _WatingForResponse._() : super._();
}

/// @nodoc
abstract class _$LeaveSuccessCopyWith<$Res> {
  factory _$LeaveSuccessCopyWith(
          _LeaveSuccess value, $Res Function(_LeaveSuccess) then) =
      __$LeaveSuccessCopyWithImpl<$Res>;
  $Res call({String? reason});
}

/// @nodoc
class __$LeaveSuccessCopyWithImpl<$Res>
    extends _$CheckInDialogStateCopyWithImpl<$Res>
    implements _$LeaveSuccessCopyWith<$Res> {
  __$LeaveSuccessCopyWithImpl(
      _LeaveSuccess _value, $Res Function(_LeaveSuccess) _then)
      : super(_value, (v) => _then(v as _LeaveSuccess));

  @override
  _LeaveSuccess get _value => super._value as _LeaveSuccess;

  @override
  $Res call({
    Object? reason = freezed,
  }) {
    return _then(_LeaveSuccess(
      reason: reason == freezed
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_LeaveSuccess extends _LeaveSuccess with DiagnosticableTreeMixin {
  const _$_LeaveSuccess({this.reason}) : super._();

  @override
  final String? reason;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckInDialogState.leaveSuccess(reason: $reason)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CheckInDialogState.leaveSuccess'))
      ..add(DiagnosticsProperty('reason', reason));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LeaveSuccess &&
            const DeepCollectionEquality().equals(other.reason, reason));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(reason));

  @JsonKey(ignore: true)
  @override
  _$LeaveSuccessCopyWith<_LeaveSuccess> get copyWith =>
      __$LeaveSuccessCopyWithImpl<_LeaveSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LobbyCheckIn checkIn) initial,
    required TResult Function(NetworkException exception) error,
    required TResult Function() waitingForResponse,
    required TResult Function(String? reason) leaveSuccess,
    required TResult Function(DateTime checkInTime) checkInSuccess,
  }) {
    return leaveSuccess(reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LobbyCheckIn checkIn)? initial,
    TResult Function(NetworkException exception)? error,
    TResult Function()? waitingForResponse,
    TResult Function(String? reason)? leaveSuccess,
    TResult Function(DateTime checkInTime)? checkInSuccess,
  }) {
    return leaveSuccess?.call(reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LobbyCheckIn checkIn)? initial,
    TResult Function(NetworkException exception)? error,
    TResult Function()? waitingForResponse,
    TResult Function(String? reason)? leaveSuccess,
    TResult Function(DateTime checkInTime)? checkInSuccess,
    required TResult orElse(),
  }) {
    if (leaveSuccess != null) {
      return leaveSuccess(reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_WatingForResponse value) waitingForResponse,
    required TResult Function(_LeaveSuccess value) leaveSuccess,
    required TResult Function(_CheckInSuccess value) checkInSuccess,
  }) {
    return leaveSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_WatingForResponse value)? waitingForResponse,
    TResult Function(_LeaveSuccess value)? leaveSuccess,
    TResult Function(_CheckInSuccess value)? checkInSuccess,
  }) {
    return leaveSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_WatingForResponse value)? waitingForResponse,
    TResult Function(_LeaveSuccess value)? leaveSuccess,
    TResult Function(_CheckInSuccess value)? checkInSuccess,
    required TResult orElse(),
  }) {
    if (leaveSuccess != null) {
      return leaveSuccess(this);
    }
    return orElse();
  }
}

abstract class _LeaveSuccess extends CheckInDialogState {
  const factory _LeaveSuccess({String? reason}) = _$_LeaveSuccess;
  const _LeaveSuccess._() : super._();

  String? get reason;
  @JsonKey(ignore: true)
  _$LeaveSuccessCopyWith<_LeaveSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$CheckInSuccessCopyWith<$Res> {
  factory _$CheckInSuccessCopyWith(
          _CheckInSuccess value, $Res Function(_CheckInSuccess) then) =
      __$CheckInSuccessCopyWithImpl<$Res>;
  $Res call({DateTime checkInTime});
}

/// @nodoc
class __$CheckInSuccessCopyWithImpl<$Res>
    extends _$CheckInDialogStateCopyWithImpl<$Res>
    implements _$CheckInSuccessCopyWith<$Res> {
  __$CheckInSuccessCopyWithImpl(
      _CheckInSuccess _value, $Res Function(_CheckInSuccess) _then)
      : super(_value, (v) => _then(v as _CheckInSuccess));

  @override
  _CheckInSuccess get _value => super._value as _CheckInSuccess;

  @override
  $Res call({
    Object? checkInTime = freezed,
  }) {
    return _then(_CheckInSuccess(
      checkInTime: checkInTime == freezed
          ? _value.checkInTime
          : checkInTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_CheckInSuccess extends _CheckInSuccess with DiagnosticableTreeMixin {
  const _$_CheckInSuccess({required this.checkInTime}) : super._();

  @override
  final DateTime checkInTime;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CheckInDialogState.checkInSuccess(checkInTime: $checkInTime)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CheckInDialogState.checkInSuccess'))
      ..add(DiagnosticsProperty('checkInTime', checkInTime));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CheckInSuccess &&
            const DeepCollectionEquality()
                .equals(other.checkInTime, checkInTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(checkInTime));

  @JsonKey(ignore: true)
  @override
  _$CheckInSuccessCopyWith<_CheckInSuccess> get copyWith =>
      __$CheckInSuccessCopyWithImpl<_CheckInSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LobbyCheckIn checkIn) initial,
    required TResult Function(NetworkException exception) error,
    required TResult Function() waitingForResponse,
    required TResult Function(String? reason) leaveSuccess,
    required TResult Function(DateTime checkInTime) checkInSuccess,
  }) {
    return checkInSuccess(checkInTime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(LobbyCheckIn checkIn)? initial,
    TResult Function(NetworkException exception)? error,
    TResult Function()? waitingForResponse,
    TResult Function(String? reason)? leaveSuccess,
    TResult Function(DateTime checkInTime)? checkInSuccess,
  }) {
    return checkInSuccess?.call(checkInTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LobbyCheckIn checkIn)? initial,
    TResult Function(NetworkException exception)? error,
    TResult Function()? waitingForResponse,
    TResult Function(String? reason)? leaveSuccess,
    TResult Function(DateTime checkInTime)? checkInSuccess,
    required TResult orElse(),
  }) {
    if (checkInSuccess != null) {
      return checkInSuccess(checkInTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Error value) error,
    required TResult Function(_WatingForResponse value) waitingForResponse,
    required TResult Function(_LeaveSuccess value) leaveSuccess,
    required TResult Function(_CheckInSuccess value) checkInSuccess,
  }) {
    return checkInSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_WatingForResponse value)? waitingForResponse,
    TResult Function(_LeaveSuccess value)? leaveSuccess,
    TResult Function(_CheckInSuccess value)? checkInSuccess,
  }) {
    return checkInSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Error value)? error,
    TResult Function(_WatingForResponse value)? waitingForResponse,
    TResult Function(_LeaveSuccess value)? leaveSuccess,
    TResult Function(_CheckInSuccess value)? checkInSuccess,
    required TResult orElse(),
  }) {
    if (checkInSuccess != null) {
      return checkInSuccess(this);
    }
    return orElse();
  }
}

abstract class _CheckInSuccess extends CheckInDialogState {
  const factory _CheckInSuccess({required DateTime checkInTime}) =
      _$_CheckInSuccess;
  const _CheckInSuccess._() : super._();

  DateTime get checkInTime;
  @JsonKey(ignore: true)
  _$CheckInSuccessCopyWith<_CheckInSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}
