// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'signup_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SignupStateTearOff {
  const _$SignupStateTearOff();

  _SignupState call(
      {required DateTime formDate,
      required SignupModel model,
      SignupErrors? errors,
      bool areTermsAccepted = false,
      Console selectedConsole = Console.playstation,
      SignUpProgress progress = SignUpProgress.step1}) {
    return _SignupState(
      formDate: formDate,
      model: model,
      errors: errors,
      areTermsAccepted: areTermsAccepted,
      selectedConsole: selectedConsole,
      progress: progress,
    );
  }
}

/// @nodoc
const $SignupState = _$SignupStateTearOff();

/// @nodoc
mixin _$SignupState {
  DateTime get formDate => throw _privateConstructorUsedError;
  SignupModel get model => throw _privateConstructorUsedError;
  SignupErrors? get errors => throw _privateConstructorUsedError;
  bool get areTermsAccepted => throw _privateConstructorUsedError;
  Console get selectedConsole => throw _privateConstructorUsedError;
  SignUpProgress get progress => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignupStateCopyWith<SignupState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupStateCopyWith<$Res> {
  factory $SignupStateCopyWith(
          SignupState value, $Res Function(SignupState) then) =
      _$SignupStateCopyWithImpl<$Res>;
  $Res call(
      {DateTime formDate,
      SignupModel model,
      SignupErrors? errors,
      bool areTermsAccepted,
      Console selectedConsole,
      SignUpProgress progress});

  $SignupModelCopyWith<$Res> get model;
  $SignupErrorsCopyWith<$Res>? get errors;
}

/// @nodoc
class _$SignupStateCopyWithImpl<$Res> implements $SignupStateCopyWith<$Res> {
  _$SignupStateCopyWithImpl(this._value, this._then);

  final SignupState _value;
  // ignore: unused_field
  final $Res Function(SignupState) _then;

  @override
  $Res call({
    Object? formDate = freezed,
    Object? model = freezed,
    Object? errors = freezed,
    Object? areTermsAccepted = freezed,
    Object? selectedConsole = freezed,
    Object? progress = freezed,
  }) {
    return _then(_value.copyWith(
      formDate: formDate == freezed
          ? _value.formDate
          : formDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as SignupModel,
      errors: errors == freezed
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as SignupErrors?,
      areTermsAccepted: areTermsAccepted == freezed
          ? _value.areTermsAccepted
          : areTermsAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedConsole: selectedConsole == freezed
          ? _value.selectedConsole
          : selectedConsole // ignore: cast_nullable_to_non_nullable
              as Console,
      progress: progress == freezed
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as SignUpProgress,
    ));
  }

  @override
  $SignupModelCopyWith<$Res> get model {
    return $SignupModelCopyWith<$Res>(_value.model, (value) {
      return _then(_value.copyWith(model: value));
    });
  }

  @override
  $SignupErrorsCopyWith<$Res>? get errors {
    if (_value.errors == null) {
      return null;
    }

    return $SignupErrorsCopyWith<$Res>(_value.errors!, (value) {
      return _then(_value.copyWith(errors: value));
    });
  }
}

/// @nodoc
abstract class _$SignupStateCopyWith<$Res>
    implements $SignupStateCopyWith<$Res> {
  factory _$SignupStateCopyWith(
          _SignupState value, $Res Function(_SignupState) then) =
      __$SignupStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime formDate,
      SignupModel model,
      SignupErrors? errors,
      bool areTermsAccepted,
      Console selectedConsole,
      SignUpProgress progress});

  @override
  $SignupModelCopyWith<$Res> get model;
  @override
  $SignupErrorsCopyWith<$Res>? get errors;
}

/// @nodoc
class __$SignupStateCopyWithImpl<$Res> extends _$SignupStateCopyWithImpl<$Res>
    implements _$SignupStateCopyWith<$Res> {
  __$SignupStateCopyWithImpl(
      _SignupState _value, $Res Function(_SignupState) _then)
      : super(_value, (v) => _then(v as _SignupState));

  @override
  _SignupState get _value => super._value as _SignupState;

  @override
  $Res call({
    Object? formDate = freezed,
    Object? model = freezed,
    Object? errors = freezed,
    Object? areTermsAccepted = freezed,
    Object? selectedConsole = freezed,
    Object? progress = freezed,
  }) {
    return _then(_SignupState(
      formDate: formDate == freezed
          ? _value.formDate
          : formDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as SignupModel,
      errors: errors == freezed
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as SignupErrors?,
      areTermsAccepted: areTermsAccepted == freezed
          ? _value.areTermsAccepted
          : areTermsAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedConsole: selectedConsole == freezed
          ? _value.selectedConsole
          : selectedConsole // ignore: cast_nullable_to_non_nullable
              as Console,
      progress: progress == freezed
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as SignUpProgress,
    ));
  }
}

/// @nodoc

class _$_SignupState implements _SignupState {
  _$_SignupState(
      {required this.formDate,
      required this.model,
      this.errors,
      this.areTermsAccepted = false,
      this.selectedConsole = Console.playstation,
      this.progress = SignUpProgress.step1});

  @override
  final DateTime formDate;
  @override
  final SignupModel model;
  @override
  final SignupErrors? errors;
  @JsonKey()
  @override
  final bool areTermsAccepted;
  @JsonKey()
  @override
  final Console selectedConsole;
  @JsonKey()
  @override
  final SignUpProgress progress;

  @override
  String toString() {
    return 'SignupState(formDate: $formDate, model: $model, errors: $errors, areTermsAccepted: $areTermsAccepted, selectedConsole: $selectedConsole, progress: $progress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignupState &&
            const DeepCollectionEquality().equals(other.formDate, formDate) &&
            const DeepCollectionEquality().equals(other.model, model) &&
            const DeepCollectionEquality().equals(other.errors, errors) &&
            const DeepCollectionEquality()
                .equals(other.areTermsAccepted, areTermsAccepted) &&
            const DeepCollectionEquality()
                .equals(other.selectedConsole, selectedConsole) &&
            const DeepCollectionEquality().equals(other.progress, progress));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(formDate),
      const DeepCollectionEquality().hash(model),
      const DeepCollectionEquality().hash(errors),
      const DeepCollectionEquality().hash(areTermsAccepted),
      const DeepCollectionEquality().hash(selectedConsole),
      const DeepCollectionEquality().hash(progress));

  @JsonKey(ignore: true)
  @override
  _$SignupStateCopyWith<_SignupState> get copyWith =>
      __$SignupStateCopyWithImpl<_SignupState>(this, _$identity);
}

abstract class _SignupState implements SignupState {
  factory _SignupState(
      {required DateTime formDate,
      required SignupModel model,
      SignupErrors? errors,
      bool areTermsAccepted,
      Console selectedConsole,
      SignUpProgress progress}) = _$_SignupState;

  @override
  DateTime get formDate;
  @override
  SignupModel get model;
  @override
  SignupErrors? get errors;
  @override
  bool get areTermsAccepted;
  @override
  Console get selectedConsole;
  @override
  SignUpProgress get progress;
  @override
  @JsonKey(ignore: true)
  _$SignupStateCopyWith<_SignupState> get copyWith =>
      throw _privateConstructorUsedError;
}
