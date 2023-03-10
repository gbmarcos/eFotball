// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'exceptions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NetworkExceptionTearOff {
  const _$NetworkExceptionTearOff();

  ServerException call(
      {required String message,
      int? statusCode,
      Object? response,
      StackTrace? stackTrace}) {
    return ServerException(
      message: message,
      statusCode: statusCode,
      response: response,
      stackTrace: stackTrace,
    );
  }

  NoDataException noDataException() {
    return const NoDataException();
  }
}

/// @nodoc
const $NetworkException = _$NetworkExceptionTearOff();

/// @nodoc
mixin _$NetworkException {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String message, int? statusCode, Object? response,
            StackTrace? stackTrace)
        $default, {
    required TResult Function() noDataException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(String message, int? statusCode, Object? response,
            StackTrace? stackTrace)?
        $default, {
    TResult Function()? noDataException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String message, int? statusCode, Object? response,
            StackTrace? stackTrace)?
        $default, {
    TResult Function()? noDataException,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(ServerException value) $default, {
    required TResult Function(NoDataException value) noDataException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(ServerException value)? $default, {
    TResult Function(NoDataException value)? noDataException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(ServerException value)? $default, {
    TResult Function(NoDataException value)? noDataException,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkExceptionCopyWith<$Res> {
  factory $NetworkExceptionCopyWith(
          NetworkException value, $Res Function(NetworkException) then) =
      _$NetworkExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class _$NetworkExceptionCopyWithImpl<$Res>
    implements $NetworkExceptionCopyWith<$Res> {
  _$NetworkExceptionCopyWithImpl(this._value, this._then);

  final NetworkException _value;
  // ignore: unused_field
  final $Res Function(NetworkException) _then;
}

/// @nodoc
abstract class $ServerExceptionCopyWith<$Res> {
  factory $ServerExceptionCopyWith(
          ServerException value, $Res Function(ServerException) then) =
      _$ServerExceptionCopyWithImpl<$Res>;
  $Res call(
      {String message,
      int? statusCode,
      Object? response,
      StackTrace? stackTrace});
}

/// @nodoc
class _$ServerExceptionCopyWithImpl<$Res>
    extends _$NetworkExceptionCopyWithImpl<$Res>
    implements $ServerExceptionCopyWith<$Res> {
  _$ServerExceptionCopyWithImpl(
      ServerException _value, $Res Function(ServerException) _then)
      : super(_value, (v) => _then(v as ServerException));

  @override
  ServerException get _value => super._value as ServerException;

  @override
  $Res call({
    Object? message = freezed,
    Object? statusCode = freezed,
    Object? response = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(ServerException(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      response: response == freezed ? _value.response : response,
      stackTrace: stackTrace == freezed
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$ServerException extends ServerException {
  const _$ServerException(
      {required this.message, this.statusCode, this.response, this.stackTrace})
      : super._();

  @override
  final String message;
  @override
  final int? statusCode;
  @override
  final Object? response;
  @override
  final StackTrace? stackTrace;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServerException &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality()
                .equals(other.statusCode, statusCode) &&
            const DeepCollectionEquality().equals(other.response, response) &&
            const DeepCollectionEquality()
                .equals(other.stackTrace, stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(statusCode),
      const DeepCollectionEquality().hash(response),
      const DeepCollectionEquality().hash(stackTrace));

  @JsonKey(ignore: true)
  @override
  $ServerExceptionCopyWith<ServerException> get copyWith =>
      _$ServerExceptionCopyWithImpl<ServerException>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String message, int? statusCode, Object? response,
            StackTrace? stackTrace)
        $default, {
    required TResult Function() noDataException,
  }) {
    return $default(message, statusCode, response, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(String message, int? statusCode, Object? response,
            StackTrace? stackTrace)?
        $default, {
    TResult Function()? noDataException,
  }) {
    return $default?.call(message, statusCode, response, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String message, int? statusCode, Object? response,
            StackTrace? stackTrace)?
        $default, {
    TResult Function()? noDataException,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(message, statusCode, response, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(ServerException value) $default, {
    required TResult Function(NoDataException value) noDataException,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(ServerException value)? $default, {
    TResult Function(NoDataException value)? noDataException,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(ServerException value)? $default, {
    TResult Function(NoDataException value)? noDataException,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class ServerException extends NetworkException {
  const factory ServerException(
      {required String message,
      int? statusCode,
      Object? response,
      StackTrace? stackTrace}) = _$ServerException;
  const ServerException._() : super._();

  String get message;
  int? get statusCode;
  Object? get response;
  StackTrace? get stackTrace;
  @JsonKey(ignore: true)
  $ServerExceptionCopyWith<ServerException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoDataExceptionCopyWith<$Res> {
  factory $NoDataExceptionCopyWith(
          NoDataException value, $Res Function(NoDataException) then) =
      _$NoDataExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class _$NoDataExceptionCopyWithImpl<$Res>
    extends _$NetworkExceptionCopyWithImpl<$Res>
    implements $NoDataExceptionCopyWith<$Res> {
  _$NoDataExceptionCopyWithImpl(
      NoDataException _value, $Res Function(NoDataException) _then)
      : super(_value, (v) => _then(v as NoDataException));

  @override
  NoDataException get _value => super._value as NoDataException;
}

/// @nodoc

class _$NoDataException extends NoDataException {
  const _$NoDataException() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NoDataException);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String message, int? statusCode, Object? response,
            StackTrace? stackTrace)
        $default, {
    required TResult Function() noDataException,
  }) {
    return noDataException();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(String message, int? statusCode, Object? response,
            StackTrace? stackTrace)?
        $default, {
    TResult Function()? noDataException,
  }) {
    return noDataException?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String message, int? statusCode, Object? response,
            StackTrace? stackTrace)?
        $default, {
    TResult Function()? noDataException,
    required TResult orElse(),
  }) {
    if (noDataException != null) {
      return noDataException();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(ServerException value) $default, {
    required TResult Function(NoDataException value) noDataException,
  }) {
    return noDataException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(ServerException value)? $default, {
    TResult Function(NoDataException value)? noDataException,
  }) {
    return noDataException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(ServerException value)? $default, {
    TResult Function(NoDataException value)? noDataException,
    required TResult orElse(),
  }) {
    if (noDataException != null) {
      return noDataException(this);
    }
    return orElse();
  }
}

abstract class NoDataException extends NetworkException {
  const factory NoDataException() = _$NoDataException;
  const NoDataException._() : super._();
}

/// @nodoc
class _$StreamsHavingNullUrlExceptionTearOff {
  const _$StreamsHavingNullUrlExceptionTearOff();

  StreamsException call({List<int>? streamIds}) {
    return StreamsException(
      streamIds: streamIds,
    );
  }
}

/// @nodoc
const $StreamsHavingNullUrlException = _$StreamsHavingNullUrlExceptionTearOff();

/// @nodoc
mixin _$StreamsHavingNullUrlException {
  List<int>? get streamIds => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StreamsHavingNullUrlExceptionCopyWith<StreamsHavingNullUrlException>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StreamsHavingNullUrlExceptionCopyWith<$Res> {
  factory $StreamsHavingNullUrlExceptionCopyWith(
          StreamsHavingNullUrlException value,
          $Res Function(StreamsHavingNullUrlException) then) =
      _$StreamsHavingNullUrlExceptionCopyWithImpl<$Res>;
  $Res call({List<int>? streamIds});
}

/// @nodoc
class _$StreamsHavingNullUrlExceptionCopyWithImpl<$Res>
    implements $StreamsHavingNullUrlExceptionCopyWith<$Res> {
  _$StreamsHavingNullUrlExceptionCopyWithImpl(this._value, this._then);

  final StreamsHavingNullUrlException _value;
  // ignore: unused_field
  final $Res Function(StreamsHavingNullUrlException) _then;

  @override
  $Res call({
    Object? streamIds = freezed,
  }) {
    return _then(_value.copyWith(
      streamIds: streamIds == freezed
          ? _value.streamIds
          : streamIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc
abstract class $StreamsExceptionCopyWith<$Res>
    implements $StreamsHavingNullUrlExceptionCopyWith<$Res> {
  factory $StreamsExceptionCopyWith(
          StreamsException value, $Res Function(StreamsException) then) =
      _$StreamsExceptionCopyWithImpl<$Res>;
  @override
  $Res call({List<int>? streamIds});
}

/// @nodoc
class _$StreamsExceptionCopyWithImpl<$Res>
    extends _$StreamsHavingNullUrlExceptionCopyWithImpl<$Res>
    implements $StreamsExceptionCopyWith<$Res> {
  _$StreamsExceptionCopyWithImpl(
      StreamsException _value, $Res Function(StreamsException) _then)
      : super(_value, (v) => _then(v as StreamsException));

  @override
  StreamsException get _value => super._value as StreamsException;

  @override
  $Res call({
    Object? streamIds = freezed,
  }) {
    return _then(StreamsException(
      streamIds: streamIds == freezed
          ? _value.streamIds
          : streamIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc

class _$StreamsException extends StreamsException {
  const _$StreamsException({this.streamIds}) : super._();

  @override
  final List<int>? streamIds;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StreamsException &&
            const DeepCollectionEquality().equals(other.streamIds, streamIds));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(streamIds));

  @JsonKey(ignore: true)
  @override
  $StreamsExceptionCopyWith<StreamsException> get copyWith =>
      _$StreamsExceptionCopyWithImpl<StreamsException>(this, _$identity);
}

abstract class StreamsException extends StreamsHavingNullUrlException {
  const factory StreamsException({List<int>? streamIds}) = _$StreamsException;
  const StreamsException._() : super._();

  @override
  List<int>? get streamIds;
  @override
  @JsonKey(ignore: true)
  $StreamsExceptionCopyWith<StreamsException> get copyWith =>
      throw _privateConstructorUsedError;
}
