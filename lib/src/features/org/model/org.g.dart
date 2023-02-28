// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'org.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Org _$$_OrgFromJson(Map<String, dynamic> json) => _$_Org(
      id: json['id'] as int,
      name: json['name'] as String,
      logo: json['logo'] as String,
      background: json['background'] as String?,
      bannerUrl: json['banner_url'] as String?,
      slug: json['slug'] as String,
      flags: json['flags'] as int,
      inserted: const TimestampConverter().fromJson(json['inserted'] as int),
      memberCount: json['member_count'] as int?,
      parents: (json['parents'] as List<dynamic>?)
          ?.map((e) => Club.fromJson(e as Map<String, dynamic>))
          .toList(),
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => Club.fromJson(e as Map<String, dynamic>))
          .toList(),
      siblings: (json['siblings'] as List<dynamic>?)
          ?.map((e) => Club.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_OrgToJson(_$_Org instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'background': instance.background,
      'banner_url': instance.bannerUrl,
      'slug': instance.slug,
      'flags': instance.flags,
      'inserted': const TimestampConverter().toJson(instance.inserted),
      'member_count': instance.memberCount,
      'parents': instance.parents,
      'children': instance.children,
      'siblings': instance.siblings,
    };
