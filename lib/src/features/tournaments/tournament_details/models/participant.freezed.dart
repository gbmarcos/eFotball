// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'participant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TournamentParticipant _$TournamentParticipantFromJson(
    Map<String, dynamic> json) {
  return _TournamentParticipant.fromJson(json);
}

/// @nodoc
class _$TournamentParticipantTearOff {
  const _$TournamentParticipantTearOff();

  _TournamentParticipant call(
      {required int id,
      required String username,
      String? avatar,
      int? countryId,
      Console? console,
      required int flags,
      int? teamId,
      required int wins,
      required int losses,
      required int ties,
      required int drops,
      required int matches,
      required int goalsScored,
      required int goalsConceded,
      int? score,
      int? subscore,
      required int elo,
      int? globalElo,
      Team? team,
      required int rank,
      required String gamerTag}) {
    return _TournamentParticipant(
      id: id,
      username: username,
      avatar: avatar,
      countryId: countryId,
      console: console,
      flags: flags,
      teamId: teamId,
      wins: wins,
      losses: losses,
      ties: ties,
      drops: drops,
      matches: matches,
      goalsScored: goalsScored,
      goalsConceded: goalsConceded,
      score: score,
      subscore: subscore,
      elo: elo,
      globalElo: globalElo,
      team: team,
      rank: rank,
      gamerTag: gamerTag,
    );
  }

  TournamentParticipant fromJson(Map<String, Object?> json) {
    return TournamentParticipant.fromJson(json);
  }
}

/// @nodoc
const $TournamentParticipant = _$TournamentParticipantTearOff();

/// @nodoc
mixin _$TournamentParticipant {
  int get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  int? get countryId => throw _privateConstructorUsedError;
  Console? get console => throw _privateConstructorUsedError;
  int get flags => throw _privateConstructorUsedError;
  int? get teamId => throw _privateConstructorUsedError;
  int get wins => throw _privateConstructorUsedError;
  int get losses => throw _privateConstructorUsedError;
  int get ties => throw _privateConstructorUsedError;
  int get drops => throw _privateConstructorUsedError;
  int get matches => throw _privateConstructorUsedError;
  int get goalsScored => throw _privateConstructorUsedError;
  int get goalsConceded => throw _privateConstructorUsedError;
  int? get score => throw _privateConstructorUsedError;
  int? get subscore => throw _privateConstructorUsedError;
  int get elo => throw _privateConstructorUsedError;
  int? get globalElo => throw _privateConstructorUsedError;
  Team? get team => throw _privateConstructorUsedError;
  int get rank => throw _privateConstructorUsedError;
  String get gamerTag => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TournamentParticipantCopyWith<TournamentParticipant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TournamentParticipantCopyWith<$Res> {
  factory $TournamentParticipantCopyWith(TournamentParticipant value,
          $Res Function(TournamentParticipant) then) =
      _$TournamentParticipantCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String username,
      String? avatar,
      int? countryId,
      Console? console,
      int flags,
      int? teamId,
      int wins,
      int losses,
      int ties,
      int drops,
      int matches,
      int goalsScored,
      int goalsConceded,
      int? score,
      int? subscore,
      int elo,
      int? globalElo,
      Team? team,
      int rank,
      String gamerTag});

  $TeamCopyWith<$Res>? get team;
}

