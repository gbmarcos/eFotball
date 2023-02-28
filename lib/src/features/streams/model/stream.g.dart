// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stream.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Stream _$$_StreamFromJson(Map<String, dynamic> json) => _$_Stream(
      url: json['url'] as String?,
      tournamentId: json['tournament_id'] as int?,
      twitchUserId: json['twitch_user_id'] as String?,
      twitchUsername: json['twitch_username'] as String?,
      userId: json['user_id'] as int?,
      username: json['username'] as String?,
      status: json['status'] as String?,
      thumbnailUrl: json['thumbnail_url'] as String?,
      viewers: json['viewers'] as int?,
      org: json['org'] == null
          ? null
          : OrgRef.fromJson(json['org'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_StreamToJson(_$_Stream instance) => <String, dynamic>{
      'url': instance.url,
      'tournament_id': instance.tournamentId,
      'twitch_user_id': instance.twitchUserId,
      'twitch_username': instance.twitchUsername,
      'user_id': instance.userId,
      'username': instance.username,
      'status': instance.status,
      'thumbnail_url': instance.thumbnailUrl,
      'viewers': instance.viewers,
      'org': instance.org,
    };
