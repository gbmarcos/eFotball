// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'news.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

News _$NewsFromJson(Map<String, dynamic> json) {
  return _News.fromJson(json);
}

/// @nodoc
class _$NewsTearOff {
  const _$NewsTearOff();

  _News call(
      {required int id,
      required String title,
      NewsCategory? category,
      required String content,
      String? image,
      String? thumbnail,
      UserBasicInfo? author,
      @TimestampConverter() required DateTime inserted,
      String? preview,
      required Org org,
      Category? flags,
      int? commentCount}) {
    return _News(
      id: id,
      title: title,
      category: category,
      content: content,
      image: image,
      thumbnail: thumbnail,
      author: author,
      inserted: inserted,
      preview: preview,
      org: org,
      flags: flags,
      commentCount: commentCount,
    );
  }

  News fromJson(Map<String, Object?> json) {
    return News.fromJson(json);
  }
}

/// @nodoc
const $News = _$NewsTearOff();

/// @nodoc
mixin _$News {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  NewsCategory? get category => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;
  UserBasicInfo? get author => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get inserted => throw _privateConstructorUsedError;
  String? get preview => throw _privateConstructorUsedError;
  Org get org => throw _privateConstructorUsedError;
  Category? get flags => throw _privateConstructorUsedError;
  int? get commentCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsCopyWith<News> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsCopyWith<$Res> {
  factory $NewsCopyWith(News value, $Res Function(News) then) =
      _$NewsCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String title,
      NewsCategory? category,
      String content,
      String? image,
      String? thumbnail,
      UserBasicInfo? author,
      @TimestampConverter() DateTime inserted,
      String? preview,
      Org org,
      Category? flags,
      int? commentCount});

  $NewsCategoryCopyWith<$Res>? get category;
  $OrgCopyWith<$Res> get org;
}

/// @nodoc
class _$NewsCopyWithImpl<$Res> implements $NewsCopyWith<$Res> {
  _$NewsCopyWithImpl(this._value, this._then);

  final News _value;
  // ignore: unused_field
  final $Res Function(News) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? category = freezed,
    Object? content = freezed,
    Object? image = freezed,
    Object? thumbnail = freezed,
    Object? author = freezed,
    Object? inserted = freezed,
    Object? preview = freezed,
    Object? org = freezed,
    Object? flags = freezed,
    Object? commentCount = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as NewsCategory?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as UserBasicInfo?,
      inserted: inserted == freezed
          ? _value.inserted
          : inserted // ignore: cast_nullable_to_non_nullable
              as DateTime,
      preview: preview == freezed
          ? _value.preview
          : preview // ignore: cast_nullable_to_non_nullable
              as String?,
      org: org == freezed
          ? _value.org
          : org // ignore: cast_nullable_to_non_nullable
              as Org,
      flags: flags == freezed
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as Category?,
      commentCount: commentCount == freezed
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }

  @override
  $NewsCategoryCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $NewsCategoryCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value));
    });
  }

  @override
  $OrgCopyWith<$Res> get org {
    return $OrgCopyWith<$Res>(_value.org, (value) {
      return _then(_value.copyWith(org: value));
    });
  }
}

/// @nodoc
abstract class _$NewsCopyWith<$Res> implements $NewsCopyWith<$Res> {
  factory _$NewsCopyWith(_News value, $Res Function(_News) then) =
      __$NewsCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String title,
      NewsCategory? category,
      String content,
      String? image,
      String? thumbnail,
      UserBasicInfo? author,
      @TimestampConverter() DateTime inserted,
      String? preview,
      Org org,
      Category? flags,
      int? commentCount});

  @override
  $NewsCategoryCopyWith<$Res>? get category;
  @override
  $OrgCopyWith<$Res> get org;
}