/// @nodoc
class _$TournamentParticipantCopyWithImpl<$Res>
    implements $TournamentParticipantCopyWith<$Res> {
  _$TournamentParticipantCopyWithImpl(this._value, this._then);

  final TournamentParticipant _value;
  // ignore: unused_field
  final $Res Function(TournamentParticipant) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? avatar = freezed,
    Object? countryId = freezed,
    Object? console = freezed,
    Object? flags = freezed,
    Object? teamId = freezed,
    Object? wins = freezed,
    Object? losses = freezed,
    Object? ties = freezed,
    Object? drops = freezed,
    Object? matches = freezed,
    Object? goalsScored = freezed,
    Object? goalsConceded = freezed,
    Object? score = freezed,
    Object? subscore = freezed,
    Object? elo = freezed,
    Object? globalElo = freezed,
    Object? team = freezed,
    Object? rank = freezed,
    Object? gamerTag = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
      teamId: teamId == freezed
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as int?,
      wins: wins == freezed
          ? _value.wins
          : wins // ignore: cast_nullable_to_non_nullable
              as int,
      losses: losses == freezed
          ? _value.losses
          : losses // ignore: cast_nullable_to_non_nullable
              as int,
      ties: ties == freezed
          ? _value.ties
          : ties // ignore: cast_nullable_to_non_nullable
              as int,
      drops: drops == freezed
          ? _value.drops
          : drops // ignore: cast_nullable_to_non_nullable
              as int,
      matches: matches == freezed
          ? _value.matches
          : matches // ignore: cast_nullable_to_non_nullable
              as int,
      goalsScored: goalsScored == freezed
          ? _value.goalsScored
          : goalsScored // ignore: cast_nullable_to_non_nullable
              as int,
      goalsConceded: goalsConceded == freezed
          ? _value.goalsConceded
          : goalsConceded // ignore: cast_nullable_to_non_nullable
              as int,
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      subscore: subscore == freezed
          ? _value.subscore
          : subscore // ignore: cast_nullable_to_non_nullable
              as int?,
      elo: elo == freezed
          ? _value.elo
          : elo // ignore: cast_nullable_to_non_nullable
              as int,
      globalElo: globalElo == freezed
          ? _value.globalElo
          : globalElo // ignore: cast_nullable_to_non_nullable
              as int?,
      team: team == freezed
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as Team?,
      rank: rank == freezed
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      gamerTag: gamerTag == freezed
          ? _value.gamerTag
          : gamerTag // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $TeamCopyWith<$Res>? get team {
    if (_value.team == null) {
      return null;
    }

    return $TeamCopyWith<$Res>(_value.team!, (value) {
      return _then(_value.copyWith(team: value));
    });
  }
}

/// @nodoc
abstract class _$TournamentParticipantCopyWith<$Res>
    implements $TournamentParticipantCopyWith<$Res> {
  factory _$TournamentParticipantCopyWith(_TournamentParticipant value,
          $Res Function(_TournamentParticipant) then) =
      __$TournamentParticipantCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String username,
      String? avatar,
      int? countryId,
      Console? console,
      int flags,
      int? teamId,
      int wins,
      int losses,
      int ties,
      int drops,
      int matches,
      int goalsScored,
      int goalsConceded,
      int? score,
      int? subscore,
      int elo,
      int? globalElo,
      Team? team,
      int rank,
      String gamerTag});

  @override
  $TeamCopyWith<$Res>? get team;
}

