// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'match.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Match _$MatchFromJson(Map<String, dynamic> json) {
  return _Match.fromJson(json);
}

/// @nodoc
class _$MatchTearOff {
  const _$MatchTearOff();

  _Match call(
      {required int id,
      required int tournamentId,
      required int console,
      int? user1Score,
      int? user2Score,
      required int flags,
      @TimestampConverter() required DateTime inserted,
      required UserBasicInfo user1,
      required UserBasicInfo user2,
      TeamRef? team1,
      TeamRef? team2,
      Club? org,
      required int round,
      TournamentRef? tournament}) {
    return _Match(
      id: id,
      tournamentId: tournamentId,
      console: console,
      user1Score: user1Score,
      user2Score: user2Score,
      flags: flags,
      inserted: inserted,
      user1: user1,
      user2: user2,
      team1: team1,
      team2: team2,
      org: org,
      round: round,
      tournament: tournament,
    );
  }

  Match fromJson(Map<String, Object?> json) {
    return Match.fromJson(json);
  }
}

/// @nodoc
const $Match = _$MatchTearOff();

/// @nodoc
mixin _$Match {
  int get id => throw _privateConstructorUsedError;
  int get tournamentId => throw _privateConstructorUsedError;
  int get console => throw _privateConstructorUsedError;
  int? get user1Score => throw _privateConstructorUsedError;
  int? get user2Score => throw _privateConstructorUsedError;
  int get flags => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get inserted => throw _privateConstructorUsedError;
  UserBasicInfo get user1 => throw _privateConstructorUsedError;
  UserBasicInfo get user2 => throw _privateConstructorUsedError;
  TeamRef? get team1 => throw _privateConstructorUsedError;
  TeamRef? get team2 => throw _privateConstructorUsedError;
  Club? get org => throw _privateConstructorUsedError;
  int get round => throw _privateConstructorUsedError;
  TournamentRef? get tournament => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchCopyWith<Match> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchCopyWith<$Res> {
  factory $MatchCopyWith(Match value, $Res Function(Match) then) =
      _$MatchCopyWithImpl<$Res>;
  $Res call(
      {int id,
      int tournamentId,
      int console,
      int? user1Score,
      int? user2Score,
      int flags,
      @TimestampConverter() DateTime inserted,
      UserBasicInfo user1,
      UserBasicInfo user2,
      TeamRef? team1,
      TeamRef? team2,
      Club? org,
      int round,
      TournamentRef? tournament});

  $ClubCopyWith<$Res>? get org;
}

/// @nodoc
class _$MatchCopyWithImpl<$Res> implements $MatchCopyWith<$Res> {
  _$MatchCopyWithImpl(this._value, this._then);

  final Match _value;
  // ignore: unused_field
  final $Res Function(Match) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? tournamentId = freezed,
    Object? console = freezed,
    Object? user1Score = freezed,
    Object? user2Score = freezed,
    Object? flags = freezed,
    Object? inserted = freezed,
    Object? user1 = freezed,
    Object? user2 = freezed,
    Object? team1 = freezed,
    Object? team2 = freezed,
    Object? org = freezed,
    Object? round = freezed,
    Object? tournament = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      tournamentId: tournamentId == freezed
          ? _value.tournamentId
          : tournamentId // ignore: cast_nullable_to_non_nullable
              as int,
      console: console == freezed
          ? _value.console
          : console // ignore: cast_nullable_to_non_nullable
              as int,
      user1Score: user1Score == freezed
          ? _value.user1Score
          : user1Score // ignore: cast_nullable_to_non_nullable
              as int?,
      user2Score: user2Score == freezed
          ? _value.user2Score
          : user2Score // ignore: cast_nullable_to_non_nullable
              as int?,
      flags: flags == freezed
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as int,
      inserted: inserted == freezed
          ? _value.inserted
          : inserted // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user1: user1 == freezed
          ? _value.user1
          : user1 // ignore: cast_nullable_to_non_nullable
              as UserBasicInfo,
      user2: user2 == freezed
          ? _value.user2
          : user2 // ignore: cast_nullable_to_non_nullable
              as UserBasicInfo,
      team1: team1 == freezed
          ? _value.team1
          : team1 // ignore: cast_nullable_to_non_nullable
              as TeamRef?,
      team2: team2 == freezed
          ? _value.team2
          : team2 // ignore: cast_nullable_to_non_nullable
              as TeamRef?,
      org: org == freezed
          ? _value.org
          : org // ignore: cast_nullable_to_non_nullable
              as Club?,
      round: round == freezed
          ? _value.round
          : round // ignore: cast_nullable_to_non_nullable
              as int,
      tournament: tournament == freezed
          ? _value.tournament
          : tournament // ignore: cast_nullable_to_non_nullable
              as TournamentRef?,
    ));
  }

  @override
  $ClubCopyWith<$Res>? get org {
    if (_value.org == null) {
      return null;
    }

    return $ClubCopyWith<$Res>(_value.org!, (value) {
      return _then(_value.copyWith(org: value));
    });
  }
}

