// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'club.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Club _$ClubFromJson(Map<String, dynamic> json) {
  return _Club.fromJson(json);
}

/// @nodoc
class _$ClubTearOff {
  const _$ClubTearOff();

  _Club call(
      {required int id,
      required String name,
      String? logo,
      String? background,
      String? bannerUrl,
      required String slug,
      required int flags,
      @TimestampConverter() required DateTime inserted}) {
    return _Club(
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

  Club fromJson(Map<String, Object?> json) {
    return Club.fromJson(json);
  }
}

/// @nodoc
const $Club = _$ClubTearOff();

/// @nodoc
mixin _$Club {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;
  String? get background => throw _privateConstructorUsedError;
  String? get bannerUrl => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  int get flags => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get inserted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClubCopyWith<Club> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClubCopyWith<$Res> {
  factory $ClubCopyWith(Club value, $Res Function(Club) then) =
      _$ClubCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      String? logo,
      String? background,
      String? bannerUrl,
      String slug,
      int flags,
      @TimestampConverter() DateTime inserted});
}

/// @nodoc
class _$ClubCopyWithImpl<$Res> implements $ClubCopyWith<$Res> {
  _$ClubCopyWithImpl(this._value, this._then);

  final Club _value;
  // ignore: unused_field
  final $Res Function(Club) _then;

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
              as String,
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
              as String,
      flags: flags == freezed
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as int,
      inserted: inserted == freezed
          ? _value.inserted
          : inserted // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$ClubCopyWith<$Res> implements $ClubCopyWith<$Res> {
  factory _$ClubCopyWith(_Club value, $Res Function(_Club) then) =
      __$ClubCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      String? logo,
      String? background,
      String? bannerUrl,
      String slug,
      int flags,
      @TimestampConverter() DateTime inserted});
}

/// @nodoc
class __$ClubCopyWithImpl<$Res> extends _$ClubCopyWithImpl<$Res>
    implements _$ClubCopyWith<$Res> {
  __$ClubCopyWithImpl(_Club _value, $Res Function(_Club) _then)
      : super(_value, (v) => _then(v as _Club));

  @override
  _Club get _value => super._value as _Club;

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
    return _then(_Club(
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
              as String,
      flags: flags == freezed
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as int,
      inserted: inserted == freezed
          ? _value.inserted
          : inserted // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@Implements<OrgRef>()
class _$_Club implements _Club {
  const _$_Club(
      {required this.id,
      required this.name,
      this.logo,
      this.background,
      this.bannerUrl,
      required this.slug,
      required this.flags,
      @TimestampConverter() required this.inserted});

  factory _$_Club.fromJson(Map<String, dynamic> json) => _$$_ClubFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? logo;
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
  String toString() {
    return 'Club(id: $id, name: $name, logo: $logo, background: $background, bannerUrl: $bannerUrl, slug: $slug, flags: $flags, inserted: $inserted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Club &&
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
  _$ClubCopyWith<_Club> get copyWith =>
      __$ClubCopyWithImpl<_Club>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClubToJson(this);
  }
}

abstract class _Club implements Club, OrgRef {
  const factory _Club(
      {required int id,
      required String name,
      String? logo,
      String? background,
      String? bannerUrl,
      required String slug,
      required int flags,
      @TimestampConverter() required DateTime inserted}) = _$_Club;

  factory _Club.fromJson(Map<String, dynamic> json) = _$_Club.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get logo;
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
  @JsonKey(ignore: true)
  _$ClubCopyWith<_Club> get copyWith => throw _privateConstructorUsedError;
}