/// @nodoc
class __$TournamentParticipantCopyWithImpl<$Res>
    extends _$TournamentParticipantCopyWithImpl<$Res>
    implements _$TournamentParticipantCopyWith<$Res> {
  __$TournamentParticipantCopyWithImpl(_TournamentParticipant _value,
      $Res Function(_TournamentParticipant) _then)
      : super(_value, (v) => _then(v as _TournamentParticipant));

  @override
  _TournamentParticipant get _value => super._value as _TournamentParticipant;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? avatar = freezed,
    Object? countryId = freezed,
    Object? console = freezed,
    Object? flags = freezed,
    Object? teamId = freezed,
    Object? wins = freezed,
    Object? losses = freezed,
    Object? ties = freezed,
    Object? drops = freezed,
    Object? matches = freezed,
    Object? goalsScored = freezed,
    Object? goalsConceded = freezed,
    Object? score = freezed,
    Object? subscore = freezed,
    Object? elo = freezed,
    Object? globalElo = freezed,
    Object? team = freezed,
    Object? rank = freezed,
    Object? gamerTag = freezed,
  }) {
    return _then(_TournamentParticipant(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
      teamId: teamId == freezed
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as int?,
      wins: wins == freezed
          ? _value.wins
          : wins // ignore: cast_nullable_to_non_nullable
              as int,
      losses: losses == freezed
          ? _value.losses
          : losses // ignore: cast_nullable_to_non_nullable
              as int,
      ties: ties == freezed
          ? _value.ties
          : ties // ignore: cast_nullable_to_non_nullable
              as int,
      drops: drops == freezed
          ? _value.drops
          : drops // ignore: cast_nullable_to_non_nullable
              as int,
      matches: matches == freezed
          ? _value.matches
          : matches // ignore: cast_nullable_to_non_nullable
              as int,
      goalsScored: goalsScored == freezed
          ? _value.goalsScored
          : goalsScored // ignore: cast_nullable_to_non_nullable
              as int,
      goalsConceded: goalsConceded == freezed
          ? _value.goalsConceded
          : goalsConceded // ignore: cast_nullable_to_non_nullable
              as int,
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      subscore: subscore == freezed
          ? _value.subscore
          : subscore // ignore: cast_nullable_to_non_nullable
              as int?,
      elo: elo == freezed
          ? _value.elo
          : elo // ignore: cast_nullable_to_non_nullable
              as int,
      globalElo: globalElo == freezed
          ? _value.globalElo
          : globalElo // ignore: cast_nullable_to_non_nullable
              as int?,
      team: team == freezed
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as Team?,
      rank: rank == freezed
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      gamerTag: gamerTag == freezed
          ? _value.gamerTag
          : gamerTag // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TournamentParticipant extends _TournamentParticipant {
  const _$_TournamentParticipant(
      {required this.id,
      required this.username,
      this.avatar,
      this.countryId,
      this.console,
      required this.flags,
      this.teamId,
      required this.wins,
      required this.losses,
      required this.ties,
      required this.drops,
      required this.matches,
      required this.goalsScored,
      required this.goalsConceded,
      this.score,
      this.subscore,
      required this.elo,
      this.globalElo,
      this.team,
      required this.rank,
      required this.gamerTag})
      : super._();

  factory _$_TournamentParticipant.fromJson(Map<String, dynamic> json) =>
      _$$_TournamentParticipantFromJson(json);

  @override
  final int id;
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
  final int? teamId;
  @override
  final int wins;
  @override
  final int losses;
  @override
  final int ties;
  @override
  final int drops;
  @override
  final int matches;
  @override
  final int goalsScored;
  @override
  final int goalsConceded;
  @override
  final int? score;
  @override
  final int? subscore;
  @override
  final int elo;
  @override
  final int? globalElo;
  @override
  final Team? team;
  @override
  final int rank;
  @override
  final String gamerTag;

  @override
  String toString() {
    return 'TournamentParticipant(id: $id, username: $username, avatar: $avatar, countryId: $countryId, console: $console, flags: $flags, teamId: $teamId, wins: $wins, losses: $losses, ties: $ties, drops: $drops, matches: $matches, goalsScored: $goalsScored, goalsConceded: $goalsConceded, score: $score, subscore: $subscore, elo: $elo, globalElo: $globalElo, team: $team, rank: $rank, gamerTag: $gamerTag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TournamentParticipant &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.avatar, avatar) &&
            const DeepCollectionEquality().equals(other.countryId, countryId) &&
            const DeepCollectionEquality().equals(other.console, console) &&
            const DeepCollectionEquality().equals(other.flags, flags) &&
            const DeepCollectionEquality().equals(other.teamId, teamId) &&
            const DeepCollectionEquality().equals(other.wins, wins) &&
            const DeepCollectionEquality().equals(other.losses, losses) &&
            const DeepCollectionEquality().equals(other.ties, ties) &&
            const DeepCollectionEquality().equals(other.drops, drops) &&
            const DeepCollectionEquality().equals(other.matches, matches) &&
            const DeepCollectionEquality()
                .equals(other.goalsScored, goalsScored) &&
            const DeepCollectionEquality()
                .equals(other.goalsConceded, goalsConceded) &&
            const DeepCollectionEquality().equals(other.score, score) &&
            const DeepCollectionEquality().equals(other.subscore, subscore) &&
            const DeepCollectionEquality().equals(other.elo, elo) &&
            const DeepCollectionEquality().equals(other.globalElo, globalElo) &&
            const DeepCollectionEquality().equals(other.team, team) &&
            const DeepCollectionEquality().equals(other.rank, rank) &&
            const DeepCollectionEquality().equals(other.gamerTag, gamerTag));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(id),
        const DeepCollectionEquality().hash(username),
        const DeepCollectionEquality().hash(avatar),
        const DeepCollectionEquality().hash(countryId),
        const DeepCollectionEquality().hash(console),
        const DeepCollectionEquality().hash(flags),
        const DeepCollectionEquality().hash(teamId),
        const DeepCollectionEquality().hash(wins),
        const DeepCollectionEquality().hash(losses),
        const DeepCollectionEquality().hash(ties),
        const DeepCollectionEquality().hash(drops),
        const DeepCollectionEquality().hash(matches),
        const DeepCollectionEquality().hash(goalsScored),
        const DeepCollectionEquality().hash(goalsConceded),
        const DeepCollectionEquality().hash(score),
        const DeepCollectionEquality().hash(subscore),
        const DeepCollectionEquality().hash(elo),
        const DeepCollectionEquality().hash(globalElo),
        const DeepCollectionEquality().hash(team),
        const DeepCollectionEquality().hash(rank),
        const DeepCollectionEquality().hash(gamerTag)
      ]);

  @JsonKey(ignore: true)
  @override
  _$TournamentParticipantCopyWith<_TournamentParticipant> get copyWith =>
      __$TournamentParticipantCopyWithImpl<_TournamentParticipant>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TournamentParticipantToJson(this);
  }
}

