
import 'package:fifa/src/features/login/login/credentials/model/credential.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';
part 'login_state.g.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    required UserCredential formState,
    required List<UserCredential> savedCredentialList,
    @Default(false) bool rememberCredentials,
  }) = _LoginState;

  const LoginState._();

  factory LoginState.fromJson(Map<String, dynamic> map) => _$LoginStateFromJson(map);
}
