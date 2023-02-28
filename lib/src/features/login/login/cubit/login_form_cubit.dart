import 'package:fifa/src/features/login/login/credentials/credential_repository.dart';
import 'package:fifa/src/features/login/login/credentials/model/credential.dart';
import 'package:fifa/src/features/login/login/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginFormCubit extends Cubit<LoginState> {
  final UserCredentialRepository _credentialRepository;

  LoginFormCubit({
    LoginState? initialState,
    required UserCredentialRepository credentialRepository,
  })  : _credentialRepository = credentialRepository,
        super(initialState ??
            LoginState(
                formState: UserCredential(username: '', password: ''),
                savedCredentialList: credentialRepository.getCredentials()));

  List<UserCredential> get savedCredentialList {
    state.copyWith(savedCredentialList: _credentialRepository.getCredentials());
    return state.savedCredentialList;
  }

  bool get rememberCredentials => state.rememberCredentials;

  void updateCredentials(UserCredential userCredential) {
    emit(state.copyWith(formState: userCredential));
  }

  void toggleRememberCredentials([bool? remember]) {
    emit(state.copyWith(rememberCredentials: remember ?? !state.rememberCredentials));
  }
}