abstract class _TournamentParticipant extends TournamentParticipant {
  const factory _TournamentParticipant(
      {required int id,
      required String username,
      String? avatar,
      int? countryId,
      Console? console,
      required int flags,
      int? teamId,
      required int wins,
      required int losses,
      required int ties,
      required int drops,
      required int matches,
      required int goalsScored,
      required int goalsConceded,
      int? score,
      int? subscore,
      required int elo,
      int? globalElo,
      Team? team,
      required int rank,
      required String gamerTag}) = _$_TournamentParticipant;
  const _TournamentParticipant._() : super._();

  factory _TournamentParticipant.fromJson(Map<String, dynamic> json) =
      _$_TournamentParticipant.fromJson;

  @override
  int get id;
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
  int? get teamId;
  @override
  int get wins;
  @override
  int get losses;
  @override
  int get ties;
  @override
  int get drops;
  @override
  int get matches;
  @override
  int get goalsScored;
  @override
  int get goalsConceded;
  @override
  int? get score;
  @override
  int? get subscore;
  @override
  int get elo;
  @override
  int? get globalElo;
  @override
  Team? get team;
  @override
  int get rank;
  @override
  String get gamerTag;
  @override
  @JsonKey(ignore: true)
  _$TournamentParticipantCopyWith<_TournamentParticipant> get copyWith =>
      throw _privateConstructorUsedError;
}

Team _$TeamFromJson(Map<String, dynamic> json) {
  return _Team.fromJson(json);
}

/// @nodoc
class _$TeamTearOff {
  const _$TeamTearOff();

  _Team call({required int id, required String name, String? logo}) {
    return _Team(
      id: id,
      name: name,
      logo: logo,
    );
  }

  Team fromJson(Map<String, Object?> json) {
    return Team.fromJson(json);
  }
}

/// @nodoc
const $Team = _$TeamTearOff();

/// @nodoc
mixin _$Team {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeamCopyWith<Team> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamCopyWith<$Res> {
  factory $TeamCopyWith(Team value, $Res Function(Team) then) =
      _$TeamCopyWithImpl<$Res>;
  $Res call({int id, String name, String? logo});
}

/// @nodoc
class _$TeamCopyWithImpl<$Res> implements $TeamCopyWith<$Res> {
  _$TeamCopyWithImpl(this._value, this._then);

  final Team _value;
  // ignore: unused_field
  final $Res Function(Team) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? logo = freezed,
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
    ));
  }
}

/// @nodoc
abstract class _$TeamCopyWith<$Res> implements $TeamCopyWith<$Res> {
  factory _$TeamCopyWith(_Team value, $Res Function(_Team) then) =
      __$TeamCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name, String? logo});
}

/// @nodoc
class __$TeamCopyWithImpl<$Res> extends _$TeamCopyWithImpl<$Res>
    implements _$TeamCopyWith<$Res> {
  __$TeamCopyWithImpl(_Team _value, $Res Function(_Team) _then)
      : super(_value, (v) => _then(v as _Team));

  @override
  _Team get _value => super._value as _Team;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? logo = freezed,
  }) {
    return _then(_Team(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Team implements _Team {
  const _$_Team({required this.id, required this.name, this.logo});

  factory _$_Team.fromJson(Map<String, dynamic> json) => _$$_TeamFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? logo;

  @override
  String toString() {
    return 'Team(id: $id, name: $name, logo: $logo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Team &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.logo, logo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(logo));

  @JsonKey(ignore: true)
  @override
  _$TeamCopyWith<_Team> get copyWith =>
      __$TeamCopyWithImpl<_Team>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TeamToJson(this);
  }
}

abstract class _Team implements Team {
  const factory _Team({required int id, required String name, String? logo}) =
      _$_Team;

  factory _Team.fromJson(Map<String, dynamic> json) = _$_Team.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get logo;
  @override
  @JsonKey(ignore: true)
  _$TeamCopyWith<_Team> get copyWith => throw _privateConstructorUsedError;
}
