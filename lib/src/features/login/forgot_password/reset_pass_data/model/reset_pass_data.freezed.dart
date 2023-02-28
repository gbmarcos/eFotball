// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reset_pass_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResetPassData _$ResetPassDataFromJson(Map<String, dynamic> json) {
  return _ResetPassData.fromJson(json);
}

/// @nodoc
class _$ResetPassDataTearOff {
  const _$ResetPassDataTearOff();

  _ResetPassData call(
      {required int forgotPasswordID,
      required int userID,
      required String forgotPasswordToken}) {
    return _ResetPassData(
      forgotPasswordID: forgotPasswordID,
      userID: userID,
      forgotPasswordToken: forgotPasswordToken,
    );
  }

  ResetPassData fromJson(Map<String, Object?> json) {
    return ResetPassData.fromJson(json);
  }
}

/// @nodoc
const $ResetPassData = _$ResetPassDataTearOff();

/// @nodoc
mixin _$ResetPassData {
  int get forgotPasswordID => throw _privateConstructorUsedError;
  int get userID => throw _privateConstructorUsedError;
  String get forgotPasswordToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResetPassDataCopyWith<ResetPassData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPassDataCopyWith<$Res> {
  factory $ResetPassDataCopyWith(
          ResetPassData value, $Res Function(ResetPassData) then) =
      _$ResetPassDataCopyWithImpl<$Res>;
  $Res call({int forgotPasswordID, int userID, String forgotPasswordToken});
}

/// @nodoc
class _$ResetPassDataCopyWithImpl<$Res>
    implements $ResetPassDataCopyWith<$Res> {
  _$ResetPassDataCopyWithImpl(this._value, this._then);

  final ResetPassData _value;
  // ignore: unused_field
  final $Res Function(ResetPassData) _then;

  @override
  $Res call({
    Object? forgotPasswordID = freezed,
    Object? userID = freezed,
    Object? forgotPasswordToken = freezed,
  }) {
    return _then(_value.copyWith(
      forgotPasswordID: forgotPasswordID == freezed
          ? _value.forgotPasswordID
          : forgotPasswordID // ignore: cast_nullable_to_non_nullable
              as int,
      userID: userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as int,
      forgotPasswordToken: forgotPasswordToken == freezed
          ? _value.forgotPasswordToken
          : forgotPasswordToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ResetPassDataCopyWith<$Res>
    implements $ResetPassDataCopyWith<$Res> {
  factory _$ResetPassDataCopyWith(
          _ResetPassData value, $Res Function(_ResetPassData) then) =
      __$ResetPassDataCopyWithImpl<$Res>;
  @override
  $Res call({int forgotPasswordID, int userID, String forgotPasswordToken});
}

/// @nodoc
class __$ResetPassDataCopyWithImpl<$Res>
    extends _$ResetPassDataCopyWithImpl<$Res>
    implements _$ResetPassDataCopyWith<$Res> {
  __$ResetPassDataCopyWithImpl(
      _ResetPassData _value, $Res Function(_ResetPassData) _then)
      : super(_value, (v) => _then(v as _ResetPassData));

  @override
  _ResetPassData get _value => super._value as _ResetPassData;

  @override
  $Res call({
    Object? forgotPasswordID = freezed,
    Object? userID = freezed,
    Object? forgotPasswordToken = freezed,
  }) {
    return _then(_ResetPassData(
      forgotPasswordID: forgotPasswordID == freezed
          ? _value.forgotPasswordID
          : forgotPasswordID // ignore: cast_nullable_to_non_nullable
              as int,
      userID: userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as int,
      forgotPasswordToken: forgotPasswordToken == freezed
          ? _value.forgotPasswordToken
          : forgotPasswordToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResetPassData extends _ResetPassData {
  _$_ResetPassData(
      {required this.forgotPasswordID,
      required this.userID,
      required this.forgotPasswordToken})
      : super._();

  factory _$_ResetPassData.fromJson(Map<String, dynamic> json) =>
      _$$_ResetPassDataFromJson(json);

  @override
  final int forgotPasswordID;
  @override
  final int userID;
  @override
  final String forgotPasswordToken;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ResetPassData &&
            const DeepCollectionEquality()
                .equals(other.forgotPasswordID, forgotPasswordID) &&
            const DeepCollectionEquality().equals(other.userID, userID) &&
            const DeepCollectionEquality()
                .equals(other.forgotPasswordToken, forgotPasswordToken));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(forgotPasswordID),
      const DeepCollectionEquality().hash(userID),
      const DeepCollectionEquality().hash(forgotPasswordToken));

  @JsonKey(ignore: true)
  @override
  _$ResetPassDataCopyWith<_ResetPassData> get copyWith =>
      __$ResetPassDataCopyWithImpl<_ResetPassData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResetPassDataToJson(this);
  }
}

abstract class _ResetPassData extends ResetPassData {
  factory _ResetPassData(
      {required int forgotPasswordID,
      required int userID,
      required String forgotPasswordToken}) = _$_ResetPassData;
  _ResetPassData._() : super._();

  factory _ResetPassData.fromJson(Map<String, dynamic> json) =
      _$_ResetPassData.fromJson;

  @override
  int get forgotPasswordID;
  @override
  int get userID;
  @override
  String get forgotPasswordToken;
  @override
  @JsonKey(ignore: true)
  _$ResetPassDataCopyWith<_ResetPassData> get copyWith =>
      throw _privateConstructorUsedError;
}
