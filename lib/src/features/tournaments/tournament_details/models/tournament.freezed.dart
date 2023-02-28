// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tournament.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TournamentLobbyBasic _$TournamentLobbyBasicFromJson(Map<String, dynamic> json) {
  return _TournamentLobbyBasic.fromJson(json);
}

/// @nodoc
class _$TournamentLobbyBasicTearOff {
  const _$TournamentLobbyBasicTearOff();

  _TournamentLobbyBasic call(
      {required int id,
      required int bracketId,
      @NullableTimestampConverter() DateTime? user1CheckIn,
      @NullableTimestampConverter() DateTime? user2CheckIn}) {
    return _TournamentLobbyBasic(
      id: id,
      bracketId: bracketId,
      user1CheckIn: user1CheckIn,
      user2CheckIn: user2CheckIn,
    );
  }

  TournamentLobbyBasic fromJson(Map<String, Object?> json) {
    return TournamentLobbyBasic.fromJson(json);
  }
}

/// @nodoc
const $TournamentLobbyBasic = _$TournamentLobbyBasicTearOff();

/// @nodoc
mixin _$TournamentLobbyBasic {
  int get id => throw _privateConstructorUsedError;
  int get bracketId => throw _privateConstructorUsedError;
  @NullableTimestampConverter()
  DateTime? get user1CheckIn => throw _privateConstructorUsedError;
  @NullableTimestampConverter()
  DateTime? get user2CheckIn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TournamentLobbyBasicCopyWith<TournamentLobbyBasic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TournamentLobbyBasicCopyWith<$Res> {
  factory $TournamentLobbyBasicCopyWith(TournamentLobbyBasic value,
          $Res Function(TournamentLobbyBasic) then) =
      _$TournamentLobbyBasicCopyWithImpl<$Res>;
  $Res call(
      {int id,
      int bracketId,
      @NullableTimestampConverter() DateTime? user1CheckIn,
      @NullableTimestampConverter() DateTime? user2CheckIn});
}

/// @nodoc
class _$TournamentLobbyBasicCopyWithImpl<$Res>
    implements $TournamentLobbyBasicCopyWith<$Res> {
  _$TournamentLobbyBasicCopyWithImpl(this._value, this._then);

  final TournamentLobbyBasic _value;
  // ignore: unused_field
  final $Res Function(TournamentLobbyBasic) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? bracketId = freezed,
    Object? user1CheckIn = freezed,
    Object? user2CheckIn = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      bracketId: bracketId == freezed
          ? _value.bracketId
          : bracketId // ignore: cast_nullable_to_non_nullable
              as int,
      user1CheckIn: user1CheckIn == freezed
          ? _value.user1CheckIn
          : user1CheckIn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      user2CheckIn: user2CheckIn == freezed
          ? _value.user2CheckIn
          : user2CheckIn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$TournamentLobbyBasicCopyWith<$Res>
    implements $TournamentLobbyBasicCopyWith<$Res> {
  factory _$TournamentLobbyBasicCopyWith(_TournamentLobbyBasic value,
          $Res Function(_TournamentLobbyBasic) then) =
      __$TournamentLobbyBasicCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      int bracketId,
      @NullableTimestampConverter() DateTime? user1CheckIn,
      @NullableTimestampConverter() DateTime? user2CheckIn});
}

