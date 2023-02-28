// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bracket.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TournamentBracket _$TournamentBracketFromJson(Map<String, dynamic> json) {
  return _TournamentBracket.fromJson(json);
}

/// @nodoc
class _$TournamentBracketTearOff {
  const _$TournamentBracketTearOff();

  _TournamentBracket call(
      {required int id,
      required int tournamentId,
      int? user1Id,
      int? user2Id,
      @NullableTimestampConverter() DateTime? startTime,
      required int round,
      int? winnerBracketId,
      int? loserBracketId,
      int? user1Score,
      int? user2Score,
      required bool verified,
      int? flags}) {
    return _TournamentBracket(
      id: id,
      tournamentId: tournamentId,
      user1Id: user1Id,
      user2Id: user2Id,
      startTime: startTime,
      round: round,
      winnerBracketId: winnerBracketId,
      loserBracketId: loserBracketId,
      user1Score: user1Score,
      user2Score: user2Score,
      verified: verified,
      flags: flags,
    );
  }

  TournamentBracket fromJson(Map<String, Object?> json) {
    return TournamentBracket.fromJson(json);
  }
}

/// @nodoc
const $TournamentBracket = _$TournamentBracketTearOff();

/// @nodoc
mixin _$TournamentBracket {
  int get id => throw _privateConstructorUsedError;
  int get tournamentId => throw _privateConstructorUsedError;
  int? get user1Id => throw _privateConstructorUsedError;
  int? get user2Id => throw _privateConstructorUsedError;
  @NullableTimestampConverter()
  DateTime? get startTime => throw _privateConstructorUsedError;
  int get round => throw _privateConstructorUsedError;
  int? get winnerBracketId => throw _privateConstructorUsedError;
  int? get loserBracketId => throw _privateConstructorUsedError;
  int? get user1Score => throw _privateConstructorUsedError;
  int? get user2Score => throw _privateConstructorUsedError;
  bool get verified => throw _privateConstructorUsedError;
  int? get flags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TournamentBracketCopyWith<TournamentBracket> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TournamentBracketCopyWith<$Res> {
  factory $TournamentBracketCopyWith(
          TournamentBracket value, $Res Function(TournamentBracket) then) =
      _$TournamentBracketCopyWithImpl<$Res>;
  $Res call(
      {int id,
      int tournamentId,
      int? user1Id,
      int? user2Id,
      @NullableTimestampConverter() DateTime? startTime,
      int round,
      int? winnerBracketId,
      int? loserBracketId,
      int? user1Score,
      int? user2Score,
      bool verified,
      int? flags});
}

/// @nodoc
class _$TournamentBracketCopyWithImpl<$Res>
    implements $TournamentBracketCopyWith<$Res> {
  _$TournamentBracketCopyWithImpl(this._value, this._then);

  final TournamentBracket _value;
  // ignore: unused_field
  final $Res Function(TournamentBracket) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? tournamentId = freezed,
    Object? user1Id = freezed,
    Object? user2Id = freezed,
    Object? startTime = freezed,
    Object? round = freezed,
    Object? winnerBracketId = freezed,
    Object? loserBracketId = freezed,
    Object? user1Score = freezed,
    Object? user2Score = freezed,
    Object? verified = freezed,
    Object? flags = freezed,
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
      user1Id: user1Id == freezed
          ? _value.user1Id
          : user1Id // ignore: cast_nullable_to_non_nullable
              as int?,
      user2Id: user2Id == freezed
          ? _value.user2Id
          : user2Id // ignore: cast_nullable_to_non_nullable
              as int?,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      round: round == freezed
          ? _value.round
          : round // ignore: cast_nullable_to_non_nullable
              as int,
      winnerBracketId: winnerBracketId == freezed
          ? _value.winnerBracketId
          : winnerBracketId // ignore: cast_nullable_to_non_nullable
              as int?,
      loserBracketId: loserBracketId == freezed
          ? _value.loserBracketId
          : loserBracketId // ignore: cast_nullable_to_non_nullable
              as int?,
      user1Score: user1Score == freezed
          ? _value.user1Score
          : user1Score // ignore: cast_nullable_to_non_nullable
              as int?,
      user2Score: user2Score == freezed
          ? _value.user2Score
          : user2Score // ignore: cast_nullable_to_non_nullable
              as int?,
      verified: verified == freezed
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
      flags: flags == freezed
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$TournamentBracketCopyWith<$Res>
    implements $TournamentBracketCopyWith<$Res> {
  factory _$TournamentBracketCopyWith(
          _TournamentBracket value, $Res Function(_TournamentBracket) then) =
      __$TournamentBracketCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      int tournamentId,
      int? user1Id,
      int? user2Id,
      @NullableTimestampConverter() DateTime? startTime,
      int round,
      int? winnerBracketId,
      int? loserBracketId,
      int? user1Score,
      int? user2Score,
      bool verified,
      int? flags});
}

