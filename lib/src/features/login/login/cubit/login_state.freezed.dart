// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginState _$LoginStateFromJson(Map<String, dynamic> json) {
  return _LoginState.fromJson(json);
}

/// @nodoc
class _$LoginStateTearOff {
  const _$LoginStateTearOff();

  _LoginState call(
      {required UserCredential formState,
      required List<UserCredential> savedCredentialList,
      bool rememberCredentials = false}) {
    return _LoginState(
      formState: formState,
      savedCredentialList: savedCredentialList,
      rememberCredentials: rememberCredentials,
    );
  }

  LoginState fromJson(Map<String, Object?> json) {
    return LoginState.fromJson(json);
  }
}

/// @nodoc
const $LoginState = _$LoginStateTearOff();

/// @nodoc
mixin _$LoginState {
  UserCredential get formState => throw _privateConstructorUsedError;
  List<UserCredential> get savedCredentialList =>
      throw _privateConstructorUsedError;
  bool get rememberCredentials => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res>;
  $Res call(
      {UserCredential formState,
      List<UserCredential> savedCredentialList,
      bool rememberCredentials});

  $UserCredentialCopyWith<$Res> get formState;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res> implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  final LoginState _value;
  // ignore: unused_field
  final $Res Function(LoginState) _then;

  @override
  $Res call({
    Object? formState = freezed,
    Object? savedCredentialList = freezed,
    Object? rememberCredentials = freezed,
  }) {
    return _then(_value.copyWith(
      formState: formState == freezed
          ? _value.formState
          : formState // ignore: cast_nullable_to_non_nullable
              as UserCredential,
      savedCredentialList: savedCredentialList == freezed
          ? _value.savedCredentialList
          : savedCredentialList // ignore: cast_nullable_to_non_nullable
              as List<UserCredential>,
      rememberCredentials: rememberCredentials == freezed
          ? _value.rememberCredentials
          : rememberCredentials // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $UserCredentialCopyWith<$Res> get formState {
    return $UserCredentialCopyWith<$Res>(_value.formState, (value) {
      return _then(_value.copyWith(formState: value));
    });
  }
}

/// @nodoc
abstract class _$LoginStateCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory _$LoginStateCopyWith(
          _LoginState value, $Res Function(_LoginState) then) =
      __$LoginStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {UserCredential formState,
      List<UserCredential> savedCredentialList,
      bool rememberCredentials});

  @override
  $UserCredentialCopyWith<$Res> get formState;
}

/// @nodoc
class __$LoginStateCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements _$LoginStateCopyWith<$Res> {
  __$LoginStateCopyWithImpl(
      _LoginState _value, $Res Function(_LoginState) _then)
      : super(_value, (v) => _then(v as _LoginState));

  @override
  _LoginState get _value => super._value as _LoginState;

  @override
  $Res call({
    Object? formState = freezed,
    Object? savedCredentialList = freezed,
    Object? rememberCredentials = freezed,
  }) {
    return _then(_LoginState(
      formState: formState == freezed
          ? _value.formState
          : formState // ignore: cast_nullable_to_non_nullable
              as UserCredential,
      savedCredentialList: savedCredentialList == freezed
          ? _value.savedCredentialList
          : savedCredentialList // ignore: cast_nullable_to_non_nullable
              as List<UserCredential>,
      rememberCredentials: rememberCredentials == freezed
          ? _value.rememberCredentials
          : rememberCredentials // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoginState extends _LoginState {
  _$_LoginState(
      {required this.formState,
      required this.savedCredentialList,
      this.rememberCredentials = false})
      : super._();

  factory _$_LoginState.fromJson(Map<String, dynamic> json) =>
      _$$_LoginStateFromJson(json);

  @override
  final UserCredential formState;
  @override
  final List<UserCredential> savedCredentialList;
  @JsonKey()
  @override
  final bool rememberCredentials;

  @override
  String toString() {
    return 'LoginState(formState: $formState, savedCredentialList: $savedCredentialList, rememberCredentials: $rememberCredentials)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginState &&
            const DeepCollectionEquality().equals(other.formState, formState) &&
            const DeepCollectionEquality()
                .equals(other.savedCredentialList, savedCredentialList) &&
            const DeepCollectionEquality()
                .equals(other.rememberCredentials, rememberCredentials));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(formState),
      const DeepCollectionEquality().hash(savedCredentialList),
      const DeepCollectionEquality().hash(rememberCredentials));

  @JsonKey(ignore: true)
  @override
  _$LoginStateCopyWith<_LoginState> get copyWith =>
      __$LoginStateCopyWithImpl<_LoginState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoginStateToJson(this);
  }
}

abstract class _LoginState extends LoginState {
  factory _LoginState(
      {required UserCredential formState,
      required List<UserCredential> savedCredentialList,
      bool rememberCredentials}) = _$_LoginState;
  _LoginState._() : super._();

  factory _LoginState.fromJson(Map<String, dynamic> json) =
      _$_LoginState.fromJson;

  @override
  UserCredential get formState;
  @override
  List<UserCredential> get savedCredentialList;
  @override
  bool get rememberCredentials;
  @override
  @JsonKey(ignore: true)
  _$LoginStateCopyWith<_LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}