/// @nodoc
abstract class _$MatchCopyWith<$Res> implements $MatchCopyWith<$Res> {
  factory _$MatchCopyWith(_Match value, $Res Function(_Match) then) =
      __$MatchCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      int tournamentId,
      int console,
      int? user1Score,
      int? user2Score,
      int flags,
      @TimestampConverter() DateTime inserted,
      UserBasicInfo user1,
      UserBasicInfo user2,
      TeamRef? team1,
      TeamRef? team2,
      Club? org,
      int round,
      TournamentRef? tournament});

  @override
  $ClubCopyWith<$Res>? get org;
}

/// @nodoc
class __$MatchCopyWithImpl<$Res> extends _$MatchCopyWithImpl<$Res>
    implements _$MatchCopyWith<$Res> {
  __$MatchCopyWithImpl(_Match _value, $Res Function(_Match) _then)
      : super(_value, (v) => _then(v as _Match));

  @override
  _Match get _value => super._value as _Match;

  @override
  $Res call({
    Object? id = freezed,
    Object? tournamentId = freezed,
    Object? console = freezed,
    Object? user1Score = freezed,
    Object? user2Score = freezed,
    Object? flags = freezed,
    Object? inserted = freezed,
    Object? user1 = freezed,
    Object? user2 = freezed,
    Object? team1 = freezed,
    Object? team2 = freezed,
    Object? org = freezed,
    Object? round = freezed,
    Object? tournament = freezed,
  }) {
    return _then(_Match(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      tournamentId: tournamentId == freezed
          ? _value.tournamentId
          : tournamentId // ignore: cast_nullable_to_non_nullable
              as int,
      console: console == freezed
          ? _value.console
          : console // ignore: cast_nullable_to_non_nullable
              as int,
      user1Score: user1Score == freezed
          ? _value.user1Score
          : user1Score // ignore: cast_nullable_to_non_nullable
              as int?,
      user2Score: user2Score == freezed
          ? _value.user2Score
          : user2Score // ignore: cast_nullable_to_non_nullable
              as int?,
      flags: flags == freezed
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as int,
      inserted: inserted == freezed
          ? _value.inserted
          : inserted // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user1: user1 == freezed
          ? _value.user1
          : user1 // ignore: cast_nullable_to_non_nullable
              as UserBasicInfo,
      user2: user2 == freezed
          ? _value.user2
          : user2 // ignore: cast_nullable_to_non_nullable
              as UserBasicInfo,
      team1: team1 == freezed
          ? _value.team1
          : team1 // ignore: cast_nullable_to_non_nullable
              as TeamRef?,
      team2: team2 == freezed
          ? _value.team2
          : team2 // ignore: cast_nullable_to_non_nullable
              as TeamRef?,
      org: org == freezed
          ? _value.org
          : org // ignore: cast_nullable_to_non_nullable
              as Club?,
      round: round == freezed
          ? _value.round
          : round // ignore: cast_nullable_to_non_nullable
              as int,
      tournament: tournament == freezed
          ? _value.tournament
          : tournament // ignore: cast_nullable_to_non_nullable
              as TournamentRef?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@Implements<MatchRef>()
class _$_Match extends _Match {
  _$_Match(
      {required this.id,
      required this.tournamentId,
      required this.console,
      this.user1Score,
      this.user2Score,
      required this.flags,
      @TimestampConverter() required this.inserted,
      required this.user1,
      required this.user2,
      this.team1,
      this.team2,
      this.org,
      required this.round,
      this.tournament})
      : super._();

  factory _$_Match.fromJson(Map<String, dynamic> json) =>
      _$$_MatchFromJson(json);

  @override
  final int id;
  @override
  final int tournamentId;
  @override
  final int console;
  @override
  final int? user1Score;
  @override
  final int? user2Score;
  @override
  final int flags;
  @override
  @TimestampConverter()
  final DateTime inserted;
  @override
  final UserBasicInfo user1;
  @override
  final UserBasicInfo user2;
  @override
  final TeamRef? team1;
  @override
  final TeamRef? team2;
  @override
  final Club? org;
  @override
  final int round;
  @override
  final TournamentRef? tournament;

  @override
  String toString() {
    return 'Match(id: $id, tournamentId: $tournamentId, console: $console, user1Score: $user1Score, user2Score: $user2Score, flags: $flags, inserted: $inserted, user1: $user1, user2: $user2, team1: $team1, team2: $team2, org: $org, round: $round, tournament: $tournament)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Match &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.tournamentId, tournamentId) &&
            const DeepCollectionEquality().equals(other.console, console) &&
            const DeepCollectionEquality()
                .equals(other.user1Score, user1Score) &&
            const DeepCollectionEquality()
                .equals(other.user2Score, user2Score) &&
            const DeepCollectionEquality().equals(other.flags, flags) &&
            const DeepCollectionEquality().equals(other.inserted, inserted) &&
            const DeepCollectionEquality().equals(other.user1, user1) &&
            const DeepCollectionEquality().equals(other.user2, user2) &&
            const DeepCollectionEquality().equals(other.team1, team1) &&
            const DeepCollectionEquality().equals(other.team2, team2) &&
            const DeepCollectionEquality().equals(other.org, org) &&
            const DeepCollectionEquality().equals(other.round, round) &&
            const DeepCollectionEquality()
                .equals(other.tournament, tournament));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(tournamentId),
      const DeepCollectionEquality().hash(console),
      const DeepCollectionEquality().hash(user1Score),
      const DeepCollectionEquality().hash(user2Score),
      const DeepCollectionEquality().hash(flags),
      const DeepCollectionEquality().hash(inserted),
      const DeepCollectionEquality().hash(user1),
      const DeepCollectionEquality().hash(user2),
      const DeepCollectionEquality().hash(team1),
      const DeepCollectionEquality().hash(team2),
      const DeepCollectionEquality().hash(org),
      const DeepCollectionEquality().hash(round),
      const DeepCollectionEquality().hash(tournament));

  @JsonKey(ignore: true)
  @override
  _$MatchCopyWith<_Match> get copyWith =>
      __$MatchCopyWithImpl<_Match>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MatchToJson(this);
  }
}

abstract class _Match extends Match implements MatchRef {
  factory _Match(
      {required int id,
      required int tournamentId,
      required int console,
      int? user1Score,
      int? user2Score,
      required int flags,
      @TimestampConverter() required DateTime inserted,
      required UserBasicInfo user1,
      required UserBasicInfo user2,
      TeamRef? team1,
      TeamRef? team2,
      Club? org,
      required int round,
      TournamentRef? tournament}) = _$_Match;
  _Match._() : super._();

  factory _Match.fromJson(Map<String, dynamic> json) = _$_Match.fromJson;

  @override
  int get id;
  @override
  int get tournamentId;
  @override
  int get console;
  @override
  int? get user1Score;
  @override
  int? get user2Score;
  @override
  int get flags;
  @override
  @TimestampConverter()
  DateTime get inserted;
  @override
  UserBasicInfo get user1;
  @override
  UserBasicInfo get user2;
  @override
  TeamRef? get team1;
  @override
  TeamRef? get team2;
  @override
  Club? get org;
  @override
  int get round;
  @override
  TournamentRef? get tournament;
  @override
  @JsonKey(ignore: true)
  _$MatchCopyWith<_Match> get copyWith => throw _privateConstructorUsedError;
}

MatchSingle _$MatchSingleFromJson(Map<String, dynamic> json) {
  return _MatchSingle.fromJson(json);
}

/// @nodoc
class _$MatchSingleTearOff {
  const _$MatchSingleTearOff();

  _MatchSingle call(
      {required int id,
      required int tournamentId,
      required int console,
      int? user1Score,
      int? user2Score,
      required int flags,
      @TimestampConverter() required DateTime inserted,
      int? droppedUserId,
      int? submittedUserId,
      @NullableTimestampConverter() DateTime? submittedTimestamp,
      int? confirmedUserId,
      int? conflicted,
      List<UserEvidence>? evidence}) {
    return _MatchSingle(
      id: id,
      tournamentId: tournamentId,
      console: console,
      user1Score: user1Score,
      user2Score: user2Score,
      flags: flags,
      inserted: inserted,
      droppedUserId: droppedUserId,
      submittedUserId: submittedUserId,
      submittedTimestamp: submittedTimestamp,
      confirmedUserId: confirmedUserId,
      conflicted: conflicted,
      evidence: evidence,
    );
  }

  MatchSingle fromJson(Map<String, Object?> json) {
    return MatchSingle.fromJson(json);
  }
}

/// @nodoc
const $MatchSingle = _$MatchSingleTearOff();

/// @nodoc
mixin _$MatchSingle {
  int get id => throw _privateConstructorUsedError;
  int get tournamentId => throw _privateConstructorUsedError;
  int get console => throw _privateConstructorUsedError;
  int? get user1Score => throw _privateConstructorUsedError;
  int? get user2Score => throw _privateConstructorUsedError;
  int get flags => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get inserted => throw _privateConstructorUsedError;
  int? get droppedUserId => throw _privateConstructorUsedError;
  int? get submittedUserId => throw _privateConstructorUsedError;
  @NullableTimestampConverter()
  DateTime? get submittedTimestamp => throw _privateConstructorUsedError;
  int? get confirmedUserId => throw _privateConstructorUsedError;
  int? get conflicted => throw _privateConstructorUsedError;
  List<UserEvidence>? get evidence => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchSingleCopyWith<MatchSingle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchSingleCopyWith<$Res> {
  factory $MatchSingleCopyWith(
          MatchSingle value, $Res Function(MatchSingle) then) =
      _$MatchSingleCopyWithImpl<$Res>;
  $Res call(
      {int id,
      int tournamentId,
      int console,
      int? user1Score,
      int? user2Score,
      int flags,
      @TimestampConverter() DateTime inserted,
      int? droppedUserId,
      int? submittedUserId,
      @NullableTimestampConverter() DateTime? submittedTimestamp,
      int? confirmedUserId,
      int? conflicted,
      List<UserEvidence>? evidence});
}

/// @nodoc
class _$MatchSingleCopyWithImpl<$Res> implements $MatchSingleCopyWith<$Res> {
  _$MatchSingleCopyWithImpl(this._value, this._then);

  final MatchSingle _value;
  // ignore: unused_field
  final $Res Function(MatchSingle) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? tournamentId = freezed,
    Object? console = freezed,
    Object? user1Score = freezed,
    Object? user2Score = freezed,
    Object? flags = freezed,
    Object? inserted = freezed,
    Object? droppedUserId = freezed,
    Object? submittedUserId = freezed,
    Object? submittedTimestamp = freezed,
    Object? confirmedUserId = freezed,
    Object? conflicted = freezed,
    Object? evidence = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      tournamentId: tournamentId == freezed
          ? _value.tournamentId
          : tournamentId // ignore: cast_nullable_to_non_nullable
              as int,
      console: console == freezed
          ? _value.console
          : console // ignore: cast_nullable_to_non_nullable
              as int,
      user1Score: user1Score == freezed
          ? _value.user1Score
          : user1Score // ignore: cast_nullable_to_non_nullable
              as int?,
      user2Score: user2Score == freezed
          ? _value.user2Score
          : user2Score // ignore: cast_nullable_to_non_nullable
              as int?,
      flags: flags == freezed
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as int,
      inserted: inserted == freezed
          ? _value.inserted
          : inserted // ignore: cast_nullable_to_non_nullable
              as DateTime,
      droppedUserId: droppedUserId == freezed
          ? _value.droppedUserId
          : droppedUserId // ignore: cast_nullable_to_non_nullable
              as int?,
      submittedUserId: submittedUserId == freezed
          ? _value.submittedUserId
          : submittedUserId // ignore: cast_nullable_to_non_nullable
              as int?,
      submittedTimestamp: submittedTimestamp == freezed
          ? _value.submittedTimestamp
          : submittedTimestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      confirmedUserId: confirmedUserId == freezed
          ? _value.confirmedUserId
          : confirmedUserId // ignore: cast_nullable_to_non_nullable
              as int?,
      conflicted: conflicted == freezed
          ? _value.conflicted
          : conflicted // ignore: cast_nullable_to_non_nullable
              as int?,
      evidence: evidence == freezed
          ? _value.evidence
          : evidence // ignore: cast_nullable_to_non_nullable
              as List<UserEvidence>?,
    ));
  }
}