/// @nodoc
class __$TournamentBracketCopyWithImpl<$Res>
    extends _$TournamentBracketCopyWithImpl<$Res>
    implements _$TournamentBracketCopyWith<$Res> {
  __$TournamentBracketCopyWithImpl(
      _TournamentBracket _value, $Res Function(_TournamentBracket) _then)
      : super(_value, (v) => _then(v as _TournamentBracket));

  @override
  _TournamentBracket get _value => super._value as _TournamentBracket;

  @override
  $Res call({
    Object? id = freezed,
    Object? tournamentId = freezed,
    Object? user1Id = freezed,
    Object? user2Id = freezed,
    Object? startTime = freezed,
    Object? round = freezed,
    Object? winnerBracketId = freezed,
    Object? loserBracketId = freezed,
    Object? user1Score = freezed,
    Object? user2Score = freezed,
    Object? verified = freezed,
    Object? flags = freezed,
  }) {
    return _then(_TournamentBracket(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      tournamentId: tournamentId == freezed
          ? _value.tournamentId
          : tournamentId // ignore: cast_nullable_to_non_nullable
              as int,
      user1Id: user1Id == freezed
          ? _value.user1Id
          : user1Id // ignore: cast_nullable_to_non_nullable
              as int?,
      user2Id: user2Id == freezed
          ? _value.user2Id
          : user2Id // ignore: cast_nullable_to_non_nullable
              as int?,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      round: round == freezed
          ? _value.round
          : round // ignore: cast_nullable_to_non_nullable
              as int,
      winnerBracketId: winnerBracketId == freezed
          ? _value.winnerBracketId
          : winnerBracketId // ignore: cast_nullable_to_non_nullable
              as int?,
      loserBracketId: loserBracketId == freezed
          ? _value.loserBracketId
          : loserBracketId // ignore: cast_nullable_to_non_nullable
              as int?,
      user1Score: user1Score == freezed
          ? _value.user1Score
          : user1Score // ignore: cast_nullable_to_non_nullable
              as int?,
      user2Score: user2Score == freezed
          ? _value.user2Score
          : user2Score // ignore: cast_nullable_to_non_nullable
              as int?,
      verified: verified == freezed
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
      flags: flags == freezed
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TournamentBracket extends _TournamentBracket {
  const _$_TournamentBracket(
      {required this.id,
      required this.tournamentId,
      this.user1Id,
      this.user2Id,
      @NullableTimestampConverter() this.startTime,
      required this.round,
      this.winnerBracketId,
      this.loserBracketId,
      this.user1Score,
      this.user2Score,
      required this.verified,
      this.flags})
      : super._();

  factory _$_TournamentBracket.fromJson(Map<String, dynamic> json) =>
      _$$_TournamentBracketFromJson(json);

  @override
  final int id;
  @override
  final int tournamentId;
  @override
  final int? user1Id;
  @override
  final int? user2Id;
  @override
  @NullableTimestampConverter()
  final DateTime? startTime;
  @override
  final int round;
  @override
  final int? winnerBracketId;
  @override
  final int? loserBracketId;
  @override
  final int? user1Score;
  @override
  final int? user2Score;
  @override
  final bool verified;
  @override
  final int? flags;

  @override
  String toString() {
    return 'TournamentBracket(id: $id, tournamentId: $tournamentId, user1Id: $user1Id, user2Id: $user2Id, startTime: $startTime, round: $round, winnerBracketId: $winnerBracketId, loserBracketId: $loserBracketId, user1Score: $user1Score, user2Score: $user2Score, verified: $verified, flags: $flags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TournamentBracket &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.tournamentId, tournamentId) &&
            const DeepCollectionEquality().equals(other.user1Id, user1Id) &&
            const DeepCollectionEquality().equals(other.user2Id, user2Id) &&
            const DeepCollectionEquality().equals(other.startTime, startTime) &&
            const DeepCollectionEquality().equals(other.round, round) &&
            const DeepCollectionEquality()
                .equals(other.winnerBracketId, winnerBracketId) &&
            const DeepCollectionEquality()
                .equals(other.loserBracketId, loserBracketId) &&
            const DeepCollectionEquality()
                .equals(other.user1Score, user1Score) &&
            const DeepCollectionEquality()
                .equals(other.user2Score, user2Score) &&
            const DeepCollectionEquality().equals(other.verified, verified) &&
            const DeepCollectionEquality().equals(other.flags, flags));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(tournamentId),
      const DeepCollectionEquality().hash(user1Id),
      const DeepCollectionEquality().hash(user2Id),
      const DeepCollectionEquality().hash(startTime),
      const DeepCollectionEquality().hash(round),
      const DeepCollectionEquality().hash(winnerBracketId),
      const DeepCollectionEquality().hash(loserBracketId),
      const DeepCollectionEquality().hash(user1Score),
      const DeepCollectionEquality().hash(user2Score),
      const DeepCollectionEquality().hash(verified),
      const DeepCollectionEquality().hash(flags));

  @JsonKey(ignore: true)
  @override
  _$TournamentBracketCopyWith<_TournamentBracket> get copyWith =>
      __$TournamentBracketCopyWithImpl<_TournamentBracket>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TournamentBracketToJson(this);
  }
}

abstract class _TournamentBracket extends TournamentBracket {
  const factory _TournamentBracket(
      {required int id,
      required int tournamentId,
      int? user1Id,
      int? user2Id,
      @NullableTimestampConverter() DateTime? startTime,
      required int round,
      int? winnerBracketId,
      int? loserBracketId,
      int? user1Score,
      int? user2Score,
      required bool verified,
      int? flags}) = _$_TournamentBracket;
  const _TournamentBracket._() : super._();

  factory _TournamentBracket.fromJson(Map<String, dynamic> json) =
      _$_TournamentBracket.fromJson;

  @override
  int get id;
  @override
  int get tournamentId;
  @override
  int? get user1Id;
  @override
  int? get user2Id;
  @override
  @NullableTimestampConverter()
  DateTime? get startTime;
  @override
  int get round;
  @override
  int? get winnerBracketId;
  @override
  int? get loserBracketId;
  @override
  int? get user1Score;
  @override
  int? get user2Score;
  @override
  bool get verified;
  @override
  int? get flags;
  @override
  @JsonKey(ignore: true)
  _$TournamentBracketCopyWith<_TournamentBracket> get copyWith =>
      throw _privateConstructorUsedError;
}