/// @nodoc
class __$TournamentLobbyBasicCopyWithImpl<$Res>
    extends _$TournamentLobbyBasicCopyWithImpl<$Res>
    implements _$TournamentLobbyBasicCopyWith<$Res> {
  __$TournamentLobbyBasicCopyWithImpl(
      _TournamentLobbyBasic _value, $Res Function(_TournamentLobbyBasic) _then)
      : super(_value, (v) => _then(v as _TournamentLobbyBasic));

  @override
  _TournamentLobbyBasic get _value => super._value as _TournamentLobbyBasic;

  @override
  $Res call({
    Object? id = freezed,
    Object? bracketId = freezed,
    Object? user1CheckIn = freezed,
    Object? user2CheckIn = freezed,
  }) {
    return _then(_TournamentLobbyBasic(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      bracketId: bracketId == freezed
          ? _value.bracketId
          : bracketId // ignore: cast_nullable_to_non_nullable
              as int,
      user1CheckIn: user1CheckIn == freezed
          ? _value.user1CheckIn
          : user1CheckIn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      user2CheckIn: user2CheckIn == freezed
          ? _value.user2CheckIn
          : user2CheckIn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TournamentLobbyBasic extends _TournamentLobbyBasic {
  const _$_TournamentLobbyBasic(
      {required this.id,
      required this.bracketId,
      @NullableTimestampConverter() this.user1CheckIn,
      @NullableTimestampConverter() this.user2CheckIn})
      : super._();

  factory _$_TournamentLobbyBasic.fromJson(Map<String, dynamic> json) =>
      _$$_TournamentLobbyBasicFromJson(json);

  @override
  final int id;
  @override
  final int bracketId;
  @override
  @NullableTimestampConverter()
  final DateTime? user1CheckIn;
  @override
  @NullableTimestampConverter()
  final DateTime? user2CheckIn;

  @override
  String toString() {
    return 'TournamentLobbyBasic(id: $id, bracketId: $bracketId, user1CheckIn: $user1CheckIn, user2CheckIn: $user2CheckIn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TournamentLobbyBasic &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.bracketId, bracketId) &&
            const DeepCollectionEquality()
                .equals(other.user1CheckIn, user1CheckIn) &&
            const DeepCollectionEquality()
                .equals(other.user2CheckIn, user2CheckIn));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(bracketId),
      const DeepCollectionEquality().hash(user1CheckIn),
      const DeepCollectionEquality().hash(user2CheckIn));

  @JsonKey(ignore: true)
  @override
  _$TournamentLobbyBasicCopyWith<_TournamentLobbyBasic> get copyWith =>
      __$TournamentLobbyBasicCopyWithImpl<_TournamentLobbyBasic>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TournamentLobbyBasicToJson(this);
  }
}

abstract class _TournamentLobbyBasic extends TournamentLobbyBasic {
  const factory _TournamentLobbyBasic(
          {required int id,
          required int bracketId,
          @NullableTimestampConverter() DateTime? user1CheckIn,
          @NullableTimestampConverter() DateTime? user2CheckIn}) =
      _$_TournamentLobbyBasic;
  const _TournamentLobbyBasic._() : super._();

  factory _TournamentLobbyBasic.fromJson(Map<String, dynamic> json) =
      _$_TournamentLobbyBasic.fromJson;

  @override
  int get id;
  @override
  int get bracketId;
  @override
  @NullableTimestampConverter()
  DateTime? get user1CheckIn;
  @override
  @NullableTimestampConverter()
  DateTime? get user2CheckIn;
  @override
  @JsonKey(ignore: true)
  _$TournamentLobbyBasicCopyWith<_TournamentLobbyBasic> get copyWith =>
      throw _privateConstructorUsedError;
}

TournamentLobby _$TournamentLobbyFromJson(Map<String, dynamic> json) {
  return _TournamentLobby.fromJson(json);
}

/// @nodoc
class _$TournamentLobbyTearOff {
  const _$TournamentLobbyTearOff();

  _TournamentLobby call(
      {required int id,
      required int bracketId,
      @NullableTimestampConverter() DateTime? user1CheckIn,
      @NullableTimestampConverter() DateTime? user2CheckIn,
      required UserBasicInfo user1,
      required UserBasicInfo user2,
      int? matchId,
      required int tournamentId,
      @TimestampConverter() required DateTime walkoverTime}) {
    return _TournamentLobby(
      id: id,
      bracketId: bracketId,
      user1CheckIn: user1CheckIn,
      user2CheckIn: user2CheckIn,
      user1: user1,
      user2: user2,
      matchId: matchId,
      tournamentId: tournamentId,
      walkoverTime: walkoverTime,
    );
  }

  TournamentLobby fromJson(Map<String, Object?> json) {
    return TournamentLobby.fromJson(json);
  }
}

/// @nodoc
const $TournamentLobby = _$TournamentLobbyTearOff();

/// @nodoc
mixin _$TournamentLobby {
  int get id => throw _privateConstructorUsedError;
  int get bracketId => throw _privateConstructorUsedError;
  @NullableTimestampConverter()
  DateTime? get user1CheckIn => throw _privateConstructorUsedError;
  @NullableTimestampConverter()
  DateTime? get user2CheckIn => throw _privateConstructorUsedError;
  UserBasicInfo get user1 => throw _privateConstructorUsedError;
  UserBasicInfo get user2 => throw _privateConstructorUsedError;
  int? get matchId => throw _privateConstructorUsedError;
  int get tournamentId => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get walkoverTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TournamentLobbyCopyWith<TournamentLobby> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TournamentLobbyCopyWith<$Res> {
  factory $TournamentLobbyCopyWith(
          TournamentLobby value, $Res Function(TournamentLobby) then) =
      _$TournamentLobbyCopyWithImpl<$Res>;
  $Res call(
      {int id,
      int bracketId,
      @NullableTimestampConverter() DateTime? user1CheckIn,
      @NullableTimestampConverter() DateTime? user2CheckIn,
      UserBasicInfo user1,
      UserBasicInfo user2,
      int? matchId,
      int tournamentId,
      @TimestampConverter() DateTime walkoverTime});
}

/// @nodoc
class _$TournamentLobbyCopyWithImpl<$Res>
    implements $TournamentLobbyCopyWith<$Res> {
  _$TournamentLobbyCopyWithImpl(this._value, this._then);

  final TournamentLobby _value;
  // ignore: unused_field
  final $Res Function(TournamentLobby) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? bracketId = freezed,
    Object? user1CheckIn = freezed,
    Object? user2CheckIn = freezed,
    Object? user1 = freezed,
    Object? user2 = freezed,
    Object? matchId = freezed,
    Object? tournamentId = freezed,
    Object? walkoverTime = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      bracketId: bracketId == freezed
          ? _value.bracketId
          : bracketId // ignore: cast_nullable_to_non_nullable
              as int,
      user1CheckIn: user1CheckIn == freezed
          ? _value.user1CheckIn
          : user1CheckIn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      user2CheckIn: user2CheckIn == freezed
          ? _value.user2CheckIn
          : user2CheckIn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      user1: user1 == freezed
          ? _value.user1
          : user1 // ignore: cast_nullable_to_non_nullable
              as UserBasicInfo,
      user2: user2 == freezed
          ? _value.user2
          : user2 // ignore: cast_nullable_to_non_nullable
              as UserBasicInfo,
      matchId: matchId == freezed
          ? _value.matchId
          : matchId // ignore: cast_nullable_to_non_nullable
              as int?,
      tournamentId: tournamentId == freezed
          ? _value.tournamentId
          : tournamentId // ignore: cast_nullable_to_non_nullable
              as int,
      walkoverTime: walkoverTime == freezed
          ? _value.walkoverTime
          : walkoverTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$TournamentLobbyCopyWith<$Res>
    implements $TournamentLobbyCopyWith<$Res> {
  factory _$TournamentLobbyCopyWith(
          _TournamentLobby value, $Res Function(_TournamentLobby) then) =
      __$TournamentLobbyCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      int bracketId,
      @NullableTimestampConverter() DateTime? user1CheckIn,
      @NullableTimestampConverter() DateTime? user2CheckIn,
      UserBasicInfo user1,
      UserBasicInfo user2,
      int? matchId,
      int tournamentId,
      @TimestampConverter() DateTime walkoverTime});
}

/// @nodoc
class __$TournamentLobbyCopyWithImpl<$Res>
    extends _$TournamentLobbyCopyWithImpl<$Res>
    implements _$TournamentLobbyCopyWith<$Res> {
  __$TournamentLobbyCopyWithImpl(
      _TournamentLobby _value, $Res Function(_TournamentLobby) _then)
      : super(_value, (v) => _then(v as _TournamentLobby));

  @override
  _TournamentLobby get _value => super._value as _TournamentLobby;

  @override
  $Res call({
    Object? id = freezed,
    Object? bracketId = freezed,
    Object? user1CheckIn = freezed,
    Object? user2CheckIn = freezed,
    Object? user1 = freezed,
    Object? user2 = freezed,
    Object? matchId = freezed,
    Object? tournamentId = freezed,
    Object? walkoverTime = freezed,
  }) {
    return _then(_TournamentLobby(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      bracketId: bracketId == freezed
          ? _value.bracketId
          : bracketId // ignore: cast_nullable_to_non_nullable
              as int,
      user1CheckIn: user1CheckIn == freezed
          ? _value.user1CheckIn
          : user1CheckIn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      user2CheckIn: user2CheckIn == freezed
          ? _value.user2CheckIn
          : user2CheckIn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      user1: user1 == freezed
          ? _value.user1
          : user1 // ignore: cast_nullable_to_non_nullable
              as UserBasicInfo,
      user2: user2 == freezed
          ? _value.user2
          : user2 // ignore: cast_nullable_to_non_nullable
              as UserBasicInfo,
      matchId: matchId == freezed
          ? _value.matchId
          : matchId // ignore: cast_nullable_to_non_nullable
              as int?,
      tournamentId: tournamentId == freezed
          ? _value.tournamentId
          : tournamentId // ignore: cast_nullable_to_non_nullable
              as int,
      walkoverTime: walkoverTime == freezed
          ? _value.walkoverTime
          : walkoverTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TournamentLobby extends _TournamentLobby {
  const _$_TournamentLobby(
      {required this.id,
      required this.bracketId,
      @NullableTimestampConverter() this.user1CheckIn,
      @NullableTimestampConverter() this.user2CheckIn,
      required this.user1,
      required this.user2,
      this.matchId,
      required this.tournamentId,
      @TimestampConverter() required this.walkoverTime})
      : super._();

  factory _$_TournamentLobby.fromJson(Map<String, dynamic> json) =>
      _$$_TournamentLobbyFromJson(json);

  @override
  final int id;
  @override
  final int bracketId;
  @override
  @NullableTimestampConverter()
  final DateTime? user1CheckIn;
  @override
  @NullableTimestampConverter()
  final DateTime? user2CheckIn;
  @override
  final UserBasicInfo user1;
  @override
  final UserBasicInfo user2;
  @override
  final int? matchId;
  @override
  final int tournamentId;
  @override
  @TimestampConverter()
  final DateTime walkoverTime;

  @override
  String toString() {
    return 'TournamentLobby(id: $id, bracketId: $bracketId, user1CheckIn: $user1CheckIn, user2CheckIn: $user2CheckIn, user1: $user1, user2: $user2, matchId: $matchId, tournamentId: $tournamentId, walkoverTime: $walkoverTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TournamentLobby &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.bracketId, bracketId) &&
            const DeepCollectionEquality()
                .equals(other.user1CheckIn, user1CheckIn) &&
            const DeepCollectionEquality()
                .equals(other.user2CheckIn, user2CheckIn) &&
            const DeepCollectionEquality().equals(other.user1, user1) &&
            const DeepCollectionEquality().equals(other.user2, user2) &&
            const DeepCollectionEquality().equals(other.matchId, matchId) &&
            const DeepCollectionEquality()
                .equals(other.tournamentId, tournamentId) &&
            const DeepCollectionEquality()
                .equals(other.walkoverTime, walkoverTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(bracketId),
      const DeepCollectionEquality().hash(user1CheckIn),
      const DeepCollectionEquality().hash(user2CheckIn),
      const DeepCollectionEquality().hash(user1),
      const DeepCollectionEquality().hash(user2),
      const DeepCollectionEquality().hash(matchId),
      const DeepCollectionEquality().hash(tournamentId),
      const DeepCollectionEquality().hash(walkoverTime));

  @JsonKey(ignore: true)
  @override
  _$TournamentLobbyCopyWith<_TournamentLobby> get copyWith =>
      __$TournamentLobbyCopyWithImpl<_TournamentLobby>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TournamentLobbyToJson(this);
  }
}

abstract class _TournamentLobby extends TournamentLobby {
  const factory _TournamentLobby(
          {required int id,
          required int bracketId,
          @NullableTimestampConverter() DateTime? user1CheckIn,
          @NullableTimestampConverter() DateTime? user2CheckIn,
          required UserBasicInfo user1,
          required UserBasicInfo user2,
          int? matchId,
          required int tournamentId,
          @TimestampConverter() required DateTime walkoverTime}) =
      _$_TournamentLobby;
  const _TournamentLobby._() : super._();

  factory _TournamentLobby.fromJson(Map<String, dynamic> json) =
      _$_TournamentLobby.fromJson;

  @override
  int get id;
  @override
  int get bracketId;
  @override
  @NullableTimestampConverter()
  DateTime? get user1CheckIn;
  @override
  @NullableTimestampConverter()
  DateTime? get user2CheckIn;
  @override
  UserBasicInfo get user1;
  @override
  UserBasicInfo get user2;
  @override
  int? get matchId;
  @override
  int get tournamentId;
  @override
  @TimestampConverter()
  DateTime get walkoverTime;
  @override
  @JsonKey(ignore: true)
  _$TournamentLobbyCopyWith<_TournamentLobby> get copyWith =>
      throw _privateConstructorUsedError;
}

League _$LeagueFromJson(Map<String, dynamic> json) {
  return _League.fromJson(json);
}

/// @nodoc
class _$LeagueTearOff {
  const _$LeagueTearOff();

  _League call(
      {required int id,
      required String name,
      String? logo,
      int? countryId,
      required int inserted}) {
    return _League(
      id: id,
      name: name,
      logo: logo,
      countryId: countryId,
      inserted: inserted,
    );
  }

  League fromJson(Map<String, Object?> json) {
    return League.fromJson(json);
  }
}

/// @nodoc
const $League = _$LeagueTearOff();

/// @nodoc
mixin _$League {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;
  int? get countryId => throw _privateConstructorUsedError;
  int get inserted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeagueCopyWith<League> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeagueCopyWith<$Res> {
  factory $LeagueCopyWith(League value, $Res Function(League) then) =
      _$LeagueCopyWithImpl<$Res>;
  $Res call({int id, String name, String? logo, int? countryId, int inserted});
}

/// @nodoc
class _$LeagueCopyWithImpl<$Res> implements $LeagueCopyWith<$Res> {
  _$LeagueCopyWithImpl(this._value, this._then);

  final League _value;
  // ignore: unused_field
  final $Res Function(League) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? logo = freezed,
    Object? countryId = freezed,
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
      countryId: countryId == freezed
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
      inserted: inserted == freezed
          ? _value.inserted
          : inserted // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$LeagueCopyWith<$Res> implements $LeagueCopyWith<$Res> {
  factory _$LeagueCopyWith(_League value, $Res Function(_League) then) =
      __$LeagueCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name, String? logo, int? countryId, int inserted});
}

/// @nodoc
class __$LeagueCopyWithImpl<$Res> extends _$LeagueCopyWithImpl<$Res>
    implements _$LeagueCopyWith<$Res> {
  __$LeagueCopyWithImpl(_League _value, $Res Function(_League) _then)
      : super(_value, (v) => _then(v as _League));

  @override
  _League get _value => super._value as _League;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? logo = freezed,
    Object? countryId = freezed,
    Object? inserted = freezed,
  }) {
    return _then(_League(
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
      countryId: countryId == freezed
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
      inserted: inserted == freezed
          ? _value.inserted
          : inserted // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_League implements _League {
  const _$_League(
      {required this.id,
      required this.name,
      this.logo,
      this.countryId,
      required this.inserted});

  factory _$_League.fromJson(Map<String, dynamic> json) =>
      _$$_LeagueFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? logo;
  @override
  final int? countryId;
  @override
  final int inserted;

  @override
  String toString() {
    return 'League(id: $id, name: $name, logo: $logo, countryId: $countryId, inserted: $inserted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _League &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.logo, logo) &&
            const DeepCollectionEquality().equals(other.countryId, countryId) &&
            const DeepCollectionEquality().equals(other.inserted, inserted));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(logo),
      const DeepCollectionEquality().hash(countryId),
      const DeepCollectionEquality().hash(inserted));

  @JsonKey(ignore: true)
  @override
  _$LeagueCopyWith<_League> get copyWith =>
      __$LeagueCopyWithImpl<_League>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LeagueToJson(this);
  }
}

abstract class _League implements League {
  const factory _League(
      {required int id,
      required String name,
      String? logo,
      int? countryId,
      required int inserted}) = _$_League;

  factory _League.fromJson(Map<String, dynamic> json) = _$_League.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get logo;
  @override
  int? get countryId;
  @override
  int get inserted;
  @override
  @JsonKey(ignore: true)
  _$LeagueCopyWith<_League> get copyWith => throw _privateConstructorUsedError;
}

TournamentPrize _$TournamentPrizeFromJson(Map<String, dynamic> json) {
  return _TournamentPrize.fromJson(json);
}

/// @nodoc
class _$TournamentPrizeTearOff {
  const _$TournamentPrizeTearOff();

  _TournamentPrize call(
      {required int place,
      required String title,
      required String amount,
      String? image}) {
    return _TournamentPrize(
      place: place,
      title: title,
      amount: amount,
      image: image,
    );
  }

  TournamentPrize fromJson(Map<String, Object?> json) {
    return TournamentPrize.fromJson(json);
  }
}

/// @nodoc
const $TournamentPrize = _$TournamentPrizeTearOff();

/// @nodoc
mixin _$TournamentPrize {
  int get place => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get amount => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TournamentPrizeCopyWith<TournamentPrize> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TournamentPrizeCopyWith<$Res> {
  factory $TournamentPrizeCopyWith(
          TournamentPrize value, $Res Function(TournamentPrize) then) =
      _$TournamentPrizeCopyWithImpl<$Res>;
  $Res call({int place, String title, String amount, String? image});
}

/// @nodoc
class _$TournamentPrizeCopyWithImpl<$Res>
    implements $TournamentPrizeCopyWith<$Res> {
  _$TournamentPrizeCopyWithImpl(this._value, this._then);

  final TournamentPrize _value;
  // ignore: unused_field
  final $Res Function(TournamentPrize) _then;

  @override
  $Res call({
    Object? place = freezed,
    Object? title = freezed,
    Object? amount = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      place: place == freezed
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$TournamentPrizeCopyWith<$Res>
    implements $TournamentPrizeCopyWith<$Res> {
  factory _$TournamentPrizeCopyWith(
          _TournamentPrize value, $Res Function(_TournamentPrize) then) =
      __$TournamentPrizeCopyWithImpl<$Res>;
  @override
  $Res call({int place, String title, String amount, String? image});
}

/// @nodoc
class __$TournamentPrizeCopyWithImpl<$Res>
    extends _$TournamentPrizeCopyWithImpl<$Res>
    implements _$TournamentPrizeCopyWith<$Res> {
  __$TournamentPrizeCopyWithImpl(
      _TournamentPrize _value, $Res Function(_TournamentPrize) _then)
      : super(_value, (v) => _then(v as _TournamentPrize));

  @override
  _TournamentPrize get _value => super._value as _TournamentPrize;

  @override
  $Res call({
    Object? place = freezed,
    Object? title = freezed,
    Object? amount = freezed,
    Object? image = freezed,
  }) {
    return _then(_TournamentPrize(
      place: place == freezed
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TournamentPrize implements _TournamentPrize {
  const _$_TournamentPrize(
      {required this.place,
      required this.title,
      required this.amount,
      this.image});

  factory _$_TournamentPrize.fromJson(Map<String, dynamic> json) =>
      _$$_TournamentPrizeFromJson(json);

  @override
  final int place;
  @override
  final String title;
  @override
  final String amount;
  @override
  final String? image;

  @override
  String toString() {
    return 'TournamentPrize(place: $place, title: $title, amount: $amount, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TournamentPrize &&
            const DeepCollectionEquality().equals(other.place, place) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.image, image));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(place),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(image));

  @JsonKey(ignore: true)
  @override
  _$TournamentPrizeCopyWith<_TournamentPrize> get copyWith =>
      __$TournamentPrizeCopyWithImpl<_TournamentPrize>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TournamentPrizeToJson(this);
  }
}

abstract class _TournamentPrize implements TournamentPrize {
  const factory _TournamentPrize(
      {required int place,
      required String title,
      required String amount,
      String? image}) = _$_TournamentPrize;

  factory _TournamentPrize.fromJson(Map<String, dynamic> json) =
      _$_TournamentPrize.fromJson;

  @override
  int get place;
  @override
  String get title;
  @override
  String get amount;
  @override
  String? get image;
  @override
  @JsonKey(ignore: true)
  _$TournamentPrizeCopyWith<_TournamentPrize> get copyWith =>
      throw _privateConstructorUsedError;
}
