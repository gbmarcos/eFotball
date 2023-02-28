// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'org.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrgRef _$OrgRefFromJson(Map<String, dynamic> json) => OrgRef(
      id: json['id'] as int,
      name: json['name'] as String,
      logo: json['logo'] as String?,
      background: json['background'] as String?,
      bannerUrl: json['banner_url'] as String?,
      slug: json['slug'] as String,
      flags: json['flags'] as int,
      inserted: const TimestampConverter().fromJson(json['inserted'] as int),
    );

Map<String, dynamic> _$OrgRefToJson(OrgRef instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'background': instance.background,
      'banner_url': instance.bannerUrl,
      'slug': instance.slug,
      'flags': instance.flags,
      'inserted': const TimestampConverter().toJson(instance.inserted),
    };
