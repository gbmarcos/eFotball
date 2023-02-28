// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'org_featured_player.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrgFeaturedPlayer _$OrgFeaturedPlayerFromJson(Map<String, dynamic> json) {
  return _OrgFeaturedPlayer.fromJson(json);
}

/// @nodoc
class _$OrgFeaturedPlayerTearOff {
  const _$OrgFeaturedPlayerTearOff();

  _OrgFeaturedPlayer call(
      {required int id,
      int? userId,
      required String username,
      String? altUsername,
      String? image,
      String? firstName,
      String? lastName,
      int? birthDay,
      int? birthMonth,
      int? birthYear,
      int? countryId,
      required UserProfileStats stats}) {
    return _OrgFeaturedPlayer(
      id: id,
      userId: userId,
      username: username,
      altUsername: altUsername,
      image: image,
      firstName: firstName,
      lastName: lastName,
      birthDay: birthDay,
      birthMonth: birthMonth,
      birthYear: birthYear,
      countryId: countryId,
      stats: stats,
    );
  }

  OrgFeaturedPlayer fromJson(Map<String, Object?> json) {
    return OrgFeaturedPlayer.fromJson(json);
  }
}

/// @nodoc
const $OrgFeaturedPlayer = _$OrgFeaturedPlayerTearOff();

/// @nodoc
mixin _$OrgFeaturedPlayer {
  int get id => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;

  ///The username that this player's known as on other websites.
  String? get altUsername => throw _privateConstructorUsedError;

  ///The player's team picture.
  String? get image => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  int? get birthDay => throw _privateConstructorUsedError;
  int? get birthMonth => throw _privateConstructorUsedError;
  int? get birthYear => throw _privateConstructorUsedError;
  int? get countryId => throw _privateConstructorUsedError;
  UserProfileStats get stats => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrgFeaturedPlayerCopyWith<OrgFeaturedPlayer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrgFeaturedPlayerCopyWith<$Res> {
  factory $OrgFeaturedPlayerCopyWith(
          OrgFeaturedPlayer value, $Res Function(OrgFeaturedPlayer) then) =
      _$OrgFeaturedPlayerCopyWithImpl<$Res>;
  $Res call(
      {int id,
      int? userId,
      String username,
      String? altUsername,
      String? image,
      String? firstName,
      String? lastName,
      int? birthDay,
      int? birthMonth,
      int? birthYear,
      int? countryId,
      UserProfileStats stats});

  $UserProfileStatsCopyWith<$Res> get stats;
}

/// @nodoc
class _$OrgFeaturedPlayerCopyWithImpl<$Res>
    implements $OrgFeaturedPlayerCopyWith<$Res> {
  _$OrgFeaturedPlayerCopyWithImpl(this._value, this._then);

  final OrgFeaturedPlayer _value;
  // ignore: unused_field
  final $Res Function(OrgFeaturedPlayer) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? username = freezed,
    Object? altUsername = freezed,
    Object? image = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? birthDay = freezed,
    Object? birthMonth = freezed,
    Object? birthYear = freezed,
    Object? countryId = freezed,
    Object? stats = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      altUsername: altUsername == freezed
          ? _value.altUsername
          : altUsername // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDay: birthDay == freezed
          ? _value.birthDay
          : birthDay // ignore: cast_nullable_to_non_nullable
              as int?,
      birthMonth: birthMonth == freezed
          ? _value.birthMonth
          : birthMonth // ignore: cast_nullable_to_non_nullable
              as int?,
      birthYear: birthYear == freezed
          ? _value.birthYear
          : birthYear // ignore: cast_nullable_to_non_nullable
              as int?,
      countryId: countryId == freezed
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
      stats: stats == freezed
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as UserProfileStats,
    ));
  }

  @override
  $UserProfileStatsCopyWith<$Res> get stats {
    return $UserProfileStatsCopyWith<$Res>(_value.stats, (value) {
      return _then(_value.copyWith(stats: value));
    });
  }
}

/// @nodoc
abstract class _$OrgFeaturedPlayerCopyWith<$Res>
    implements $OrgFeaturedPlayerCopyWith<$Res> {
  factory _$OrgFeaturedPlayerCopyWith(
          _OrgFeaturedPlayer value, $Res Function(_OrgFeaturedPlayer) then) =
      __$OrgFeaturedPlayerCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      int? userId,
      String username,
      String? altUsername,
      String? image,
      String? firstName,
      String? lastName,
      int? birthDay,
      int? birthMonth,
      int? birthYear,
      int? countryId,
      UserProfileStats stats});

  @override
  $UserProfileStatsCopyWith<$Res> get stats;
}

