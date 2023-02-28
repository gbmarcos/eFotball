import 'package:fifa/src/authentication/authentication.dart';
import 'package:fifa/src/authentication/authentication_repository.dart';
import 'package:fifa/src/authentication/bloc/authentication_bloc.dart';
import 'package:fifa/src/features/login/login/credentials/credential_repository.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCredentialsRepository extends Mock implements UserCredentialRepository {}

class MockAuthRepository extends Mock implements AuthenticationRepository {}

void main() {
  late AuthenticationRepository authenticationRepository;
  late UserCredentialRepository credentialRepository;
  setUp(() {
    credentialRepository = MockCredentialsRepository();
    authenticationRepository = MockAuthRepository();
  });
  group('AuthenticationBloc', () {
    test('initial state is unknown', () {
      when(() => authenticationRepository.getAppInitialStatus()).thenReturn(AuthenticationStatus.unauthenticated);
      expect(
          AuthenticationBloc(
                  authenticationRepository: authenticationRepository, credentialRepository: credentialRepository)
              .state,
          equals(const AuthenticationState.unknown()));
    });
  });
}
