// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SocialMedia _$$_SocialMediaFromJson(Map<String, dynamic> json) =>
    _$_SocialMedia(
      id: json['id'] as int,
      mediaId: json['media_id'] as int,
      platform: $enumDecode(_$SocialMediaPlatformEnumMap, json['platform']),
      image: json['image'] as String?,
      content: json['content'] as String?,
      url: json['url'] as String,
      inserted: const TimestampConverter().fromJson(json['inserted'] as int),
    );

Map<String, dynamic> _$$_SocialMediaToJson(_$_SocialMedia instance) =>
    <String, dynamic>{
      'id': instance.id,
      'media_id': instance.mediaId,
      'platform': _$SocialMediaPlatformEnumMap[instance.platform],
      'image': instance.image,
      'content': instance.content,
      'url': instance.url,
      'inserted': const TimestampConverter().toJson(instance.inserted),
    };

const _$SocialMediaPlatformEnumMap = {
  SocialMediaPlatform.instagram: 0,
  SocialMediaPlatform.twitter: 1,
};