/// @nodoc
abstract class _$MatchSingleCopyWith<$Res>
    implements $MatchSingleCopyWith<$Res> {
  factory _$MatchSingleCopyWith(
          _MatchSingle value, $Res Function(_MatchSingle) then) =
      __$MatchSingleCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      int tournamentId,
      int console,
      int? user1Score,
      int? user2Score,
      int flags,
      @TimestampConverter() DateTime inserted,
      int? droppedUserId,
      int? submittedUserId,
      @NullableTimestampConverter() DateTime? submittedTimestamp,
      int? confirmedUserId,
      int? conflicted,
      List<UserEvidence>? evidence});
}

/// @nodoc
class __$MatchSingleCopyWithImpl<$Res> extends _$MatchSingleCopyWithImpl<$Res>
    implements _$MatchSingleCopyWith<$Res> {
  __$MatchSingleCopyWithImpl(
      _MatchSingle _value, $Res Function(_MatchSingle) _then)
      : super(_value, (v) => _then(v as _MatchSingle));

  @override
  _MatchSingle get _value => super._value as _MatchSingle;

  @override
  $Res call({
    Object? id = freezed,
    Object? tournamentId = freezed,
    Object? console = freezed,
    Object? user1Score = freezed,
    Object? user2Score = freezed,
    Object? flags = freezed,
    Object? inserted = freezed,
    Object? droppedUserId = freezed,
    Object? submittedUserId = freezed,
    Object? submittedTimestamp = freezed,
    Object? confirmedUserId = freezed,
    Object? conflicted = freezed,
    Object? evidence = freezed,
  }) {
    return _then(_MatchSingle(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      tournamentId: tournamentId == freezed
          ? _value.tournamentId
          : tournamentId // ignore: cast_nullable_to_non_nullable
              as int,
      console: console == freezed
          ? _value.console
          : console // ignore: cast_nullable_to_non_nullable
              as int,
      user1Score: user1Score == freezed
          ? _value.user1Score
          : user1Score // ignore: cast_nullable_to_non_nullable
              as int?,
      user2Score: user2Score == freezed
          ? _value.user2Score
          : user2Score // ignore: cast_nullable_to_non_nullable
              as int?,
      flags: flags == freezed
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as int,
      inserted: inserted == freezed
          ? _value.inserted
          : inserted // ignore: cast_nullable_to_non_nullable
              as DateTime,
      droppedUserId: droppedUserId == freezed
          ? _value.droppedUserId
          : droppedUserId // ignore: cast_nullable_to_non_nullable
              as int?,
      submittedUserId: submittedUserId == freezed
          ? _value.submittedUserId
          : submittedUserId // ignore: cast_nullable_to_non_nullable
              as int?,
      submittedTimestamp: submittedTimestamp == freezed
          ? _value.submittedTimestamp
          : submittedTimestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      confirmedUserId: confirmedUserId == freezed
          ? _value.confirmedUserId
          : confirmedUserId // ignore: cast_nullable_to_non_nullable
              as int?,
      conflicted: conflicted == freezed
          ? _value.conflicted
          : conflicted // ignore: cast_nullable_to_non_nullable
              as int?,
      evidence: evidence == freezed
          ? _value.evidence
          : evidence // ignore: cast_nullable_to_non_nullable
              as List<UserEvidence>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@Implements<MatchRef>()
class _$_MatchSingle extends _MatchSingle {
  _$_MatchSingle(
      {required this.id,
      required this.tournamentId,
      required this.console,
      this.user1Score,
      this.user2Score,
      required this.flags,
      @TimestampConverter() required this.inserted,
      this.droppedUserId,
      this.submittedUserId,
      @NullableTimestampConverter() this.submittedTimestamp,
      this.confirmedUserId,
      this.conflicted,
      this.evidence})
      : super._();

  factory _$_MatchSingle.fromJson(Map<String, dynamic> json) =>
      _$$_MatchSingleFromJson(json);

  @override
  final int id;
  @override
  final int tournamentId;
  @override
  final int console;
  @override
  final int? user1Score;
  @override
  final int? user2Score;
  @override
  final int flags;
  @override
  @TimestampConverter()
  final DateTime inserted;
  @override
  final int? droppedUserId;
  @override
  final int? submittedUserId;
  @override
  @NullableTimestampConverter()
  final DateTime? submittedTimestamp;
  @override
  final int? confirmedUserId;
  @override
  final int? conflicted;
  @override
  final List<UserEvidence>? evidence;

  @override
  String toString() {
    return 'MatchSingle(id: $id, tournamentId: $tournamentId, console: $console, user1Score: $user1Score, user2Score: $user2Score, flags: $flags, inserted: $inserted, droppedUserId: $droppedUserId, submittedUserId: $submittedUserId, submittedTimestamp: $submittedTimestamp, confirmedUserId: $confirmedUserId, conflicted: $conflicted, evidence: $evidence)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MatchSingle &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.tournamentId, tournamentId) &&
            const DeepCollectionEquality().equals(other.console, console) &&
            const DeepCollectionEquality()
                .equals(other.user1Score, user1Score) &&
            const DeepCollectionEquality()
                .equals(other.user2Score, user2Score) &&
            const DeepCollectionEquality().equals(other.flags, flags) &&
            const DeepCollectionEquality().equals(other.inserted, inserted) &&
            const DeepCollectionEquality()
                .equals(other.droppedUserId, droppedUserId) &&
            const DeepCollectionEquality()
                .equals(other.submittedUserId, submittedUserId) &&
            const DeepCollectionEquality()
                .equals(other.submittedTimestamp, submittedTimestamp) &&
            const DeepCollectionEquality()
                .equals(other.confirmedUserId, confirmedUserId) &&
            const DeepCollectionEquality()
                .equals(other.conflicted, conflicted) &&
            const DeepCollectionEquality().equals(other.evidence, evidence));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(tournamentId),
      const DeepCollectionEquality().hash(console),
      const DeepCollectionEquality().hash(user1Score),
      const DeepCollectionEquality().hash(user2Score),
      const DeepCollectionEquality().hash(flags),
      const DeepCollectionEquality().hash(inserted),
      const DeepCollectionEquality().hash(droppedUserId),
      const DeepCollectionEquality().hash(submittedUserId),
      const DeepCollectionEquality().hash(submittedTimestamp),
      const DeepCollectionEquality().hash(confirmedUserId),
      const DeepCollectionEquality().hash(conflicted),
      const DeepCollectionEquality().hash(evidence));

  @JsonKey(ignore: true)
  @override
  _$MatchSingleCopyWith<_MatchSingle> get copyWith =>
      __$MatchSingleCopyWithImpl<_MatchSingle>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MatchSingleToJson(this);
  }
}

abstract class _MatchSingle extends MatchSingle implements MatchRef {
  factory _MatchSingle(
      {required int id,
      required int tournamentId,
      required int console,
      int? user1Score,
      int? user2Score,
      required int flags,
      @TimestampConverter() required DateTime inserted,
      int? droppedUserId,
      int? submittedUserId,
      @NullableTimestampConverter() DateTime? submittedTimestamp,
      int? confirmedUserId,
      int? conflicted,
      List<UserEvidence>? evidence}) = _$_MatchSingle;
  _MatchSingle._() : super._();

  factory _MatchSingle.fromJson(Map<String, dynamic> json) =
      _$_MatchSingle.fromJson;

  @override
  int get id;
  @override
  int get tournamentId;
  @override
  int get console;
  @override
  int? get user1Score;
  @override
  int? get user2Score;
  @override
  int get flags;
  @override
  @TimestampConverter()
  DateTime get inserted;
  @override
  int? get droppedUserId;
  @override
  int? get submittedUserId;
  @override
  @NullableTimestampConverter()
  DateTime? get submittedTimestamp;
  @override
  int? get confirmedUserId;
  @override
  int? get conflicted;
  @override
  List<UserEvidence>? get evidence;
  @override
  @JsonKey(ignore: true)
  _$MatchSingleCopyWith<_MatchSingle> get copyWith =>
      throw _privateConstructorUsedError;
}

NextMatch _$NextMatchFromJson(Map<String, dynamic> json) {
  return _NextMatch.fromJson(json);
}

/// @nodoc
class _$NextMatchTearOff {
  const _$NextMatchTearOff();

  _NextMatch call(
      {@TimestampConverter() required DateTime startsAt,
      required NextMatchTournament tournament,
      required NextMatchTeam team1,
      required NextMatchTeam team2,
      String? twitchLink}) {
    return _NextMatch(
      startsAt: startsAt,
      tournament: tournament,
      team1: team1,
      team2: team2,
      twitchLink: twitchLink,
    );
  }

  NextMatch fromJson(Map<String, Object?> json) {
    return NextMatch.fromJson(json);
  }
}

/// @nodoc
const $NextMatch = _$NextMatchTearOff();

/// @nodoc
mixin _$NextMatch {
  @TimestampConverter()
  DateTime get startsAt => throw _privateConstructorUsedError;
  NextMatchTournament get tournament => throw _privateConstructorUsedError;
  NextMatchTeam get team1 => throw _privateConstructorUsedError;
  NextMatchTeam get team2 => throw _privateConstructorUsedError;
  String? get twitchLink => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NextMatchCopyWith<NextMatch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NextMatchCopyWith<$Res> {
  factory $NextMatchCopyWith(NextMatch value, $Res Function(NextMatch) then) =
      _$NextMatchCopyWithImpl<$Res>;
  $Res call(
      {@TimestampConverter() DateTime startsAt,
      NextMatchTournament tournament,
      NextMatchTeam team1,
      NextMatchTeam team2,
      String? twitchLink});
}

/// @nodoc
class _$NextMatchCopyWithImpl<$Res> implements $NextMatchCopyWith<$Res> {
  _$NextMatchCopyWithImpl(this._value, this._then);

  final NextMatch _value;
  // ignore: unused_field
  final $Res Function(NextMatch) _then;

  @override
  $Res call({
    Object? startsAt = freezed,
    Object? tournament = freezed,
    Object? team1 = freezed,
    Object? team2 = freezed,
    Object? twitchLink = freezed,
  }) {
    return _then(_value.copyWith(
      startsAt: startsAt == freezed
          ? _value.startsAt
          : startsAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tournament: tournament == freezed
          ? _value.tournament
          : tournament // ignore: cast_nullable_to_non_nullable
              as NextMatchTournament,
      team1: team1 == freezed
          ? _value.team1
          : team1 // ignore: cast_nullable_to_non_nullable
              as NextMatchTeam,
      team2: team2 == freezed
          ? _value.team2
          : team2 // ignore: cast_nullable_to_non_nullable
              as NextMatchTeam,
      twitchLink: twitchLink == freezed
          ? _value.twitchLink
          : twitchLink // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$NextMatchCopyWith<$Res> implements $NextMatchCopyWith<$Res> {
  factory _$NextMatchCopyWith(
          _NextMatch value, $Res Function(_NextMatch) then) =
      __$NextMatchCopyWithImpl<$Res>;
  @override
  $Res call(
      {@TimestampConverter() DateTime startsAt,
      NextMatchTournament tournament,
      NextMatchTeam team1,
      NextMatchTeam team2,
      String? twitchLink});
}

/// @nodoc
class __$NextMatchCopyWithImpl<$Res> extends _$NextMatchCopyWithImpl<$Res>
    implements _$NextMatchCopyWith<$Res> {
  __$NextMatchCopyWithImpl(_NextMatch _value, $Res Function(_NextMatch) _then)
      : super(_value, (v) => _then(v as _NextMatch));

  @override
  _NextMatch get _value => super._value as _NextMatch;

  @override
  $Res call({
    Object? startsAt = freezed,
    Object? tournament = freezed,
    Object? team1 = freezed,
    Object? team2 = freezed,
    Object? twitchLink = freezed,
  }) {
    return _then(_NextMatch(
      startsAt: startsAt == freezed
          ? _value.startsAt
          : startsAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tournament: tournament == freezed
          ? _value.tournament
          : tournament // ignore: cast_nullable_to_non_nullable
              as NextMatchTournament,
      team1: team1 == freezed
          ? _value.team1
          : team1 // ignore: cast_nullable_to_non_nullable
              as NextMatchTeam,
      team2: team2 == freezed
          ? _value.team2
          : team2 // ignore: cast_nullable_to_non_nullable
              as NextMatchTeam,
      twitchLink: twitchLink == freezed
          ? _value.twitchLink
          : twitchLink // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@Implements<OrgMatch>()
class _$_NextMatch extends _NextMatch {
  _$_NextMatch(
      {@TimestampConverter() required this.startsAt,
      required this.tournament,
      required this.team1,
      required this.team2,
      this.twitchLink})
      : super._();

  factory _$_NextMatch.fromJson(Map<String, dynamic> json) =>
      _$$_NextMatchFromJson(json);

  @override
  @TimestampConverter()
  final DateTime startsAt;
  @override
  final NextMatchTournament tournament;
  @override
  final NextMatchTeam team1;
  @override
  final NextMatchTeam team2;
  @override
  final String? twitchLink;

  @override
  String toString() {
    return 'NextMatch(startsAt: $startsAt, tournament: $tournament, team1: $team1, team2: $team2, twitchLink: $twitchLink)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NextMatch &&
            const DeepCollectionEquality().equals(other.startsAt, startsAt) &&
            const DeepCollectionEquality()
                .equals(other.tournament, tournament) &&
            const DeepCollectionEquality().equals(other.team1, team1) &&
            const DeepCollectionEquality().equals(other.team2, team2) &&
            const DeepCollectionEquality()
                .equals(other.twitchLink, twitchLink));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(startsAt),
      const DeepCollectionEquality().hash(tournament),
      const DeepCollectionEquality().hash(team1),
      const DeepCollectionEquality().hash(team2),
      const DeepCollectionEquality().hash(twitchLink));

  @JsonKey(ignore: true)
  @override
  _$NextMatchCopyWith<_NextMatch> get copyWith =>
      __$NextMatchCopyWithImpl<_NextMatch>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NextMatchToJson(this);
  }
}

abstract class _NextMatch extends NextMatch implements OrgMatch {
  factory _NextMatch(
      {@TimestampConverter() required DateTime startsAt,
      required NextMatchTournament tournament,
      required NextMatchTeam team1,
      required NextMatchTeam team2,
      String? twitchLink}) = _$_NextMatch;
  _NextMatch._() : super._();

  factory _NextMatch.fromJson(Map<String, dynamic> json) =
      _$_NextMatch.fromJson;

  @override
  @TimestampConverter()
  DateTime get startsAt;
  @override
  NextMatchTournament get tournament;
  @override
  NextMatchTeam get team1;
  @override
  NextMatchTeam get team2;
  @override
  String? get twitchLink;
  @override
  @JsonKey(ignore: true)
  _$NextMatchCopyWith<_NextMatch> get copyWith =>
      throw _privateConstructorUsedError;
}

LatestMatch _$LatestMatchFromJson(Map<String, dynamic> json) {
  return _LatestMatch.fromJson(json);
}

/// @nodoc
class _$LatestMatchTearOff {
  const _$LatestMatchTearOff();

  _LatestMatch call(
      {@TimestampConverter() required DateTime startsAt,
      required NextMatchTournament tournament,
      required NextMatchTeam team1,
      required NextMatchTeam team2,
      String? twitchLink,
      required List<LatestMatchMatch> matches}) {
    return _LatestMatch(
      startsAt: startsAt,
      tournament: tournament,
      team1: team1,
      team2: team2,
      twitchLink: twitchLink,
      matches: matches,
    );
  }

  LatestMatch fromJson(Map<String, Object?> json) {
    return LatestMatch.fromJson(json);
  }
}

/// @nodoc
const $LatestMatch = _$LatestMatchTearOff();

/// @nodoc
mixin _$LatestMatch {
  @TimestampConverter()
  DateTime get startsAt => throw _privateConstructorUsedError;
  NextMatchTournament get tournament => throw _privateConstructorUsedError;
  NextMatchTeam get team1 => throw _privateConstructorUsedError;
  NextMatchTeam get team2 => throw _privateConstructorUsedError;
  String? get twitchLink => throw _privateConstructorUsedError;
  List<LatestMatchMatch> get matches => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LatestMatchCopyWith<LatestMatch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LatestMatchCopyWith<$Res> {
  factory $LatestMatchCopyWith(
          LatestMatch value, $Res Function(LatestMatch) then) =
      _$LatestMatchCopyWithImpl<$Res>;
  $Res call(
      {@TimestampConverter() DateTime startsAt,
      NextMatchTournament tournament,
      NextMatchTeam team1,
      NextMatchTeam team2,
      String? twitchLink,
      List<LatestMatchMatch> matches});
}

/// @nodoc
class _$LatestMatchCopyWithImpl<$Res> implements $LatestMatchCopyWith<$Res> {
  _$LatestMatchCopyWithImpl(this._value, this._then);

  final LatestMatch _value;
  // ignore: unused_field
  final $Res Function(LatestMatch) _then;

  @override
  $Res call({
    Object? startsAt = freezed,
    Object? tournament = freezed,
    Object? team1 = freezed,
    Object? team2 = freezed,
    Object? twitchLink = freezed,
    Object? matches = freezed,
  }) {
    return _then(_value.copyWith(
      startsAt: startsAt == freezed
          ? _value.startsAt
          : startsAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tournament: tournament == freezed
          ? _value.tournament
          : tournament // ignore: cast_nullable_to_non_nullable
              as NextMatchTournament,
      team1: team1 == freezed
          ? _value.team1
          : team1 // ignore: cast_nullable_to_non_nullable
              as NextMatchTeam,
      team2: team2 == freezed
          ? _value.team2
          : team2 // ignore: cast_nullable_to_non_nullable
              as NextMatchTeam,
      twitchLink: twitchLink == freezed
          ? _value.twitchLink
          : twitchLink // ignore: cast_nullable_to_non_nullable
              as String?,
      matches: matches == freezed
          ? _value.matches
          : matches // ignore: cast_nullable_to_non_nullable
              as List<LatestMatchMatch>,
    ));
  }
}

/// @nodoc
abstract class _$LatestMatchCopyWith<$Res>
    implements $LatestMatchCopyWith<$Res> {
  factory _$LatestMatchCopyWith(
          _LatestMatch value, $Res Function(_LatestMatch) then) =
      __$LatestMatchCopyWithImpl<$Res>;
  @override
  $Res call(
      {@TimestampConverter() DateTime startsAt,
      NextMatchTournament tournament,
      NextMatchTeam team1,
      NextMatchTeam team2,
      String? twitchLink,
      List<LatestMatchMatch> matches});
}

/// @nodoc
class __$LatestMatchCopyWithImpl<$Res> extends _$LatestMatchCopyWithImpl<$Res>
    implements _$LatestMatchCopyWith<$Res> {
  __$LatestMatchCopyWithImpl(
      _LatestMatch _value, $Res Function(_LatestMatch) _then)
      : super(_value, (v) => _then(v as _LatestMatch));

  @override
  _LatestMatch get _value => super._value as _LatestMatch;

  @override
  $Res call({
    Object? startsAt = freezed,
    Object? tournament = freezed,
    Object? team1 = freezed,
    Object? team2 = freezed,
    Object? twitchLink = freezed,
    Object? matches = freezed,
  }) {
    return _then(_LatestMatch(
      startsAt: startsAt == freezed
          ? _value.startsAt
          : startsAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tournament: tournament == freezed
          ? _value.tournament
          : tournament // ignore: cast_nullable_to_non_nullable
              as NextMatchTournament,
      team1: team1 == freezed
          ? _value.team1
          : team1 // ignore: cast_nullable_to_non_nullable
              as NextMatchTeam,
      team2: team2 == freezed
          ? _value.team2
          : team2 // ignore: cast_nullable_to_non_nullable
              as NextMatchTeam,
      twitchLink: twitchLink == freezed
          ? _value.twitchLink
          : twitchLink // ignore: cast_nullable_to_non_nullable
              as String?,
      matches: matches == freezed
          ? _value.matches
          : matches // ignore: cast_nullable_to_non_nullable
              as List<LatestMatchMatch>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@Implements<OrgMatch>()
class _$_LatestMatch extends _LatestMatch {
  _$_LatestMatch(
      {@TimestampConverter() required this.startsAt,
      required this.tournament,
      required this.team1,
      required this.team2,
      this.twitchLink,
      required this.matches})
      : super._();

  factory _$_LatestMatch.fromJson(Map<String, dynamic> json) =>
      _$$_LatestMatchFromJson(json);

  @override
  @TimestampConverter()
  final DateTime startsAt;
  @override
  final NextMatchTournament tournament;
  @override
  final NextMatchTeam team1;
  @override
  final NextMatchTeam team2;
  @override
  final String? twitchLink;
  @override
  final List<LatestMatchMatch> matches;

  @override
  String toString() {
    return 'LatestMatch(startsAt: $startsAt, tournament: $tournament, team1: $team1, team2: $team2, twitchLink: $twitchLink, matches: $matches)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LatestMatch &&
            const DeepCollectionEquality().equals(other.startsAt, startsAt) &&
            const DeepCollectionEquality()
                .equals(other.tournament, tournament) &&
            const DeepCollectionEquality().equals(other.team1, team1) &&
            const DeepCollectionEquality().equals(other.team2, team2) &&
            const DeepCollectionEquality()
                .equals(other.twitchLink, twitchLink) &&
            const DeepCollectionEquality().equals(other.matches, matches));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(startsAt),
      const DeepCollectionEquality().hash(tournament),
      const DeepCollectionEquality().hash(team1),
      const DeepCollectionEquality().hash(team2),
      const DeepCollectionEquality().hash(twitchLink),
      const DeepCollectionEquality().hash(matches));

  @JsonKey(ignore: true)
  @override
  _$LatestMatchCopyWith<_LatestMatch> get copyWith =>
      __$LatestMatchCopyWithImpl<_LatestMatch>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LatestMatchToJson(this);
  }
}

abstract class _LatestMatch extends LatestMatch implements OrgMatch {
  factory _LatestMatch(
      {@TimestampConverter() required DateTime startsAt,
      required NextMatchTournament tournament,
      required NextMatchTeam team1,
      required NextMatchTeam team2,
      String? twitchLink,
      required List<LatestMatchMatch> matches}) = _$_LatestMatch;
  _LatestMatch._() : super._();

  factory _LatestMatch.fromJson(Map<String, dynamic> json) =
      _$_LatestMatch.fromJson;

  @override
  @TimestampConverter()
  DateTime get startsAt;
  @override
  NextMatchTournament get tournament;
  @override
  NextMatchTeam get team1;
  @override
  NextMatchTeam get team2;
  @override
  String? get twitchLink;
  @override
  List<LatestMatchMatch> get matches;
  @override
  @JsonKey(ignore: true)
  _$LatestMatchCopyWith<_LatestMatch> get copyWith =>
      throw _privateConstructorUsedError;
}