/// @nodoc
class __$NewsCopyWithImpl<$Res> extends _$NewsCopyWithImpl<$Res>
    implements _$NewsCopyWith<$Res> {
  __$NewsCopyWithImpl(_News _value, $Res Function(_News) _then)
      : super(_value, (v) => _then(v as _News));

  @override
  _News get _value => super._value as _News;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? category = freezed,
    Object? content = freezed,
    Object? image = freezed,
    Object? thumbnail = freezed,
    Object? author = freezed,
    Object? inserted = freezed,
    Object? preview = freezed,
    Object? org = freezed,
    Object? flags = freezed,
    Object? commentCount = freezed,
  }) {
    return _then(_News(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as NewsCategory?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as UserBasicInfo?,
      inserted: inserted == freezed
          ? _value.inserted
          : inserted // ignore: cast_nullable_to_non_nullable
              as DateTime,
      preview: preview == freezed
          ? _value.preview
          : preview // ignore: cast_nullable_to_non_nullable
              as String?,
      org: org == freezed
          ? _value.org
          : org // ignore: cast_nullable_to_non_nullable
              as Org,
      flags: flags == freezed
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as Category?,
      commentCount: commentCount == freezed
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_News extends _News {
  const _$_News(
      {required this.id,
      required this.title,
      this.category,
      required this.content,
      this.image,
      this.thumbnail,
      this.author,
      @TimestampConverter() required this.inserted,
      this.preview,
      required this.org,
      this.flags,
      this.commentCount})
      : super._();

  factory _$_News.fromJson(Map<String, dynamic> json) => _$$_NewsFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final NewsCategory? category;
  @override
  final String content;
  @override
  final String? image;
  @override
  final String? thumbnail;
  @override
  final UserBasicInfo? author;
  @override
  @TimestampConverter()
  final DateTime inserted;
  @override
  final String? preview;
  @override
  final Org org;
  @override
  final Category? flags;
  @override
  final int? commentCount;

  @override
  String toString() {
    return 'News(id: $id, title: $title, category: $category, content: $content, image: $image, thumbnail: $thumbnail, author: $author, inserted: $inserted, preview: $preview, org: $org, flags: $flags, commentCount: $commentCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _News &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.thumbnail, thumbnail) &&
            const DeepCollectionEquality().equals(other.author, author) &&
            const DeepCollectionEquality().equals(other.inserted, inserted) &&
            const DeepCollectionEquality().equals(other.preview, preview) &&
            const DeepCollectionEquality().equals(other.org, org) &&
            const DeepCollectionEquality().equals(other.flags, flags) &&
            const DeepCollectionEquality()
                .equals(other.commentCount, commentCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(thumbnail),
      const DeepCollectionEquality().hash(author),
      const DeepCollectionEquality().hash(inserted),
      const DeepCollectionEquality().hash(preview),
      const DeepCollectionEquality().hash(org),
      const DeepCollectionEquality().hash(flags),
      const DeepCollectionEquality().hash(commentCount));

  @JsonKey(ignore: true)
  @override
  _$NewsCopyWith<_News> get copyWith =>
      __$NewsCopyWithImpl<_News>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NewsToJson(this);
  }
}

abstract class _News extends News {
  const factory _News(
      {required int id,
      required String title,
      NewsCategory? category,
      required String content,
      String? image,
      String? thumbnail,
      UserBasicInfo? author,
      @TimestampConverter() required DateTime inserted,
      String? preview,
      required Org org,
      Category? flags,
      int? commentCount}) = _$_News;
  const _News._() : super._();

  factory _News.fromJson(Map<String, dynamic> json) = _$_News.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  NewsCategory? get category;
  @override
  String get content;
  @override
  String? get image;
  @override
  String? get thumbnail;
  @override
  UserBasicInfo? get author;
  @override
  @TimestampConverter()
  DateTime get inserted;
  @override
  String? get preview;
  @override
  Org get org;
  @override
  Category? get flags;
  @override
  int? get commentCount;
  @override
  @JsonKey(ignore: true)
  _$NewsCopyWith<_News> get copyWith => throw _privateConstructorUsedError;
}

NewsCategory _$NewsCategoryFromJson(Map<String, dynamic> json) {
  return _NewsCategory.fromJson(json);
}

/// @nodoc
class _$NewsCategoryTearOff {
  const _$NewsCategoryTearOff();

  _NewsCategory call({required int id, required String name}) {
    return _NewsCategory(
      id: id,
      name: name,
    );
  }

  NewsCategory fromJson(Map<String, Object?> json) {
    return NewsCategory.fromJson(json);
  }
}

/// @nodoc
const $NewsCategory = _$NewsCategoryTearOff();

/// @nodoc
mixin _$NewsCategory {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsCategoryCopyWith<NewsCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsCategoryCopyWith<$Res> {
  factory $NewsCategoryCopyWith(
          NewsCategory value, $Res Function(NewsCategory) then) =
      _$NewsCategoryCopyWithImpl<$Res>;
  $Res call({int id, String name});
}

/// @nodoc
class _$NewsCategoryCopyWithImpl<$Res> implements $NewsCategoryCopyWith<$Res> {
  _$NewsCategoryCopyWithImpl(this._value, this._then);

  final NewsCategory _value;
  // ignore: unused_field
  final $Res Function(NewsCategory) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$NewsCategoryCopyWith<$Res>
    implements $NewsCategoryCopyWith<$Res> {
  factory _$NewsCategoryCopyWith(
          _NewsCategory value, $Res Function(_NewsCategory) then) =
      __$NewsCategoryCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name});
}

/// @nodoc
class __$NewsCategoryCopyWithImpl<$Res> extends _$NewsCategoryCopyWithImpl<$Res>
    implements _$NewsCategoryCopyWith<$Res> {
  __$NewsCategoryCopyWithImpl(
      _NewsCategory _value, $Res Function(_NewsCategory) _then)
      : super(_value, (v) => _then(v as _NewsCategory));

  @override
  _NewsCategory get _value => super._value as _NewsCategory;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_NewsCategory(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NewsCategory implements _NewsCategory {
  const _$_NewsCategory({required this.id, required this.name});

  factory _$_NewsCategory.fromJson(Map<String, dynamic> json) =>
      _$$_NewsCategoryFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'NewsCategory(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NewsCategory &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$NewsCategoryCopyWith<_NewsCategory> get copyWith =>
      __$NewsCategoryCopyWithImpl<_NewsCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NewsCategoryToJson(this);
  }
}

abstract class _NewsCategory implements NewsCategory {
  const factory _NewsCategory({required int id, required String name}) =
      _$_NewsCategory;

  factory _NewsCategory.fromJson(Map<String, dynamic> json) =
      _$_NewsCategory.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$NewsCategoryCopyWith<_NewsCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

Org _$OrgFromJson(Map<String, dynamic> json) {
  return _Org.fromJson(json);
}

/// @nodoc
class _$OrgTearOff {
  const _$OrgTearOff();

  _Org call(
      {required int id,
      String? name,
      String? logo,
      String? background,
      String? bannerUrl,
      String? slug,
      int? flags,
      int? inserted}) {
    return _Org(
      id: id,
      name: name,
      logo: logo,
      background: background,
      bannerUrl: bannerUrl,
      slug: slug,
      flags: flags,
      inserted: inserted,
    );
  }

  Org fromJson(Map<String, Object?> json) {
    return Org.fromJson(json);
  }
}

/// @nodoc
const $Org = _$OrgTearOff();

/// @nodoc
mixin _$Org {
  int get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;
  String? get background => throw _privateConstructorUsedError;
  String? get bannerUrl => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;
  int? get flags => throw _privateConstructorUsedError;
  int? get inserted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrgCopyWith<Org> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrgCopyWith<$Res> {
  factory $OrgCopyWith(Org value, $Res Function(Org) then) =
      _$OrgCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String? name,
      String? logo,
      String? background,
      String? bannerUrl,
      String? slug,
      int? flags,
      int? inserted});
}

/// @nodoc
class _$OrgCopyWithImpl<$Res> implements $OrgCopyWith<$Res> {
  _$OrgCopyWithImpl(this._value, this._then);

  final Org _value;
  // ignore: unused_field
  final $Res Function(Org) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? logo = freezed,
    Object? background = freezed,
    Object? bannerUrl = freezed,
    Object? slug = freezed,
    Object? flags = freezed,
    Object? inserted = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: logo == freezed
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      background: background == freezed
          ? _value.background
          : background // ignore: cast_nullable_to_non_nullable
              as String?,
      bannerUrl: bannerUrl == freezed
          ? _value.bannerUrl
          : bannerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: slug == freezed
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      flags: flags == freezed
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as int?,
      inserted: inserted == freezed
          ? _value.inserted
          : inserted // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$OrgCopyWith<$Res> implements $OrgCopyWith<$Res> {
  factory _$OrgCopyWith(_Org value, $Res Function(_Org) then) =
      __$OrgCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String? name,
      String? logo,
      String? background,
      String? bannerUrl,
      String? slug,
      int? flags,
      int? inserted});
}

/// @nodoc
class __$OrgCopyWithImpl<$Res> extends _$OrgCopyWithImpl<$Res>
    implements _$OrgCopyWith<$Res> {
  __$OrgCopyWithImpl(_Org _value, $Res Function(_Org) _then)
      : super(_value, (v) => _then(v as _Org));

  @override
  _Org get _value => super._value as _Org;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? logo = freezed,
    Object? background = freezed,
    Object? bannerUrl = freezed,
    Object? slug = freezed,
    Object? flags = freezed,
    Object? inserted = freezed,
  }) {
    return _then(_Org(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: logo == freezed
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      background: background == freezed
          ? _value.background
          : background // ignore: cast_nullable_to_non_nullable
              as String?,
      bannerUrl: bannerUrl == freezed
          ? _value.bannerUrl
          : bannerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: slug == freezed
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      flags: flags == freezed
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as int?,
      inserted: inserted == freezed
          ? _value.inserted
          : inserted // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Org implements _Org {
  const _$_Org(
      {required this.id,
      this.name,
      this.logo,
      this.background,
      this.bannerUrl,
      this.slug,
      this.flags,
      this.inserted});

  factory _$_Org.fromJson(Map<String, dynamic> json) => _$$_OrgFromJson(json);

  @override
  final int id;
  @override
  final String? name;
  @override
  final String? logo;
  @override
  final String? background;
  @override
  final String? bannerUrl;
  @override
  final String? slug;
  @override
  final int? flags;
  @override
  final int? inserted;

  @override
  String toString() {
    return 'Org(id: $id, name: $name, logo: $logo, background: $background, bannerUrl: $bannerUrl, slug: $slug, flags: $flags, inserted: $inserted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Org &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.logo, logo) &&
            const DeepCollectionEquality()
                .equals(other.background, background) &&
            const DeepCollectionEquality().equals(other.bannerUrl, bannerUrl) &&
            const DeepCollectionEquality().equals(other.slug, slug) &&
            const DeepCollectionEquality().equals(other.flags, flags) &&
            const DeepCollectionEquality().equals(other.inserted, inserted));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(logo),
      const DeepCollectionEquality().hash(background),
      const DeepCollectionEquality().hash(bannerUrl),
      const DeepCollectionEquality().hash(slug),
      const DeepCollectionEquality().hash(flags),
      const DeepCollectionEquality().hash(inserted));

  @JsonKey(ignore: true)
  @override
  _$OrgCopyWith<_Org> get copyWith =>
      __$OrgCopyWithImpl<_Org>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrgToJson(this);
  }
}

abstract class _Org implements Org {
  const factory _Org(
      {required int id,
      String? name,
      String? logo,
      String? background,
      String? bannerUrl,
      String? slug,
      int? flags,
      int? inserted}) = _$_Org;

  factory _Org.fromJson(Map<String, dynamic> json) = _$_Org.fromJson;

  @override
  int get id;
  @override
  String? get name;
  @override
  String? get logo;
  @override
  String? get background;
  @override
  String? get bannerUrl;
  @override
  String? get slug;
  @override
  int? get flags;
  @override
  int? get inserted;
  @override
  @JsonKey(ignore: true)
  _$OrgCopyWith<_Org> get copyWith => throw _privateConstructorUsedError;
}

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return _Comment.fromJson(json);
}

