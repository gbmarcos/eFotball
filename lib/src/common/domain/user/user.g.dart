// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAuthenticated _$UserAuthenticatedFromJson(Map<String, dynamic> json) =>
    UserAuthenticated(
      token: json['token'] as String,
      permissions: json['permissions'] as int?,
    );

Map<String, dynamic> _$UserAuthenticatedToJson(UserAuthenticated instance) =>
    <String, dynamic>{
      'token': instance.token,
      'permissions': instance.permissions,
    };

UserBasicInfo _$UserBasicInfoFromJson(Map<String, dynamic> json) =>
    UserBasicInfo(
      id: json['id'] as int?,
      username: json['username'] as String,
      flags: json['flags'] as int,
      avatar: json['avatar'] as String?,
      countryId: json['country_id'] as int?,
    );

Map<String, dynamic> _$UserBasicInfoToJson(UserBasicInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'flags': instance.flags,
      'avatar': instance.avatar,
      'country_id': instance.countryId,
    };

MatchUser _$MatchUserFromJson(Map<String, dynamic> json) => MatchUser(
      id: json['id'] as int?,
      username: json['username'] as String,
      flags: json['flags'] as int,
      elo: json['elo'] as int,
      eloChange: json['elo_change'] as int?,
      avatar: json['avatar'] as String?,
      countryId: json['country_id'] as int?,
      console: $enumDecodeNullable(_$ConsoleEnumMap, json['console']),
    );

Map<String, dynamic> _$MatchUserToJson(MatchUser instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'flags': instance.flags,
      'avatar': instance.avatar,
      'country_id': instance.countryId,
      'console': _$ConsoleEnumMap[instance.console],
      'elo': instance.elo,
      'elo_change': instance.eloChange,
    };

const _$ConsoleEnumMap = {
  Console.xbox: 0,
  Console.playstation: 1,
};

UserExtended _$UserExtendedFromJson(Map<String, dynamic> json) => UserExtended(
      email: json['email'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      birthYear: json['birth_year'] as int?,
      birthMonth: json['birth_month'] as int?,
      birthDay: json['birth_day'] as int?,
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      friends: (json['friends'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      friendRequests: (json['friend_requests'] as List<dynamic>?)
          ?.map((e) => UserBasicInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      sentFriendRequests: (json['sent_friend_requests'] as List<dynamic>?)
          ?.map((e) => UserBasicInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      notifications: (json['notifications'] as List<dynamic>?)
          ?.map((e) => Notification.fromJson(e as Map<String, dynamic>))
          .toList(),
      chats: (json['chats'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      activeMatches: (json['active_matches'] as List<dynamic>?)
          ?.map((e) => ActiveMatch.fromJson(e as Map<String, dynamic>))
          .toList(),
      taPermissionsMap: json['ta_permissions_map'] as Map<String, dynamic>?,
      oaPermissionsMap: json['oa_permissions_map'] as Map<String, dynamic>?,
      twitchUsername: json['twitch_username'] as String?,
      lobbyCheckIn: json['lobby_check_in'] == null
          ? null
          : LobbyCheckIn.fromJson(
              json['lobby_check_in'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserExtendedToJson(UserExtended instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'birth_year': instance.birthYear,
      'birth_month': instance.birthMonth,
      'birth_day': instance.birthDay,
      'gender': _$GenderEnumMap[instance.gender],
      'friends': instance.friends,
      'friend_requests': instance.friendRequests,
      'sent_friend_requests': instance.sentFriendRequests,
      'notifications': instance.notifications,
      'chats': instance.chats,
      'active_matches': instance.activeMatches,
      'ta_permissions_map': instance.taPermissionsMap,
      'oa_permissions_map': instance.oaPermissionsMap,
      'twitch_username': instance.twitchUsername,
      'lobby_check_in': instance.lobbyCheckIn,
    };

const _$GenderEnumMap = {
  Gender.male: 0,
  Gender.female: 1,
};

LatestMatchUser _$LatestMatchUserFromJson(Map<String, dynamic> json) =>
    LatestMatchUser(
      id: json['id'] as int?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      score: json['score'] as int?,
    );

Map<String, dynamic> _$LatestMatchUserToJson(LatestMatchUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'score': instance.score,
    };

LobbyCheckIn _$LobbyCheckInFromJson(Map<String, dynamic> json) => LobbyCheckIn(
      id: json['id'] as int,
      tournament:
          TournamentRef.fromJson(json['tournament'] as Map<String, dynamic>),
      user: UserBasicInfo.fromJson(json['user'] as Map<String, dynamic>),
      team: json['team'] == null
          ? null
          : TeamRef.fromJson(json['team'] as Map<String, dynamic>),
      walkoverTime: json['walkover_time'] as int,
    );

Map<String, dynamic> _$LobbyCheckInToJson(LobbyCheckIn instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tournament': instance.tournament,
      'user': instance.user,
      'team': instance.team,
      'walkover_time': instance.walkoverTime,
    };

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as int,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      birthYear: json['birth_year'] as int?,
      birthMonth: json['birth_month'] as int?,
      birthDay: json['birth_day'] as int?,
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      friends: (json['friends'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      friendRequests: (json['friend_requests'] as List<dynamic>?)
          ?.map((e) => UserBasicInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      sentFriendRequests: (json['sent_friend_requests'] as List<dynamic>?)
          ?.map((e) => UserBasicInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      notifications: (json['notifications'] as List<dynamic>?)
          ?.map((e) => Notification.fromJson(e as Map<String, dynamic>))
          .toList(),
      chats: (json['chats'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      activeMatches: (json['active_matches'] as List<dynamic>?)
          ?.map((e) => ActiveMatch.fromJson(e as Map<String, dynamic>))
          .toList(),
      taPermissionsMap: json['ta_permissions_map'] as Map<String, dynamic>?,
      oaPermissionsMap: json['oa_permissions_map'] as Map<String, dynamic>?,
      twitchUsername: json['twitch_username'] as String?,
      lobbyCheckIn: json['lobby_check_in'] == null
          ? null
          : LobbyCheckIn.fromJson(
              json['lobby_check_in'] as Map<String, dynamic>),
      token: json['token'] as String,
      permissions: json['permissions'] as int?,
      username: json['username'] as String,
      avatar: json['avatar'] as String?,
      countryId: json['country_id'] as int?,
      console: $enumDecodeNullable(_$ConsoleEnumMap, json['console']),
      flags: json['flags'] as int,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'birth_year': instance.birthYear,
      'birth_month': instance.birthMonth,
      'birth_day': instance.birthDay,
      'gender': _$GenderEnumMap[instance.gender],
      'friends': instance.friends,
      'friend_requests': instance.friendRequests,
      'sent_friend_requests': instance.sentFriendRequests,
      'notifications': instance.notifications,
      'chats': instance.chats,
      'active_matches': instance.activeMatches,
      'ta_permissions_map': instance.taPermissionsMap,
      'oa_permissions_map': instance.oaPermissionsMap,
      'twitch_username': instance.twitchUsername,
      'lobby_check_in': instance.lobbyCheckIn,
      'token': instance.token,
      'permissions': instance.permissions,
      'username': instance.username,
      'avatar': instance.avatar,
      'country_id': instance.countryId,
      'console': _$ConsoleEnumMap[instance.console],
      'flags': instance.flags,
    };
