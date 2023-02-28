part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.user,
    this.resetPassData,
  });

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(User user)
      : this._(status: AuthenticationStatus.authenticated, user: user);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  const AuthenticationState.resettingPass(ResetPassData resetPassData)
      : this._(status: AuthenticationStatus.resettingPass, resetPassData: resetPassData);

  final AuthenticationStatus status;
  final User? user;
  final ResetPassData? resetPassData;

  @override
  List<Object?> get props => [status, user, resetPassData];
}
