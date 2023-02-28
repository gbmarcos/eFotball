// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_ranked.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserRanked _$UserRankedFromJson(Map<String, dynamic> json) {
  return _UserRanked.fromJson(json);
}

/// @nodoc
class _$UserRankedTearOff {
  const _$UserRankedTearOff();

  _UserRanked call(
      {int? id,
      required String username,
      String? avatar,
      int? countryId,
      Console? console,
      required int flags,
      int? elo,
      int? rank}) {
    return _UserRanked(
      id: id,
      username: username,
      avatar: avatar,
      countryId: countryId,
      console: console,
      flags: flags,
      elo: elo,
      rank: rank,
    );
  }

  UserRanked fromJson(Map<String, Object?> json) {
    return UserRanked.fromJson(json);
  }
}

/// @nodoc
const $UserRanked = _$UserRankedTearOff();

/// @nodoc
mixin _$UserRanked {
  int? get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  int? get countryId => throw _privateConstructorUsedError;
  Console? get console => throw _privateConstructorUsedError;
  int get flags => throw _privateConstructorUsedError;
  int? get elo => throw _privateConstructorUsedError;
  int? get rank => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRankedCopyWith<UserRanked> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRankedCopyWith<$Res> {
  factory $UserRankedCopyWith(
          UserRanked value, $Res Function(UserRanked) then) =
      _$UserRankedCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String username,
      String? avatar,
      int? countryId,
      Console? console,
      int flags,
      int? elo,
      int? rank});
}

/// @nodoc
class _$UserRankedCopyWithImpl<$Res> implements $UserRankedCopyWith<$Res> {
  _$UserRankedCopyWithImpl(this._value, this._then);

  final UserRanked _value;
  // ignore: unused_field
  final $Res Function(UserRanked) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? avatar = freezed,
    Object? countryId = freezed,
    Object? console = freezed,
    Object? flags = freezed,
    Object? elo = freezed,
    Object? rank = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      countryId: countryId == freezed
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
      console: console == freezed
          ? _value.console
          : console // ignore: cast_nullable_to_non_nullable
              as Console?,
      flags: flags == freezed
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as int,
      elo: elo == freezed
          ? _value.elo
          : elo // ignore: cast_nullable_to_non_nullable
              as int?,
      rank: rank == freezed
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$UserRankedCopyWith<$Res> implements $UserRankedCopyWith<$Res> {
  factory _$UserRankedCopyWith(
          _UserRanked value, $Res Function(_UserRanked) then) =
      __$UserRankedCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String username,
      String? avatar,
      int? countryId,
      Console? console,
      int flags,
      int? elo,
      int? rank});
}

/// @nodoc
class __$UserRankedCopyWithImpl<$Res> extends _$UserRankedCopyWithImpl<$Res>
    implements _$UserRankedCopyWith<$Res> {
  __$UserRankedCopyWithImpl(
      _UserRanked _value, $Res Function(_UserRanked) _then)
      : super(_value, (v) => _then(v as _UserRanked));

  @override
  _UserRanked get _value => super._value as _UserRanked;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? avatar = freezed,
    Object? countryId = freezed,
    Object? console = freezed,
    Object? flags = freezed,
    Object? elo = freezed,
    Object? rank = freezed,
  }) {
    return _then(_UserRanked(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      countryId: countryId == freezed
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
      console: console == freezed
          ? _value.console
          : console // ignore: cast_nullable_to_non_nullable
              as Console?,
      flags: flags == freezed
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as int,
      elo: elo == freezed
          ? _value.elo
          : elo // ignore: cast_nullable_to_non_nullable
              as int?,
      rank: rank == freezed
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@Implements<UserBasicInfo>()
class _$_UserRanked extends _UserRanked {
  _$_UserRanked(
      {this.id,
      required this.username,
      this.avatar,
      this.countryId,
      this.console,
      required this.flags,
      this.elo,
      this.rank})
      : super._();

  factory _$_UserRanked.fromJson(Map<String, dynamic> json) =>
      _$$_UserRankedFromJson(json);

  @override
  final int? id;
  @override
  final String username;
  @override
  final String? avatar;
  @override
  final int? countryId;
  @override
  final Console? console;
  @override
  final int flags;
  @override
  final int? elo;
  @override
  final int? rank;

  @override
  String toString() {
    return 'UserRanked(id: $id, username: $username, avatar: $avatar, countryId: $countryId, console: $console, flags: $flags, elo: $elo, rank: $rank)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserRanked &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.avatar, avatar) &&
            const DeepCollectionEquality().equals(other.countryId, countryId) &&
            const DeepCollectionEquality().equals(other.console, console) &&
            const DeepCollectionEquality().equals(other.flags, flags) &&
            const DeepCollectionEquality().equals(other.elo, elo) &&
            const DeepCollectionEquality().equals(other.rank, rank));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(avatar),
      const DeepCollectionEquality().hash(countryId),
      const DeepCollectionEquality().hash(console),
      const DeepCollectionEquality().hash(flags),
      const DeepCollectionEquality().hash(elo),
      const DeepCollectionEquality().hash(rank));

  @JsonKey(ignore: true)
  @override
  _$UserRankedCopyWith<_UserRanked> get copyWith =>
      __$UserRankedCopyWithImpl<_UserRanked>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserRankedToJson(this);
  }
}

abstract class _UserRanked extends UserRanked implements UserBasicInfo {
  factory _UserRanked(
      {int? id,
      required String username,
      String? avatar,
      int? countryId,
      Console? console,
      required int flags,
      int? elo,
      int? rank}) = _$_UserRanked;
  _UserRanked._() : super._();

  factory _UserRanked.fromJson(Map<String, dynamic> json) =
      _$_UserRanked.fromJson;

  @override
  int? get id;
  @override
  String get username;
  @override
  String? get avatar;
  @override
  int? get countryId;
  @override
  Console? get console;
  @override
  int get flags;
  @override
  int? get elo;
  @override
  int? get rank;
  @override
  @JsonKey(ignore: true)
  _$UserRankedCopyWith<_UserRanked> get copyWith =>
      throw _privateConstructorUsedError;
}
