import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fifa/r.dart';
import 'package:fifa/src/authentication/authentication_repository.dart';
import 'package:fifa/src/common/domain/user/user.dart';
import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/common/services/deep_linking.dart' as deep_link;
import 'package:fifa/src/features/login/forgot_password/reset_pass_data/model/reset_pass_data.dart';
import 'package:fifa/src/features/login/login/credentials/credential_repository.dart';
import 'package:fifa/src/features/login/login/credentials/model/credential.dart';
import 'package:fpdart/fpdart.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required AuthenticationRepository authenticationRepository,
    required UserCredentialRepository credentialRepository,
  })  : _authenticationRepository = authenticationRepository,
        _credentialRepository = credentialRepository,
        super(const AuthenticationState.unknown());

  final AuthenticationRepository _authenticationRepository;
  final UserCredentialRepository _credentialRepository;

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AuthenticationLogoutRequested) {
      await _logOut();
    } else {
      yield _mapAuthenticationStatusChangedToState(event);
    }
  }

  AuthenticationState _mapAuthenticationStatusChangedToState(
    AuthenticationEvent event,
  ) {
    if (event is AuthenticationResetPasswordRequested) {
      final resetPassData = ResetPassData.tryParse(event.link);
      return resetPassData != null
          ? AuthenticationState.resettingPass(resetPassData)
          : const AuthenticationState.unauthenticated();
    }

    switch ((event as AuthenticationStatusChanged).status) {
      case AuthenticationStatus.unauthenticated:
        return const AuthenticationState.unauthenticated();

      case AuthenticationStatus.authenticated:
        final user = event.user;
        print('user is $user, ${user?.lobbyCheckIn},  at auth bloc');
        if (user == null) {
          _authenticationRepository.logout();
          return const AuthenticationState.unauthenticated();
        } else {
          return AuthenticationState.authenticated(user);
        }

      default:
        return const AuthenticationState.unknown();
    }
  }

  Future<void> getAppAuthenticationState() async {
    final initialStatus = _authenticationRepository.getAppInitialStatus();

    const changeToUnauthenticatedEvent = AuthenticationStatusChanged(
      AuthenticationStatus.unauthenticated,
    );

    switch (initialStatus) {
      case AuthenticationStatus.unauthenticated:
        {
          if (!Device.isDesktopDevice) {
            //if is not a desktop device try get initial deep link to reset password

            final initialLink = await deep_link.getInitialExternalAndValidLink();
            final newEvent = initialLink != null
                ? AuthenticationResetPasswordRequested(initialLink)
                : AuthenticationStatusChanged(initialStatus);
            add(newEvent);
          } else {
            add(changeToUnauthenticatedEvent);
          }
        }
        break;
      case AuthenticationStatus.authenticated:
        {
          //if initial authentication status is authenticated try auto login to get user data

          final userCredential = _authenticationRepository.getLoggedUser();

          if (userCredential != null) {
            final loginResponse = await logIn(userCredential: userCredential);

            await loginResponse.fold(
              (error) async {
                await _authenticationRepository.logout();
              },
              (user) async {},
            );
          } else {
            await _authenticationRepository.logout();
            add(changeToUnauthenticatedEvent);
          }
        }
        break;

      default:
        add(changeToUnauthenticatedEvent);
    }
  }

  Future<Either<NetworkException, User>> logIn({
    required UserCredential userCredential,
    bool saveCredential = false,
  }) async {
    final loginResponse = await _authenticationRepository.login(
      userCredential: userCredential,
    );

    final user = await loginResponse.fold<Future<User?>>(
      (error) async {},
      (user) async {
        if (saveCredential) {
          await _credentialRepository.addCredential(userCredential);
        }
        return user;
      },
    );

    //try to change to authenticated state
    add(AuthenticationStatusChanged(AuthenticationStatus.authenticated, user));
    return loginResponse;
  }

  Future<void> goToResetPass(String? incomingLink) async {
    if (deep_link.isLinkValid(incomingLink)) {
      add(const AuthenticationStatusChanged(AuthenticationStatus.resettingPass));
      add(AuthenticationResetPasswordRequested(incomingLink!));
    }
  }

  Future<void> _logOut() async {
    await _authenticationRepository.logout();
    add(const AuthenticationStatusChanged(AuthenticationStatus.unauthenticated));
  }
}

