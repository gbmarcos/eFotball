// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_News _$$_NewsFromJson(Map<String, dynamic> json) => _$_News(
      id: json['id'] as int,
      title: json['title'] as String,
      category: json['category'] == null
          ? null
          : NewsCategory.fromJson(json['category'] as Map<String, dynamic>),
      content: json['content'] as String,
      image: json['image'] as String?,
      thumbnail: json['thumbnail'] as String?,
      author: json['author'] == null
          ? null
          : UserBasicInfo.fromJson(json['author'] as Map<String, dynamic>),
      inserted: const TimestampConverter().fromJson(json['inserted'] as int),
      preview: json['preview'] as String?,
      org: Org.fromJson(json['org'] as Map<String, dynamic>),
      flags: $enumDecodeNullable(_$CategoryEnumMap, json['flags']),
      commentCount: json['comment_count'] as int?,
    );

Map<String, dynamic> _$$_NewsToJson(_$_News instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'category': instance.category,
      'content': instance.content,
      'image': instance.image,
      'thumbnail': instance.thumbnail,
      'author': instance.author,
      'inserted': const TimestampConverter().toJson(instance.inserted),
      'preview': instance.preview,
      'org': instance.org,
      'flags': _$CategoryEnumMap[instance.flags],
      'comment_count': instance.commentCount,
    };

const _$CategoryEnumMap = {
  Category.undefined: 0,
  Category.main: 1,
  Category.featured: 2,
};

_$_NewsCategory _$$_NewsCategoryFromJson(Map<String, dynamic> json) =>
    _$_NewsCategory(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$_NewsCategoryToJson(_$_NewsCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$_Org _$$_OrgFromJson(Map<String, dynamic> json) => _$_Org(
      id: json['id'] as int,
      name: json['name'] as String?,
      logo: json['logo'] as String?,
      background: json['background'] as String?,
      bannerUrl: json['banner_url'] as String?,
      slug: json['slug'] as String?,
      flags: json['flags'] as int?,
      inserted: json['inserted'] as int?,
    );

Map<String, dynamic> _$$_OrgToJson(_$_Org instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'background': instance.background,
      'banner_url': instance.bannerUrl,
      'slug': instance.slug,
      'flags': instance.flags,
      'inserted': instance.inserted,
    };

_$_Comment _$$_CommentFromJson(Map<String, dynamic> json) => _$_Comment(
      id: json['id'] as int,
      author: UserBasicInfo.fromJson(json['author'] as Map<String, dynamic>),
      message: json['message'] as String,
      inserted: const TimestampConverter().fromJson(json['inserted'] as int),
      deleted: json['deleted'] as int?,
    );

Map<String, dynamic> _$$_CommentToJson(_$_Comment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'message': instance.message,
      'inserted': const TimestampConverter().toJson(instance.inserted),
      'deleted': instance.deleted,
    };