/// @nodoc
class _$CommentTearOff {
  const _$CommentTearOff();

  _Comment call(
      {required int id,
      required UserBasicInfo author,
      required String message,
      @TimestampConverter() required DateTime inserted,
      int? deleted}) {
    return _Comment(
      id: id,
      author: author,
      message: message,
      inserted: inserted,
      deleted: deleted,
    );
  }

  Comment fromJson(Map<String, Object?> json) {
    return Comment.fromJson(json);
  }
}

/// @nodoc
const $Comment = _$CommentTearOff();

/// @nodoc
mixin _$Comment {
  int get id => throw _privateConstructorUsedError;
  UserBasicInfo get author => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get inserted => throw _privateConstructorUsedError;

  ///If not null, then the comment has been deleted.
  int? get deleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentCopyWith<Comment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentCopyWith<$Res> {
  factory $CommentCopyWith(Comment value, $Res Function(Comment) then) =
      _$CommentCopyWithImpl<$Res>;
  $Res call(
      {int id,
      UserBasicInfo author,
      String message,
      @TimestampConverter() DateTime inserted,
      int? deleted});
}

/// @nodoc
class _$CommentCopyWithImpl<$Res> implements $CommentCopyWith<$Res> {
  _$CommentCopyWithImpl(this._value, this._then);

  final Comment _value;
  // ignore: unused_field
  final $Res Function(Comment) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? author = freezed,
    Object? message = freezed,
    Object? inserted = freezed,
    Object? deleted = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as UserBasicInfo,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      inserted: inserted == freezed
          ? _value.inserted
          : inserted // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deleted: deleted == freezed
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$CommentCopyWith<$Res> implements $CommentCopyWith<$Res> {
  factory _$CommentCopyWith(_Comment value, $Res Function(_Comment) then) =
      __$CommentCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      UserBasicInfo author,
      String message,
      @TimestampConverter() DateTime inserted,
      int? deleted});
}

