// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'org.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Org _$OrgFromJson(Map<String, dynamic> json) {
  return _Org.fromJson(json);
}

/// @nodoc
class _$OrgTearOff {
  const _$OrgTearOff();

  _Org call(
      {required int id,
      required String name,
      required String logo,
      String? background,
      String? bannerUrl,
      required String slug,
      required int flags,
      @TimestampConverter() required DateTime inserted,
      int? memberCount,
      List<Club>? parents,
      List<Club>? children,
      List<Club>? siblings}) {
    return _Org(
      id: id,
      name: name,
      logo: logo,
      background: background,
      bannerUrl: bannerUrl,
      slug: slug,
      flags: flags,
      inserted: inserted,
      memberCount: memberCount,
      parents: parents,
      children: children,
      siblings: siblings,
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
  String get name => throw _privateConstructorUsedError;
  String get logo => throw _privateConstructorUsedError;
  String? get background => throw _privateConstructorUsedError;
  String? get bannerUrl => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  int get flags => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get inserted => throw _privateConstructorUsedError;
  int? get memberCount => throw _privateConstructorUsedError;
  List<Club>? get parents => throw _privateConstructorUsedError;
  List<Club>? get children => throw _privateConstructorUsedError;
  List<Club>? get siblings => throw _privateConstructorUsedError;

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
      String name,
      String logo,
      String? background,
      String? bannerUrl,
      String slug,
      int flags,
      @TimestampConverter() DateTime inserted,
      int? memberCount,
      List<Club>? parents,
      List<Club>? children,
      List<Club>? siblings});
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
    Object? memberCount = freezed,
    Object? parents = freezed,
    Object? children = freezed,
    Object? siblings = freezed,
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
      logo: logo == freezed
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
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
              as String,
      flags: flags == freezed
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as int,
      inserted: inserted == freezed
          ? _value.inserted
          : inserted // ignore: cast_nullable_to_non_nullable
              as DateTime,
      memberCount: memberCount == freezed
          ? _value.memberCount
          : memberCount // ignore: cast_nullable_to_non_nullable
              as int?,
      parents: parents == freezed
          ? _value.parents
          : parents // ignore: cast_nullable_to_non_nullable
              as List<Club>?,
      children: children == freezed
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<Club>?,
      siblings: siblings == freezed
          ? _value.siblings
          : siblings // ignore: cast_nullable_to_non_nullable
              as List<Club>?,
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
      String name,
      String logo,
      String? background,
      String? bannerUrl,
      String slug,
      int flags,
      @TimestampConverter() DateTime inserted,
      int? memberCount,
      List<Club>? parents,
      List<Club>? children,
      List<Club>? siblings});
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
    Object? memberCount = freezed,
    Object? parents = freezed,
    Object? children = freezed,
    Object? siblings = freezed,
  }) {
    return _then(_Org(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      logo: logo == freezed
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
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
              as String,
      flags: flags == freezed
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as int,
      inserted: inserted == freezed
          ? _value.inserted
          : inserted // ignore: cast_nullable_to_non_nullable
              as DateTime,
      memberCount: memberCount == freezed
          ? _value.memberCount
          : memberCount // ignore: cast_nullable_to_non_nullable
              as int?,
      parents: parents == freezed
          ? _value.parents
          : parents // ignore: cast_nullable_to_non_nullable
              as List<Club>?,
      children: children == freezed
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<Club>?,
      siblings: siblings == freezed
          ? _value.siblings
          : siblings // ignore: cast_nullable_to_non_nullable
              as List<Club>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@Implements<OrgRef>()
class _$_Org implements _Org {
  const _$_Org(
      {required this.id,
      required this.name,
      required this.logo,
      this.background,
      this.bannerUrl,
      required this.slug,
      required this.flags,
      @TimestampConverter() required this.inserted,
      this.memberCount,
      this.parents,
      this.children,
      this.siblings});

  factory _$_Org.fromJson(Map<String, dynamic> json) => _$$_OrgFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String logo;
  @override
  final String? background;
  @override
  final String? bannerUrl;
  @override
  final String slug;
  @override
  final int flags;
  @override
  @TimestampConverter()
  final DateTime inserted;
  @override
  final int? memberCount;
  @override
  final List<Club>? parents;
  @override
  final List<Club>? children;
  @override
  final List<Club>? siblings;

  @override
  String toString() {
    return 'Org(id: $id, name: $name, logo: $logo, background: $background, bannerUrl: $bannerUrl, slug: $slug, flags: $flags, inserted: $inserted, memberCount: $memberCount, parents: $parents, children: $children, siblings: $siblings)';
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
            const DeepCollectionEquality().equals(other.inserted, inserted) &&
            const DeepCollectionEquality()
                .equals(other.memberCount, memberCount) &&
            const DeepCollectionEquality().equals(other.parents, parents) &&
            const DeepCollectionEquality().equals(other.children, children) &&
            const DeepCollectionEquality().equals(other.siblings, siblings));
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
      const DeepCollectionEquality().hash(inserted),
      const DeepCollectionEquality().hash(memberCount),
      const DeepCollectionEquality().hash(parents),
      const DeepCollectionEquality().hash(children),
      const DeepCollectionEquality().hash(siblings));

  @JsonKey(ignore: true)
  @override
  _$OrgCopyWith<_Org> get copyWith =>
      __$OrgCopyWithImpl<_Org>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrgToJson(this);
  }
}

abstract class _Org implements Org, OrgRef {
  const factory _Org(
      {required int id,
      required String name,
      required String logo,
      String? background,
      String? bannerUrl,
      required String slug,
      required int flags,
      @TimestampConverter() required DateTime inserted,
      int? memberCount,
      List<Club>? parents,
      List<Club>? children,
      List<Club>? siblings}) = _$_Org;

  factory _Org.fromJson(Map<String, dynamic> json) = _$_Org.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get logo;
  @override
  String? get background;
  @override
  String? get bannerUrl;
  @override
  String get slug;
  @override
  int get flags;
  @override
  @TimestampConverter()
  DateTime get inserted;
  @override
  int? get memberCount;
  @override
  List<Club>? get parents;
  @override
  List<Club>? get children;
  @override
  List<Club>? get siblings;
  @override
  @JsonKey(ignore: true)
  _$OrgCopyWith<_Org> get copyWith => throw _privateConstructorUsedError;
}
