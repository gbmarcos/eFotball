import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:fifa/r.dart';
import 'package:fifa/src/common/data/network_service.dart';
import 'package:fifa/src/common/domain/user/user.dart';
import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/features/login/forgot_password/reset_pass_data/model/reset_pass_data.dart';
import 'package:fifa/src/features/login/login/credentials/model/credential.dart';
import 'package:fifa/src/features/login/signup/models/signup_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated, resettingPass }

class AuthenticationRepository {
  static const authHiveBoxName = 'authenticationBox';
  static const authHiveKey = 'authenticationStatus';
  static const loggedUserHiveBoxName = 'loggedUserCredentialBox';
  static const loggedUserHiveKey = 'loggedUserCredential';

  final NetworkService _client;

  AuthenticationRepository({required NetworkService client}) : _client = client;

  AuthenticationStatus getAppInitialStatus() {
    try {
      final authBox = R.hiveBoxes.authenticationStatus;
      //get initial authentication status
      return authBox.get(
            authHiveKey,
            defaultValue: AuthenticationStatus.unauthenticated,
          ) ??
          AuthenticationStatus.unauthenticated;
    } catch (e) {
      log('Error opening hiveBox [${AuthenticationRepository.authHiveBoxName}]  e=$e');
      return AuthenticationStatus.unauthenticated;
    }
  }

  UserCredential? getLoggedUser() {
    try {
      return R.hiveBoxes.loggedUser.get(
        loggedUserHiveKey,
        defaultValue: null,
      );
    } catch (e) {
      Sentry.captureException(HiveException(message: e.toString()));
    }
  }

  Future<void> addLoggedUser(UserCredential userCredential) async {
    try {
      return R.hiveBoxes.loggedUser.put(
        loggedUserHiveKey,
        userCredential,
      );
    } catch (e) {
      await Sentry.captureException(HiveException(message: e.toString()));
    }
  }

  Future<void> removeLoggedUser() async {
    try {
      return R.hiveBoxes.loggedUser.delete(loggedUserHiveKey);
    } catch (e) {
      await Sentry.captureException(HiveException(message: e.toString()));
    }
  }

  Future<Either<NetworkException, User>> login({
    required UserCredential userCredential,
  }) async {
    final data = {
      'username': userCredential.username,
      'password': userCredential.password,
    };

    final response = await _client.postForm(R.apiEndPoints.login, body: data);

    final loginResponse = response.map<User>(
      (dynamic userData) => User.fromJson(userData as Map<String, dynamic>),
    );

    await loginResponse.fold((error) async {}, (user) async {
      await addLoggedUser(userCredential);
    });

    return loginResponse;
  }

  Future<void> logout() async {
    await removeLoggedUser();
  }

  Future<Either<NetworkException, void>> resetPassword({
    required ResetPassData resetData,
    required String password,
  }) async {
    log('resetting pass with $resetData');

    final data = {
      'id': resetData.forgotPasswordID,
      'uid': resetData.userID,
      'token': resetData.forgotPasswordToken,
      'password': password,
    };

    final response = await _client.postForm(R.apiEndPoints.resetPassword, body: data);

    return response.map((dynamic a) {});
  }

  Future<Either<NetworkException, void>> sendEmailToResetPass({
    required String username,
    required String email,
  }) async {
    final data = {
      'username': username,
      'email': email,
    };

    final response = await _client.postForm(R.apiEndPoints.forgotPassword, body: data);

    return response.map((dynamic a) {});
  }

  Future<Either<NetworkException, void>> signUp({required SignupModel signupData}) async {
    final response = await _client.postForm(
      R.apiEndPoints.signup,
      body: signupData.toJson(),
    );

    return response.map((dynamic a) {});
  }
}

/// Authentication repository which yields an User with lobbyCheckin and notifications for development purposes.
class FakeAuthenticationRepository extends AuthenticationRepository with ExtensionsMixin {
  @Deprecated('Do not use in production')
  FakeAuthenticationRepository({required NetworkService client}) : super(client: client);

  @override
  UserCredential? getLoggedUser() => UserCredential(username: 'username', password: 'password');