/// @nodoc
class __$OrgFeaturedPlayerCopyWithImpl<$Res>
    extends _$OrgFeaturedPlayerCopyWithImpl<$Res>
    implements _$OrgFeaturedPlayerCopyWith<$Res> {
  __$OrgFeaturedPlayerCopyWithImpl(
      _OrgFeaturedPlayer _value, $Res Function(_OrgFeaturedPlayer) _then)
      : super(_value, (v) => _then(v as _OrgFeaturedPlayer));

  @override
  _OrgFeaturedPlayer get _value => super._value as _OrgFeaturedPlayer;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? username = freezed,
    Object? altUsername = freezed,
    Object? image = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? birthDay = freezed,
    Object? birthMonth = freezed,
    Object? birthYear = freezed,
    Object? countryId = freezed,
    Object? stats = freezed,
  }) {
    return _then(_OrgFeaturedPlayer(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      altUsername: altUsername == freezed
          ? _value.altUsername
          : altUsername // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDay: birthDay == freezed
          ? _value.birthDay
          : birthDay // ignore: cast_nullable_to_non_nullable
              as int?,
      birthMonth: birthMonth == freezed
          ? _value.birthMonth
          : birthMonth // ignore: cast_nullable_to_non_nullable
              as int?,
      birthYear: birthYear == freezed
          ? _value.birthYear
          : birthYear // ignore: cast_nullable_to_non_nullable
              as int?,
      countryId: countryId == freezed
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
      stats: stats == freezed
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as UserProfileStats,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrgFeaturedPlayer extends _OrgFeaturedPlayer {
  const _$_OrgFeaturedPlayer(
      {required this.id,
      this.userId,
      required this.username,
      this.altUsername,
      this.image,
      this.firstName,
      this.lastName,
      this.birthDay,
      this.birthMonth,
      this.birthYear,
      this.countryId,
      required this.stats})
      : super._();

  factory _$_OrgFeaturedPlayer.fromJson(Map<String, dynamic> json) =>
      _$$_OrgFeaturedPlayerFromJson(json);

  @override
  final int id;
  @override
  final int? userId;
  @override
  final String username;
  @override

  ///The username that this player's known as on other websites.
  final String? altUsername;
  @override

  ///The player's team picture.
  final String? image;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final int? birthDay;
  @override
  final int? birthMonth;
  @override
  final int? birthYear;
  @override
  final int? countryId;
  @override
  final UserProfileStats stats;

  @override
  String toString() {
    return 'OrgFeaturedPlayer(id: $id, userId: $userId, username: $username, altUsername: $altUsername, image: $image, firstName: $firstName, lastName: $lastName, birthDay: $birthDay, birthMonth: $birthMonth, birthYear: $birthYear, countryId: $countryId, stats: $stats)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrgFeaturedPlayer &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality()
                .equals(other.altUsername, altUsername) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality().equals(other.birthDay, birthDay) &&
            const DeepCollectionEquality()
                .equals(other.birthMonth, birthMonth) &&
            const DeepCollectionEquality().equals(other.birthYear, birthYear) &&
            const DeepCollectionEquality().equals(other.countryId, countryId) &&
            const DeepCollectionEquality().equals(other.stats, stats));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(altUsername),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(firstName),
      const DeepCollectionEquality().hash(lastName),
      const DeepCollectionEquality().hash(birthDay),
      const DeepCollectionEquality().hash(birthMonth),
      const DeepCollectionEquality().hash(birthYear),
      const DeepCollectionEquality().hash(countryId),
      const DeepCollectionEquality().hash(stats));

  @JsonKey(ignore: true)
  @override
  _$OrgFeaturedPlayerCopyWith<_OrgFeaturedPlayer> get copyWith =>
      __$OrgFeaturedPlayerCopyWithImpl<_OrgFeaturedPlayer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrgFeaturedPlayerToJson(this);
  }
}

abstract class _OrgFeaturedPlayer extends OrgFeaturedPlayer {
  const factory _OrgFeaturedPlayer(
      {required int id,
      int? userId,
      required String username,
      String? altUsername,
      String? image,
      String? firstName,
      String? lastName,
      int? birthDay,
      int? birthMonth,
      int? birthYear,
      int? countryId,
      required UserProfileStats stats}) = _$_OrgFeaturedPlayer;
  const _OrgFeaturedPlayer._() : super._();

  factory _OrgFeaturedPlayer.fromJson(Map<String, dynamic> json) =
      _$_OrgFeaturedPlayer.fromJson;

  @override
  int get id;
  @override
  int? get userId;
  @override
  String get username;
  @override

  ///The username that this player's known as on other websites.
  String? get altUsername;
  @override

  ///The player's team picture.
  String? get image;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  int? get birthDay;
  @override
  int? get birthMonth;
  @override
  int? get birthYear;
  @override
  int? get countryId;
  @override
  UserProfileStats get stats;
  @override
  @JsonKey(ignore: true)
  _$OrgFeaturedPlayerCopyWith<_OrgFeaturedPlayer> get copyWith =>
      throw _privateConstructorUsedError;
}

UserProfileStats _$UserProfileStatsFromJson(Map<String, dynamic> json) {
  return _UserProfileStats.fromJson(json);
}

/// @nodoc
class _$UserProfileStatsTearOff {
  const _$UserProfileStatsTearOff();

  _UserProfileStats call(
      {int? wins,
      int? losses,
      int? ties,
      int? drops,
      int? matches,
      int? goalsScored,
      int? goalsConceded}) {
    return _UserProfileStats(
      wins: wins,
      losses: losses,
      ties: ties,
      drops: drops,
      matches: matches,
      goalsScored: goalsScored,
      goalsConceded: goalsConceded,
    );
  }

  UserProfileStats fromJson(Map<String, Object?> json) {
    return UserProfileStats.fromJson(json);
  }
}

/// @nodoc
const $UserProfileStats = _$UserProfileStatsTearOff();

/// @nodoc
mixin _$UserProfileStats {
  int? get wins => throw _privateConstructorUsedError;
  int? get losses => throw _privateConstructorUsedError;
  int? get ties => throw _privateConstructorUsedError;
  int? get drops => throw _privateConstructorUsedError;
  int? get matches => throw _privateConstructorUsedError;
  int? get goalsScored => throw _privateConstructorUsedError;
  int? get goalsConceded => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileStatsCopyWith<UserProfileStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileStatsCopyWith<$Res> {
  factory $UserProfileStatsCopyWith(
          UserProfileStats value, $Res Function(UserProfileStats) then) =
      _$UserProfileStatsCopyWithImpl<$Res>;
  $Res call(
      {int? wins,
      int? losses,
      int? ties,
      int? drops,
      int? matches,
      int? goalsScored,
      int? goalsConceded});
}

/// @nodoc
class _$UserProfileStatsCopyWithImpl<$Res>
    implements $UserProfileStatsCopyWith<$Res> {
  _$UserProfileStatsCopyWithImpl(this._value, this._then);

  final UserProfileStats _value;
  // ignore: unused_field
  final $Res Function(UserProfileStats) _then;

  @override
  $Res call({
    Object? wins = freezed,
    Object? losses = freezed,
    Object? ties = freezed,
    Object? drops = freezed,
    Object? matches = freezed,
    Object? goalsScored = freezed,
    Object? goalsConceded = freezed,
  }) {
    return _then(_value.copyWith(
      wins: wins == freezed
          ? _value.wins
          : wins // ignore: cast_nullable_to_non_nullable
              as int?,
      losses: losses == freezed
          ? _value.losses
          : losses // ignore: cast_nullable_to_non_nullable
              as int?,
      ties: ties == freezed
          ? _value.ties
          : ties // ignore: cast_nullable_to_non_nullable
              as int?,
      drops: drops == freezed
          ? _value.drops
          : drops // ignore: cast_nullable_to_non_nullable
              as int?,
      matches: matches == freezed
          ? _value.matches
          : matches // ignore: cast_nullable_to_non_nullable
              as int?,
      goalsScored: goalsScored == freezed
          ? _value.goalsScored
          : goalsScored // ignore: cast_nullable_to_non_nullable
              as int?,
      goalsConceded: goalsConceded == freezed
          ? _value.goalsConceded
          : goalsConceded // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$UserProfileStatsCopyWith<$Res>
    implements $UserProfileStatsCopyWith<$Res> {
  factory _$UserProfileStatsCopyWith(
          _UserProfileStats value, $Res Function(_UserProfileStats) then) =
      __$UserProfileStatsCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? wins,
      int? losses,
      int? ties,
      int? drops,
      int? matches,
      int? goalsScored,
      int? goalsConceded});
}

/// @nodoc
class __$UserProfileStatsCopyWithImpl<$Res>
    extends _$UserProfileStatsCopyWithImpl<$Res>
    implements _$UserProfileStatsCopyWith<$Res> {
  __$UserProfileStatsCopyWithImpl(
      _UserProfileStats _value, $Res Function(_UserProfileStats) _then)
      : super(_value, (v) => _then(v as _UserProfileStats));

  @override
  _UserProfileStats get _value => super._value as _UserProfileStats;

  @override
  $Res call({
    Object? wins = freezed,
    Object? losses = freezed,
    Object? ties = freezed,
    Object? drops = freezed,
    Object? matches = freezed,
    Object? goalsScored = freezed,
    Object? goalsConceded = freezed,
  }) {
    return _then(_UserProfileStats(
      wins: wins == freezed
          ? _value.wins
          : wins // ignore: cast_nullable_to_non_nullable
              as int?,
      losses: losses == freezed
          ? _value.losses
          : losses // ignore: cast_nullable_to_non_nullable
              as int?,
      ties: ties == freezed
          ? _value.ties
          : ties // ignore: cast_nullable_to_non_nullable
              as int?,
      drops: drops == freezed
          ? _value.drops
          : drops // ignore: cast_nullable_to_non_nullable
              as int?,
      matches: matches == freezed
          ? _value.matches
          : matches // ignore: cast_nullable_to_non_nullable
              as int?,
      goalsScored: goalsScored == freezed
          ? _value.goalsScored
          : goalsScored // ignore: cast_nullable_to_non_nullable
              as int?,
      goalsConceded: goalsConceded == freezed
          ? _value.goalsConceded
          : goalsConceded // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserProfileStats extends _UserProfileStats {
  const _$_UserProfileStats(
      {this.wins,
      this.losses,
      this.ties,
      this.drops,
      this.matches,
      this.goalsScored,
      this.goalsConceded})
      : super._();

  factory _$_UserProfileStats.fromJson(Map<String, dynamic> json) =>
      _$$_UserProfileStatsFromJson(json);

  @override
  final int? wins;
  @override
  final int? losses;
  @override
  final int? ties;
  @override
  final int? drops;
  @override
  final int? matches;
  @override
  final int? goalsScored;
  @override
  final int? goalsConceded;

  @override
  String toString() {
    return 'UserProfileStats(wins: $wins, losses: $losses, ties: $ties, drops: $drops, matches: $matches, goalsScored: $goalsScored, goalsConceded: $goalsConceded)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserProfileStats &&
            const DeepCollectionEquality().equals(other.wins, wins) &&
            const DeepCollectionEquality().equals(other.losses, losses) &&
            const DeepCollectionEquality().equals(other.ties, ties) &&
            const DeepCollectionEquality().equals(other.drops, drops) &&
            const DeepCollectionEquality().equals(other.matches, matches) &&
            const DeepCollectionEquality()
                .equals(other.goalsScored, goalsScored) &&
            const DeepCollectionEquality()
                .equals(other.goalsConceded, goalsConceded));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(wins),
      const DeepCollectionEquality().hash(losses),
      const DeepCollectionEquality().hash(ties),
      const DeepCollectionEquality().hash(drops),
      const DeepCollectionEquality().hash(matches),
      const DeepCollectionEquality().hash(goalsScored),
      const DeepCollectionEquality().hash(goalsConceded));

  @JsonKey(ignore: true)
  @override
  _$UserProfileStatsCopyWith<_UserProfileStats> get copyWith =>
      __$UserProfileStatsCopyWithImpl<_UserProfileStats>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserProfileStatsToJson(this);
  }
}

abstract class _UserProfileStats extends UserProfileStats {
  const factory _UserProfileStats(
      {int? wins,
      int? losses,
      int? ties,
      int? drops,
      int? matches,
      int? goalsScored,
      int? goalsConceded}) = _$_UserProfileStats;
  const _UserProfileStats._() : super._();

  factory _UserProfileStats.fromJson(Map<String, dynamic> json) =
      _$_UserProfileStats.fromJson;

  @override
  int? get wins;
  @override
  int? get losses;
  @override
  int? get ties;
  @override
  int? get drops;
  @override
  int? get matches;
  @override
  int? get goalsScored;
  @override
  int? get goalsConceded;
  @override
  @JsonKey(ignore: true)
  _$UserProfileStatsCopyWith<_UserProfileStats> get copyWith =>
      throw _privateConstructorUsedError;
}
