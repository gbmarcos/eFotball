import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_model.freezed.dart';
part 'error_model.g.dart';

@freezed
class SignupErrors with _$SignupErrors {
  factory SignupErrors({
    String? emailError,
    String? usernameError,
  }) = _SignupErrors;

  const SignupErrors._();

  factory SignupErrors.fromJson(Map<String, dynamic> map) => _$SignupErrorsFromJson(map);

  @override
  String toString() {
    return 'SignupErrors Username error = $usernameError, Email Error = $emailError';
  }
}