  @override
  Future<Either<NetworkException, User>> login({required UserCredential userCredential}) async {
    return Right<NetworkException, User>(mockUser);
  }
}

void setMockUserWithoutLobby() {
  mockUser = mockUser.copyWith(lobbyCheckIn: null);
}

var mockUser = User.fromJson(jsonDecode('''
    {
    "id": 67,
    "username": "fabian",
    "avatar": "7qPgpa9e7Hs_xA.jpg",
    "country_id": 231,
    "flags": 6,
    "console": 0,
    "token": "wkcgooxG-PGm",
    "permissions": 4095,
    "first_name": "Fabian",
    "last_name": "Quintanar",
    "email": "fabian@doctype.se",
    "birth_year": null,
    "birth_month": null,
    "birth_day": null,
    "gender": null,
    "friends": null,
    "friend_requests": null,
    "sent_friend_requests": null,
    "notifications": [
        {
            "id": 830,
            "type": 3,
            "from_user": null,
            "data": {
                "id": 151,
                "tournament": {
                    "id": 219,
                    "name": "Test Flutter Tournament",
                    "logo": "nF-yLMwJRklOaw.png",
                    "banner": null,
                    "flags": 33
                },
                "user1": {
                    "id": 90,
                    "username": "fabian2",
                    "avatar": null,
                    "country_id": 231,
                    "flags": 0,
                    "console": 0
                },
                "user2": {
                    "id": 67,
                    "username": "fabian",
                    "avatar": "7qPgpa9e7Hs_xA.jpg",
                    "country_id": 231,
                    "flags": 6,
                    "console": 0
                },
                "team1": {
                    "id": 16,
                    "name": "Östersunds FK",
                    "logo": "TwDhgyDtxAtW7Q.png"
                },
                "team2": {
                    "id": 3,
                    "name": "Djurgården",
                    "logo": "5nUj50T3_g_NcA.png"
                },
                "walkover_time": 1634595330
            },
            "seen": false,
            "inserted": 1634594430
        },
        {
            "id": 827,
            "type": 1,
            "from_user": {
                "id": 67,
                "username": "fabian",
                "avatar": "7qPgpa9e7Hs_xA.jpg",
                "country_id": 231,
                "flags": 6,
                "console": 0
            },
            "data": {
                "id": 219,
                "name": "Test Flutter Tournament",
                "image": "nF-yLMwJRklOaw.png"
            },
            "seen": false,
            "inserted": 1634594309
        },
        {
            "id": 824,
            "type": 1,
            "from_user": {
                "id": 67,
                "username": "fabian",
                "avatar": "7qPgpa9e7Hs_xA.jpg",
                "country_id": 231,
                "flags": 6,
                "console": 0
            },
            "data": {
                "id": 218,
                "name": "Playstation Test tournament",
                "image": "FFS6alin4SJFrA.png"
            },
            "seen": false,
            "inserted": 1634590334
        },
        {
            "id": 822,
            "type": 2,
            "from_user": {
                "id": 67,
                "username": "fabian",
                "avatar": "7qPgpa9e7Hs_xA.jpg",
                "country_id": 231,
                "flags": 6,
                "console": 0
            },
            "data": {
                "id": 218,
                "name": "Playstation Test tournament",
                "image": "FFS6alin4SJFrA.png"
            },
            "seen": true,
            "inserted": 1634589349
        }
    ],
    "chats": null,
    "active_matches": null,
    "ta_permissions_map": null,
    "oa_permissions_map": null,
    "tca_permissions_map": null,
    "twitch_username": null,
    "lobby_check_in": {
        "id": 151,
        "tournament": {
            "id": 219,
            "name": "Test Flutter Tournament",
            "logo": "nF-yLMwJRklOaw.png",
            "banner": null,
            "flags": 33
        },
        "user": {
            "id": 90,
            "username": "fabian2",
            "avatar": null,
            "country_id": 231,
            "flags": 0,
            "console": 0
        },
        "team": {
            "id": 16,
            "name": "Östersunds FK",
            "logo": "TwDhgyDtxAtW7Q.png"
        },
        "walkover_time": 1676078908
    }
}''') as Json);
