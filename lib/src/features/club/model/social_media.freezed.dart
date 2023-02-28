// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'social_media.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SocialMedia _$SocialMediaFromJson(Map<String, dynamic> json) {
  return _SocialMedia.fromJson(json);
}

/// @nodoc
class _$SocialMediaTearOff {
  const _$SocialMediaTearOff();

  _SocialMedia call(
      {required int id,
      required int mediaId,
      required SocialMediaPlatform platform,
      String? image,
      String? content,
      required String url,
      @TimestampConverter() required DateTime inserted}) {
    return _SocialMedia(
      id: id,
      mediaId: mediaId,
      platform: platform,
      image: image,
      content: content,
      url: url,
      inserted: inserted,
    );
  }

  SocialMedia fromJson(Map<String, Object?> json) {
    return SocialMedia.fromJson(json);
  }
}

/// @nodoc
const $SocialMedia = _$SocialMediaTearOff();

/// @nodoc
mixin _$SocialMedia {
  int get id => throw _privateConstructorUsedError;
  int get mediaId => throw _privateConstructorUsedError;
  SocialMediaPlatform get platform => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get inserted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SocialMediaCopyWith<SocialMedia> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocialMediaCopyWith<$Res> {
  factory $SocialMediaCopyWith(
          SocialMedia value, $Res Function(SocialMedia) then) =
      _$SocialMediaCopyWithImpl<$Res>;
  $Res call(
      {int id,
      int mediaId,
      SocialMediaPlatform platform,
      String? image,
      String? content,
      String url,
      @TimestampConverter() DateTime inserted});
}

/// @nodoc
class _$SocialMediaCopyWithImpl<$Res> implements $SocialMediaCopyWith<$Res> {
  _$SocialMediaCopyWithImpl(this._value, this._then);

  final SocialMedia _value;
  // ignore: unused_field
  final $Res Function(SocialMedia) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? mediaId = freezed,
    Object? platform = freezed,
    Object? image = freezed,
    Object? content = freezed,
    Object? url = freezed,
    Object? inserted = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      mediaId: mediaId == freezed
          ? _value.mediaId
          : mediaId // ignore: cast_nullable_to_non_nullable
              as int,
      platform: platform == freezed
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as SocialMediaPlatform,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      inserted: inserted == freezed
          ? _value.inserted
          : inserted // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$SocialMediaCopyWith<$Res>
    implements $SocialMediaCopyWith<$Res> {
  factory _$SocialMediaCopyWith(
          _SocialMedia value, $Res Function(_SocialMedia) then) =
      __$SocialMediaCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      int mediaId,
      SocialMediaPlatform platform,
      String? image,
      String? content,
      String url,
      @TimestampConverter() DateTime inserted});
}

/// @nodoc
class __$SocialMediaCopyWithImpl<$Res> extends _$SocialMediaCopyWithImpl<$Res>
    implements _$SocialMediaCopyWith<$Res> {
  __$SocialMediaCopyWithImpl(
      _SocialMedia _value, $Res Function(_SocialMedia) _then)
      : super(_value, (v) => _then(v as _SocialMedia));

  @override
  _SocialMedia get _value => super._value as _SocialMedia;

  @override
  $Res call({
    Object? id = freezed,
    Object? mediaId = freezed,
    Object? platform = freezed,
    Object? image = freezed,
    Object? content = freezed,
    Object? url = freezed,
    Object? inserted = freezed,
  }) {
    return _then(_SocialMedia(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      mediaId: mediaId == freezed
          ? _value.mediaId
          : mediaId // ignore: cast_nullable_to_non_nullable
              as int,
      platform: platform == freezed
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as SocialMediaPlatform,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      inserted: inserted == freezed
          ? _value.inserted
          : inserted // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SocialMedia implements _SocialMedia {
  const _$_SocialMedia(
      {required this.id,
      required this.mediaId,
      required this.platform,
      this.image,
      this.content,
      required this.url,
      @TimestampConverter() required this.inserted});

  factory _$_SocialMedia.fromJson(Map<String, dynamic> json) =>
      _$$_SocialMediaFromJson(json);

  @override
  final int id;
  @override
  final int mediaId;
  @override
  final SocialMediaPlatform platform;
  @override
  final String? image;
  @override
  final String? content;
  @override
  final String url;
  @override
  @TimestampConverter()
  final DateTime inserted;

  @override
  String toString() {
    return 'SocialMedia(id: $id, mediaId: $mediaId, platform: $platform, image: $image, content: $content, url: $url, inserted: $inserted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SocialMedia &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.mediaId, mediaId) &&
            const DeepCollectionEquality().equals(other.platform, platform) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.inserted, inserted));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(mediaId),
      const DeepCollectionEquality().hash(platform),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(inserted));

  @JsonKey(ignore: true)
  @override
  _$SocialMediaCopyWith<_SocialMedia> get copyWith =>
      __$SocialMediaCopyWithImpl<_SocialMedia>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SocialMediaToJson(this);
  }
}

abstract class _SocialMedia implements SocialMedia {
  const factory _SocialMedia(
      {required int id,
      required int mediaId,
      required SocialMediaPlatform platform,
      String? image,
      String? content,
      required String url,
      @TimestampConverter() required DateTime inserted}) = _$_SocialMedia;

  factory _SocialMedia.fromJson(Map<String, dynamic> json) =
      _$_SocialMedia.fromJson;

  @override
  int get id;
  @override
  int get mediaId;
  @override
  SocialMediaPlatform get platform;
  @override
  String? get image;
  @override
  String? get content;
  @override
  String get url;
  @override
  @TimestampConverter()
  DateTime get inserted;
  @override
  @JsonKey(ignore: true)
  _$SocialMediaCopyWith<_SocialMedia> get copyWith =>
      throw _privateConstructorUsedError;
}
