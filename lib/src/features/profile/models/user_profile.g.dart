// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserProfile _$$_UserProfileFromJson(Map<String, dynamic> json) =>
    _$_UserProfile(
      id: json['id'] as int?,
      username: json['username'] as String,
      avatar: json['avatar'] as String?,
      email: json['email'] as String?,
      countryId: json['country_id'] as int?,
      flags: json['flags'] as int,
      onlineStatus: $enumDecode(_$OnlineStatusEnumMap, json['online_status']),
      inserted: const TimestampConverter().fromJson(json['inserted'] as int),
      admin: json['admin'] as bool?,
      banned: json['banned'] as bool,
      friends: (json['friends'] as List<dynamic>?)
          ?.map((e) => Friend.fromJson(e as Map<String, dynamic>))
          .toList(),
      usernameHistory: (json['username_history'] as List<dynamic>?)
          ?.map((e) => UsernameHistoryEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      stats: UserProfileStats.fromJson(json['stats'] as Map<String, dynamic>),
      stream: UserTwitchStream.fromJson(json['stream'] as Map<String, dynamic>),
      hasXbox: json['has_xbox'] as bool?,
      hasPlaystation: json['has_playstation'] as bool?,
      xboxTag: json['xbox_tag'] as String?,
      psnId: json['psn_id'] as String?,
    );

Map<String, dynamic> _$$_UserProfileToJson(_$_UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'avatar': instance.avatar,
      'email': instance.email,
      'country_id': instance.countryId,
      'flags': instance.flags,
      'online_status': _$OnlineStatusEnumMap[instance.onlineStatus],
      'inserted': const TimestampConverter().toJson(instance.inserted),
      'admin': instance.admin,
      'banned': instance.banned,
      'friends': instance.friends,
      'username_history': instance.usernameHistory,
      'stats': instance.stats,
      'stream': instance.stream,
      'has_xbox': instance.hasXbox,
      'has_playstation': instance.hasPlaystation,
      'xbox_tag': instance.xboxTag,
      'psn_id': instance.psnId,
    };

const _$OnlineStatusEnumMap = {
  OnlineStatus.offline: 0,
  OnlineStatus.ingame: 1,
  OnlineStatus.idle: 2,
  OnlineStatus.online: 3,
};

_$_Friend _$$_FriendFromJson(Map<String, dynamic> json) => _$_Friend(
      id: json['id'] as int?,
      username: json['username'] as String,
      avatar: json['avatar'] as String?,
      countryId: json['country_id'] as int?,
      flags: json['flags'] as int,
      console: $enumDecodeNullable(_$ConsoleEnumMap, json['console']),
      onlineStatus: $enumDecode(_$OnlineStatusEnumMap, json['online_status']),
      inserted: const TimestampConverter().fromJson(json['inserted'] as int),
    );

Map<String, dynamic> _$$_FriendToJson(_$_Friend instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'avatar': instance.avatar,
      'country_id': instance.countryId,
      'flags': instance.flags,
      'console': _$ConsoleEnumMap[instance.console],
      'online_status': _$OnlineStatusEnumMap[instance.onlineStatus],
      'inserted': const TimestampConverter().toJson(instance.inserted),
    };

const _$ConsoleEnumMap = {
  Console.xbox: 0,
  Console.playstation: 1,
};

_$_UsernameHistoryEntry _$$_UsernameHistoryEntryFromJson(
        Map<String, dynamic> json) =>
    _$_UsernameHistoryEntry(
      id: json['id'] as int,
      username: json['username'] as String,
      inserted: const TimestampConverter().fromJson(json['inserted'] as int),
    );

Map<String, dynamic> _$$_UsernameHistoryEntryToJson(
        _$_UsernameHistoryEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'inserted': const TimestampConverter().toJson(instance.inserted),
    };

_$_UserTwitchStream _$$_UserTwitchStreamFromJson(Map<String, dynamic> json) =>
    _$_UserTwitchStream(
      username: json['username'] as String,
      status: json['status'] as String?,
      viewers: json['viewers'] as int?,
    );

Map<String, dynamic> _$$_UserTwitchStreamToJson(_$_UserTwitchStream instance) =>
    <String, dynamic>{
      'username': instance.username,
      'status': instance.status,
      'viewers': instance.viewers,
    };
