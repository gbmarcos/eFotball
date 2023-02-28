// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'credential.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserCredential _$UserCredentialFromJson(Map<String, dynamic> json) {
  return _UserCredential.fromJson(json);
}

/// @nodoc
class _$UserCredentialTearOff {
  const _$UserCredentialTearOff();

  _UserCredential call({required String username, required String password}) {
    return _UserCredential(
      username: username,
      password: password,
    );
  }

  UserCredential fromJson(Map<String, Object?> json) {
    return UserCredential.fromJson(json);
  }
}

/// @nodoc
const $UserCredential = _$UserCredentialTearOff();

/// @nodoc
mixin _$UserCredential {
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCredentialCopyWith<UserCredential> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCredentialCopyWith<$Res> {
  factory $UserCredentialCopyWith(
          UserCredential value, $Res Function(UserCredential) then) =
      _$UserCredentialCopyWithImpl<$Res>;
  $Res call({String username, String password});
}

/// @nodoc
class _$UserCredentialCopyWithImpl<$Res>
    implements $UserCredentialCopyWith<$Res> {
  _$UserCredentialCopyWithImpl(this._value, this._then);

  final UserCredential _value;
  // ignore: unused_field
  final $Res Function(UserCredential) _then;

  @override
  $Res call({
    Object? username = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$UserCredentialCopyWith<$Res>
    implements $UserCredentialCopyWith<$Res> {
  factory _$UserCredentialCopyWith(
          _UserCredential value, $Res Function(_UserCredential) then) =
      __$UserCredentialCopyWithImpl<$Res>;
  @override
  $Res call({String username, String password});
}

/// @nodoc
class __$UserCredentialCopyWithImpl<$Res>
    extends _$UserCredentialCopyWithImpl<$Res>
    implements _$UserCredentialCopyWith<$Res> {
  __$UserCredentialCopyWithImpl(
      _UserCredential _value, $Res Function(_UserCredential) _then)
      : super(_value, (v) => _then(v as _UserCredential));

  @override
  _UserCredential get _value => super._value as _UserCredential;

  @override
  $Res call({
    Object? username = freezed,
    Object? password = freezed,
  }) {
    return _then(_UserCredential(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserCredential extends _UserCredential {
  _$_UserCredential({required this.username, required this.password})
      : super._();

  factory _$_UserCredential.fromJson(Map<String, dynamic> json) =>
      _$$_UserCredentialFromJson(json);

  @override
  final String username;
  @override
  final String password;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserCredential &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$UserCredentialCopyWith<_UserCredential> get copyWith =>
      __$UserCredentialCopyWithImpl<_UserCredential>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserCredentialToJson(this);
  }
}

abstract class _UserCredential extends UserCredential {
  factory _UserCredential(
      {required String username, required String password}) = _$_UserCredential;
  _UserCredential._() : super._();

  factory _UserCredential.fromJson(Map<String, dynamic> json) =
      _$_UserCredential.fromJson;

  @override
  String get username;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$UserCredentialCopyWith<_UserCredential> get copyWith =>
      throw _privateConstructorUsedError;
}