/// @nodoc
class __$CommentCopyWithImpl<$Res> extends _$CommentCopyWithImpl<$Res>
    implements _$CommentCopyWith<$Res> {
  __$CommentCopyWithImpl(_Comment _value, $Res Function(_Comment) _then)
      : super(_value, (v) => _then(v as _Comment));

  @override
  _Comment get _value => super._value as _Comment;

  @override
  $Res call({
    Object? id = freezed,
    Object? author = freezed,
    Object? message = freezed,
    Object? inserted = freezed,
    Object? deleted = freezed,
  }) {
    return _then(_Comment(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as UserBasicInfo,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      inserted: inserted == freezed
          ? _value.inserted
          : inserted // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deleted: deleted == freezed
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Comment implements _Comment {
  const _$_Comment(
      {required this.id,
      required this.author,
      required this.message,
      @TimestampConverter() required this.inserted,
      this.deleted});

  factory _$_Comment.fromJson(Map<String, dynamic> json) =>
      _$$_CommentFromJson(json);

  @override
  final int id;
  @override
  final UserBasicInfo author;
  @override
  final String message;
  @override
  @TimestampConverter()
  final DateTime inserted;
  @override

  ///If not null, then the comment has been deleted.
  final int? deleted;

  @override
  String toString() {
    return 'Comment(id: $id, author: $author, message: $message, inserted: $inserted, deleted: $deleted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Comment &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.author, author) &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.inserted, inserted) &&
            const DeepCollectionEquality().equals(other.deleted, deleted));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(author),
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(inserted),
      const DeepCollectionEquality().hash(deleted));

  @JsonKey(ignore: true)
  @override
  _$CommentCopyWith<_Comment> get copyWith =>
      __$CommentCopyWithImpl<_Comment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommentToJson(this);
  }
}

abstract class _Comment implements Comment {
  const factory _Comment(
      {required int id,
      required UserBasicInfo author,
      required String message,
      @TimestampConverter() required DateTime inserted,
      int? deleted}) = _$_Comment;

  factory _Comment.fromJson(Map<String, dynamic> json) = _$_Comment.fromJson;

  @override
  int get id;
  @override
  UserBasicInfo get author;
  @override
  String get message;
  @override
  @TimestampConverter()
  DateTime get inserted;
  @override

  ///If not null, then the comment has been deleted.
  int? get deleted;
  @override
  @JsonKey(ignore: true)
  _$CommentCopyWith<_Comment> get copyWith =>
      throw _privateConstructorUsedError;
}
