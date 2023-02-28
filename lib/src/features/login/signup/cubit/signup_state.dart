import 'package:fifa/src/common/domain/user/user.dart';
import 'package:fifa/src/features/login/signup/models/error_model.dart';
import 'package:fifa/src/features/login/signup/models/signup_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.freezed.dart';

enum SignUpProgress {
  step1,
  step2,
}

@freezed
class SignupState with _$SignupState {
  factory SignupState({
    required DateTime formDate,
    required SignupModel model,
    SignupErrors? errors,
    @Default(false) bool areTermsAccepted,
    @Default(Console.playstation) Console selectedConsole,
    @Default(SignUpProgress.step1) SignUpProgress progress,
  }) = _SignupState;
}
