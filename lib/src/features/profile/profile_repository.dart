import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fifa/r.dart';
import 'package:fifa/src/common/domain/user/user.dart';
import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/common/data/network_service.dart';
import 'package:fifa/src/features/profile/models/user_profile.dart';
import 'package:fpdart/fpdart.dart';

class ProfileRepository {
  final AuthenticatedNetworkService _client;

  ProfileRepository({required AuthenticatedNetworkService client}) : _client = client;

  /// The user's profile.
  ///   - [id] (u32)
  ///   - [friends] (string)
  /// 	   -If it's "1", it also returns friends.
  ///

  Future<Either<NetworkException, UserProfile>> getProfile({
    required int id,
    String friends = '1',
  }) async {
    final data = {
      'id': id,
      'friends': friends,
    };

    final response = await _client.get(R.apiEndPoints.userprofile, query: data);

    return response.map<UserProfile>(
      (dynamic a) => UserProfile.fromJson(a as Map<String, dynamic>),
    );
  }

  Future<Either<NetworkException, String>> connectTwitch({
    required String code,
  }) async {
    final data = {
      'twitch_code': code,
      '_u': _client.userId,
      '_t': _client.token,
    };

    final response = await _client.postForm('/twitch/save', body: data);

    return response.map<String>((dynamic a) => '$a');
  }

  Future<Either<NetworkException, dynamic>> disconnectTwitch() async {
    final data = {'_u': _client.userId, '_t': _client.token};

    final response = await _client.get('/twitch/unconnect', query: data);

    return response;
  }

  Future<Either<NetworkException, UserProfile>> getOwnProfile({
    required int userId,
    String friends = '1',
  }) async {
    final data = {
      '_u': userId,
      '_t': _client.token,
      'friends': friends,
    };

    final response = await _client.get(R.apiEndPoints.ownUserprofile, query: data);

    return response.map<UserProfile>(
      (dynamic a) => UserProfile.fromJson(a as Map<String, dynamic>),
    );
  }

  ///Changes the user's email.

  Future<Either<NetworkException, void>> changeEmail({
    required User user,
    required UserProfile profile,
    required String newEmail,
  }) async {
    final data = {
      '_u': user.id,
      '_t': user.token,
      'country_id': user.countryId,
      'first_name': user.firstName,
      'last_name': user.lastName,
      'email': newEmail,
      'birth_year': user.birthYear,
      'birth_month': user.birthMonth,
      'birth_day': user.birthDay,
      if (user.gender != null) 'gender': user.gender,
    };

    final response = await _client.postForm(R.apiEndPoints.updateProfile, body: data);

    return response.map<void>((dynamic a) {});
  }

  Future<Either<NetworkException, void>> changeConsole({
    required User user,
    required UserProfile profile,
    required Console console,
  }) async {
    final data = {
      '_u': user.id,
      '_t': user.token,
      'country_id': user.countryId,
      'first_name': user.firstName,
      'last_name': user.lastName,
      'email': user.email,
      'birth_year': user.birthYear,
      'birth_month': user.birthMonth,
      'birth_day': user.birthDay,
      'console': console.index,
      'gender': user.gender,
      'xbox_tag': profile.xboxTag,
      'psn_id': profile.psnId,
    }..removeWhere((key, value) => value == null);
    print(jsonEncode(data));
    final response = await _client.postForm(R.apiEndPoints.updateProfile, body: data);

    return response.map<void>((dynamic a) {});
  }

  ///Changes the user's password and returns a new user token.
  ///It's mandatory to pass the `User` id and auth token.
  Future<Either<NetworkException, String>> changePassword({
    required int userId,
    required String currentPass,
    required String newPass,
  }) async {
    final data = {
      'current_password': currentPass,
      'new_password': newPass,
      '_u': userId,
      '_t': _client.token,
    };

    final response = await _client.postForm(R.apiEndPoints.changePass, body: data);

    return response.map<String>((dynamic a) => a as String);
  }

  ///Changes the user's photo.
  ///It's mandatory to pass the `User` id and auth token.
  Future<Either<NetworkException, void>> changePhoto({
    required int userId,
    required String photoPath,
  }) async {
    final fileName = photoPath.split('/').last;

    final data = {
      '_u': userId,
      '_t': _client.token,
      'photo': await MultipartFile.fromFile(photoPath, filename: fileName),
    };

    final response = await _client.postForm(R.apiEndPoints.changeProfileImage, body: data);

    return response.map<void>((dynamic a) {});
  }
}
