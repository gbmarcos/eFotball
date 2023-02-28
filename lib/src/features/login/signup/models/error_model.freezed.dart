// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'error_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignupErrors _$SignupErrorsFromJson(Map<String, dynamic> json) {
  return _SignupErrors.fromJson(json);
}

/// @nodoc
class _$SignupErrorsTearOff {
  const _$SignupErrorsTearOff();

  _SignupErrors call({String? emailError, String? usernameError}) {
    return _SignupErrors(
      emailError: emailError,
      usernameError: usernameError,
    );
  }

  SignupErrors fromJson(Map<String, Object?> json) {
    return SignupErrors.fromJson(json);
  }
}

/// @nodoc
const $SignupErrors = _$SignupErrorsTearOff();

/// @nodoc
mixin _$SignupErrors {
  String? get emailError => throw _privateConstructorUsedError;
  String? get usernameError => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignupErrorsCopyWith<SignupErrors> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupErrorsCopyWith<$Res> {
  factory $SignupErrorsCopyWith(
          SignupErrors value, $Res Function(SignupErrors) then) =
      _$SignupErrorsCopyWithImpl<$Res>;
  $Res call({String? emailError, String? usernameError});
}

/// @nodoc
class _$SignupErrorsCopyWithImpl<$Res> implements $SignupErrorsCopyWith<$Res> {
  _$SignupErrorsCopyWithImpl(this._value, this._then);

  final SignupErrors _value;
  // ignore: unused_field
  final $Res Function(SignupErrors) _then;

  @override
  $Res call({
    Object? emailError = freezed,
    Object? usernameError = freezed,
  }) {
    return _then(_value.copyWith(
      emailError: emailError == freezed
          ? _value.emailError
          : emailError // ignore: cast_nullable_to_non_nullable
              as String?,
      usernameError: usernameError == freezed
          ? _value.usernameError
          : usernameError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$SignupErrorsCopyWith<$Res>
    implements $SignupErrorsCopyWith<$Res> {
  factory _$SignupErrorsCopyWith(
          _SignupErrors value, $Res Function(_SignupErrors) then) =
      __$SignupErrorsCopyWithImpl<$Res>;
  @override
  $Res call({String? emailError, String? usernameError});
}

/// @nodoc
class __$SignupErrorsCopyWithImpl<$Res> extends _$SignupErrorsCopyWithImpl<$Res>
    implements _$SignupErrorsCopyWith<$Res> {
  __$SignupErrorsCopyWithImpl(
      _SignupErrors _value, $Res Function(_SignupErrors) _then)
      : super(_value, (v) => _then(v as _SignupErrors));

  @override
  _SignupErrors get _value => super._value as _SignupErrors;

  @override
  $Res call({
    Object? emailError = freezed,
    Object? usernameError = freezed,
  }) {
    return _then(_SignupErrors(
      emailError: emailError == freezed
          ? _value.emailError
          : emailError // ignore: cast_nullable_to_non_nullable
              as String?,
      usernameError: usernameError == freezed
          ? _value.usernameError
          : usernameError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SignupErrors extends _SignupErrors {
  _$_SignupErrors({this.emailError, this.usernameError}) : super._();

  factory _$_SignupErrors.fromJson(Map<String, dynamic> json) =>
      _$$_SignupErrorsFromJson(json);

  @override
  final String? emailError;
  @override
  final String? usernameError;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignupErrors &&
            const DeepCollectionEquality()
                .equals(other.emailError, emailError) &&
            const DeepCollectionEquality()
                .equals(other.usernameError, usernameError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(emailError),
      const DeepCollectionEquality().hash(usernameError));

  @JsonKey(ignore: true)
  @override
  _$SignupErrorsCopyWith<_SignupErrors> get copyWith =>
      __$SignupErrorsCopyWithImpl<_SignupErrors>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SignupErrorsToJson(this);
  }
}

abstract class _SignupErrors extends SignupErrors {
  factory _SignupErrors({String? emailError, String? usernameError}) =
      _$_SignupErrors;
  _SignupErrors._() : super._();

  factory _SignupErrors.fromJson(Map<String, dynamic> json) =
      _$_SignupErrors.fromJson;

  @override
  String? get emailError;
  @override
  String? get usernameError;
  @override
  @JsonKey(ignore: true)
  _$SignupErrorsCopyWith<_SignupErrors> get copyWith =>
      throw _privateConstructorUsedError;
}