abstract class FutureApi {
  /// Completes the password reset process, given a confirmation code and new
  /// password.
  ///
  /// A [AuthException] maybe thrown with the following error code:
  /// - **expired-action-code**:
  ///  - Thrown if the action code has expired.
  /// - **invalid-action-code**:
  ///  - Thrown if the action code is invalid. This can happen if the code is
  ///    malformed or has already been used.
  /// - **user-disabled**:
  ///  - Thrown if the user corresponding to the given action code has been
  ///    disabled.
  /// - **user-not-found**:
  ///  - Thrown if there is no user corresponding to the action code. This may
  ///    have happened if the user was deleted between when the action code was
  ///    issued and when this method was called.
  /// - **weak-password**:
  ///  - Thrown if the new password is not strong enough.
  Future<void> confirmPasswordReset({
    required String code,
    required String newPassword,
  });

  /// Tries to create a new user account with the given email address and
  /// password.
  ///
  /// A [AuthException] maybe thrown with the following error code:
  /// - **email-already-in-use**:
  ///  - Thrown if there already exists an account with the given email address.
  /// - **invalid-email**:
  ///  - Thrown if the email address is not valid.
  /// - **operation-not-allowed**:
  ///  - Thrown if email/password accounts are not enabled. Enable
  ///    email/password accounts in the Firebase Console, under the Auth tab.
  /// - **weak-password**:
  ///  - Thrown if the password is not strong enough.
  Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Notifies about changes to the user's sign-in state (such as sign-in or
  /// sign-out)
  Stream<User?> authStateChanges();

  /// Notifies about changes to any user updates.
  ///
  /// This is a superset of both [authStateChanges] and [idTokenChanges]. It
  /// provides events on all user changes, such as when credentials are linked,
  /// unlinked and when updates to the user profile are made. The purpose of
  /// this Stream is for listening to realtime updates to the user state
  /// (signed-in, signed-out, different user & token refresh) without
  /// manually having to call [reload] and then rehydrating changes to your
  /// application.
  Stream<User?> userChanges();

  /// Sends a password reset email to the given email address.
  ///
  /// To complete the password reset, call [confirmPasswordReset] with the code supplied
  /// in the email sent to the user, along with the new password specified by the user.
  ///
  /// May throw a [AuthException] with the following error codes:
  ///
  /// - **auth/invalid-email**\
  ///   Thrown if the email address is not valid.
  /// - **auth/missing-android-pkg-name**\
  ///   An Android package name must be provided if the Android app is required to be installed.
  /// - **auth/missing-continue-uri**\
  ///   A continue URL must be provided in the request.
  /// - **auth/missing-ios-bundle-id**\
  ///   An iOS Bundle ID must be provided if an App Store ID is provided.
  /// - **auth/invalid-continue-uri**\
  ///   The continue URL provided in the request is invalid.
  /// - **auth/unauthorized-continue-uri**\
  ///   The domain of the continue URL is not whitelisted. Whitelist the domain in the Firebase console.
  /// - **auth/user-not-found**\
  ///   Thrown if there is no user corresponding to the email address.
  Future<void> sendPasswordResetEmail({
    required String email,
  });

  /// Attempts to sign in a user with the given email address and password.
  ///
  /// If successful, it also signs the user in into the app and updates
  /// any [authStateChanges], [idTokenChanges] or [userChanges] stream
  /// listeners.
  ///
  /// **Important**: You must enable Email & Password accounts in the Auth
  /// section of the Firebase console before being able to use them.
  ///
  /// A [AuthException] maybe thrown with the following error code:
  /// - **invalid-email**:
  ///  - Thrown if the email address is not valid.
  /// - **user-disabled**:
  ///  - Thrown if the user corresponding to the given email has been disabled.
  /// - **user-not-found**:
  ///  - Thrown if there is no user corresponding to the given email.
  /// - **wrong-password**:
  ///  - Thrown if the password is invalid for the given email, or the account
  ///    corresponding to the email does not have a password set.
  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Signs out the current user.
  ///
  /// If successful, it also updates
  /// any [authStateChanges], [idTokenChanges] or [userChanges] stream
  /// listeners.
  Future<void> signOut();
}

class AuthException implements Exception {
  final String errorCode;

  AuthException(this.errorCode);
}
