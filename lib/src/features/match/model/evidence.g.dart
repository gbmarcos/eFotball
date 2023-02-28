// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evidence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Evidence _$$_EvidenceFromJson(Map<String, dynamic> json) => _$_Evidence(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      image: json['image'] as String?,
      youtubeId: json['youtube_id'] as String?,
      inserted: const TimestampConverter().fromJson(json['inserted'] as int),
    );

Map<String, dynamic> _$$_EvidenceToJson(_$_Evidence instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'image': instance.image,
      'youtube_id': instance.youtubeId,
      'inserted': const TimestampConverter().toJson(instance.inserted),
    };

_$_UserEvidence _$$_UserEvidenceFromJson(Map<String, dynamic> json) =>
    _$_UserEvidence(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      image: json['image'] as String?,
      youtubeId: json['youtube_id'] as String?,
      inserted: const TimestampConverter().fromJson(json['inserted'] as int),
      username: json['username'] as String,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$$_UserEvidenceToJson(_$_UserEvidence instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'image': instance.image,
      'youtube_id': instance.youtubeId,
      'inserted': const TimestampConverter().toJson(instance.inserted),
      'username': instance.username,
      'avatar': instance.avatar,
    };
