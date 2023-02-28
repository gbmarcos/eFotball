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

ActiveMatch _$ActiveMatchFromJson(Map<String, dynamic> json) {
  return _ActiveMatch.fromJson(json);
}

/// @nodoc
class _$ActiveMatchTearOff {
  const _$ActiveMatchTearOff();

  _ActiveMatch call(
      {required int matchId,
      required int tournamentId,
      bool? actionNeeded,
      bool? scoreSubmitted}) {
    return _ActiveMatch(
      matchId: matchId,
      tournamentId: tournamentId,
      actionNeeded: actionNeeded,
      scoreSubmitted: scoreSubmitted,
    );
  }

  ActiveMatch fromJson(Map<String, Object?> json) {
    return ActiveMatch.fromJson(json);
  }
}

/// @nodoc
const $ActiveMatch = _$ActiveMatchTearOff();

/// @nodoc
mixin _$ActiveMatch {
  int get matchId => throw _privateConstructorUsedError;
  int get tournamentId => throw _privateConstructorUsedError;
  bool? get actionNeeded => throw _privateConstructorUsedError;
  bool? get scoreSubmitted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActiveMatchCopyWith<ActiveMatch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActiveMatchCopyWith<$Res> {
  factory $ActiveMatchCopyWith(
          ActiveMatch value, $Res Function(ActiveMatch) then) =
      _$ActiveMatchCopyWithImpl<$Res>;
  $Res call(
      {int matchId,
      int tournamentId,
      bool? actionNeeded,
      bool? scoreSubmitted});
}

/// @nodoc
class _$ActiveMatchCopyWithImpl<$Res> implements $ActiveMatchCopyWith<$Res> {
  _$ActiveMatchCopyWithImpl(this._value, this._then);

  final ActiveMatch _value;
  // ignore: unused_field
  final $Res Function(ActiveMatch) _then;

  @override
  $Res call({
    Object? matchId = freezed,
    Object? tournamentId = freezed,
    Object? actionNeeded = freezed,
    Object? scoreSubmitted = freezed,
  }) {
    return _then(_value.copyWith(
      matchId: matchId == freezed
          ? _value.matchId
          : matchId // ignore: cast_nullable_to_non_nullable
              as int,
      tournamentId: tournamentId == freezed
          ? _value.tournamentId
          : tournamentId // ignore: cast_nullable_to_non_nullable
              as int,
      actionNeeded: actionNeeded == freezed
          ? _value.actionNeeded
          : actionNeeded // ignore: cast_nullable_to_non_nullable
              as bool?,
      scoreSubmitted: scoreSubmitted == freezed
          ? _value.scoreSubmitted
          : scoreSubmitted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$ActiveMatchCopyWith<$Res>
    implements $ActiveMatchCopyWith<$Res> {
  factory _$ActiveMatchCopyWith(
          _ActiveMatch value, $Res Function(_ActiveMatch) then) =
      __$ActiveMatchCopyWithImpl<$Res>;
  @override
  $Res call(
      {int matchId,
      int tournamentId,
      bool? actionNeeded,
      bool? scoreSubmitted});
}

/// @nodoc
class __$ActiveMatchCopyWithImpl<$Res> extends _$ActiveMatchCopyWithImpl<$Res>
    implements _$ActiveMatchCopyWith<$Res> {
  __$ActiveMatchCopyWithImpl(
      _ActiveMatch _value, $Res Function(_ActiveMatch) _then)
      : super(_value, (v) => _then(v as _ActiveMatch));

  @override
  _ActiveMatch get _value => super._value as _ActiveMatch;

  @override
  $Res call({
    Object? matchId = freezed,
    Object? tournamentId = freezed,
    Object? actionNeeded = freezed,
    Object? scoreSubmitted = freezed,
  }) {
    return _then(_ActiveMatch(
      matchId: matchId == freezed
          ? _value.matchId
          : matchId // ignore: cast_nullable_to_non_nullable
              as int,
      tournamentId: tournamentId == freezed
          ? _value.tournamentId
          : tournamentId // ignore: cast_nullable_to_non_nullable
              as int,
      actionNeeded: actionNeeded == freezed
          ? _value.actionNeeded
          : actionNeeded // ignore: cast_nullable_to_non_nullable
              as bool?,
      scoreSubmitted: scoreSubmitted == freezed
          ? _value.scoreSubmitted
          : scoreSubmitted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ActiveMatch extends _ActiveMatch {
  _$_ActiveMatch(
      {required this.matchId,
      required this.tournamentId,
      this.actionNeeded,
      this.scoreSubmitted})
      : super._();

  factory _$_ActiveMatch.fromJson(Map<String, dynamic> json) =>
      _$$_ActiveMatchFromJson(json);

  @override
  final int matchId;
  @override
  final int tournamentId;
  @override
  final bool? actionNeeded;
  @override
  final bool? scoreSubmitted;

  @override
  String toString() {
    return 'ActiveMatch(matchId: $matchId, tournamentId: $tournamentId, actionNeeded: $actionNeeded, scoreSubmitted: $scoreSubmitted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ActiveMatch &&
            const DeepCollectionEquality().equals(other.matchId, matchId) &&
            const DeepCollectionEquality()
                .equals(other.tournamentId, tournamentId) &&
            const DeepCollectionEquality()
                .equals(other.actionNeeded, actionNeeded) &&
            const DeepCollectionEquality()
                .equals(other.scoreSubmitted, scoreSubmitted));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(matchId),
      const DeepCollectionEquality().hash(tournamentId),
      const DeepCollectionEquality().hash(actionNeeded),
      const DeepCollectionEquality().hash(scoreSubmitted));

  @JsonKey(ignore: true)
  @override
  _$ActiveMatchCopyWith<_ActiveMatch> get copyWith =>
      __$ActiveMatchCopyWithImpl<_ActiveMatch>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ActiveMatchToJson(this);
  }
}

abstract class _ActiveMatch extends ActiveMatch {
  factory _ActiveMatch(
      {required int matchId,
      required int tournamentId,
      bool? actionNeeded,
      bool? scoreSubmitted}) = _$_ActiveMatch;
  _ActiveMatch._() : super._();

  factory _ActiveMatch.fromJson(Map<String, dynamic> json) =
      _$_ActiveMatch.fromJson;

  @override
  int get matchId;
  @override
  int get tournamentId;
  @override
  bool? get actionNeeded;
  @override
  bool? get scoreSubmitted;
  @override
  @JsonKey(ignore: true)
  _$ActiveMatchCopyWith<_ActiveMatch> get copyWith =>
      throw _privateConstructorUsedError;
}
