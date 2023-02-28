// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tournament_collection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TournamentCollectionStageEntry _$TournamentCollectionStageEntryFromJson(
    Map<String, dynamic> json) {
  return _TournamentCollectionStageEntry.fromJson(json);
}

/// @nodoc
class _$TournamentCollectionStageEntryTearOff {
  const _$TournamentCollectionStageEntryTearOff();

  _TournamentCollectionStageEntry call(
      {required int id,
      required String name,
      String? logo,
      String? banner,
      required int flags,
      required int stage,
      required int format,
      required int slots,
      required int participants,
      int? winners,
      int? winningStage,
      int? internalFlags,
      int? winningStageTournamentID}) {
    return _TournamentCollectionStageEntry(
      id: id,
      name: name,
      logo: logo,
      banner: banner,
      flags: flags,
      stage: stage,
      format: format,
      slots: slots,
      participants: participants,
      winners: winners,
      winningStage: winningStage,
      internalFlags: internalFlags,
      winningStageTournamentID: winningStageTournamentID,
    );
  }

  TournamentCollectionStageEntry fromJson(Map<String, Object?> json) {
    return TournamentCollectionStageEntry.fromJson(json);
  }
}

/// @nodoc
const $TournamentCollectionStageEntry =
    _$TournamentCollectionStageEntryTearOff();

/// @nodoc
mixin _$TournamentCollectionStageEntry {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;
  String? get banner => throw _privateConstructorUsedError;
  int get flags => throw _privateConstructorUsedError;

  ///	* The stage of the tournament. Tournaments with stage 0 are the tournaments that are played first.
  int get stage => throw _privateConstructorUsedError;
  int get format => throw _privateConstructorUsedError;
  int get slots => throw _privateConstructorUsedError;
  int get participants => throw _privateConstructorUsedError;

  ///	* The number of participants that will go to the next stage of the tournament collection if they win.
  int? get winners => throw _privateConstructorUsedError;

  ///	* The ID of the stage in tournament_collection_stages. Only used in admin tournament collection editor.
  int? get winningStage => throw _privateConstructorUsedError;
  int? get internalFlags => throw _privateConstructorUsedError;

  ///		* The ID of the tournament in this collection that winners will go to.
  int? get winningStageTournamentID => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TournamentCollectionStageEntryCopyWith<TournamentCollectionStageEntry>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TournamentCollectionStageEntryCopyWith<$Res> {
  factory $TournamentCollectionStageEntryCopyWith(
          TournamentCollectionStageEntry value,
          $Res Function(TournamentCollectionStageEntry) then) =
      _$TournamentCollectionStageEntryCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      String? logo,
      String? banner,
      int flags,
      int stage,
      int format,
      int slots,
      int participants,
      int? winners,
      int? winningStage,
      int? internalFlags,
      int? winningStageTournamentID});
}

/// @nodoc
class _$TournamentCollectionStageEntryCopyWithImpl<$Res>
    implements $TournamentCollectionStageEntryCopyWith<$Res> {
  _$TournamentCollectionStageEntryCopyWithImpl(this._value, this._then);

  final TournamentCollectionStageEntry _value;
  // ignore: unused_field
  final $Res Function(TournamentCollectionStageEntry) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? logo = freezed,
    Object? banner = freezed,
    Object? flags = freezed,
    Object? stage = freezed,
    Object? format = freezed,
    Object? slots = freezed,
    Object? participants = freezed,
    Object? winners = freezed,
    Object? winningStage = freezed,
    Object? internalFlags = freezed,
    Object? winningStageTournamentID = freezed,
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
      banner: banner == freezed
          ? _value.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as String?,
      flags: flags == freezed
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as int,
      stage: stage == freezed
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as int,
      format: format == freezed
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as int,
      slots: slots == freezed
          ? _value.slots
          : slots // ignore: cast_nullable_to_non_nullable
              as int,
      participants: participants == freezed
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as int,
      winners: winners == freezed
          ? _value.winners
          : winners // ignore: cast_nullable_to_non_nullable
              as int?,
      winningStage: winningStage == freezed
          ? _value.winningStage
          : winningStage // ignore: cast_nullable_to_non_nullable
              as int?,
      internalFlags: internalFlags == freezed
          ? _value.internalFlags
          : internalFlags // ignore: cast_nullable_to_non_nullable
              as int?,
      winningStageTournamentID: winningStageTournamentID == freezed
          ? _value.winningStageTournamentID
          : winningStageTournamentID // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$TournamentCollectionStageEntryCopyWith<$Res>
    implements $TournamentCollectionStageEntryCopyWith<$Res> {
  factory _$TournamentCollectionStageEntryCopyWith(
          _TournamentCollectionStageEntry value,
          $Res Function(_TournamentCollectionStageEntry) then) =
      __$TournamentCollectionStageEntryCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      String? logo,
      String? banner,
      int flags,
      int stage,
      int format,
      int slots,
      int participants,
      int? winners,
      int? winningStage,
      int? internalFlags,
      int? winningStageTournamentID});
}

/// @nodoc
class __$TournamentCollectionStageEntryCopyWithImpl<$Res>
    extends _$TournamentCollectionStageEntryCopyWithImpl<$Res>
    implements _$TournamentCollectionStageEntryCopyWith<$Res> {
  __$TournamentCollectionStageEntryCopyWithImpl(
      _TournamentCollectionStageEntry _value,
      $Res Function(_TournamentCollectionStageEntry) _then)
      : super(_value, (v) => _then(v as _TournamentCollectionStageEntry));

  @override
  _TournamentCollectionStageEntry get _value =>
      super._value as _TournamentCollectionStageEntry;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? logo = freezed,
    Object? banner = freezed,
    Object? flags = freezed,
    Object? stage = freezed,
    Object? format = freezed,
    Object? slots = freezed,
    Object? participants = freezed,
    Object? winners = freezed,
    Object? winningStage = freezed,
    Object? internalFlags = freezed,
    Object? winningStageTournamentID = freezed,
  }) {
    return _then(_TournamentCollectionStageEntry(
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
      banner: banner == freezed
          ? _value.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as String?,
      flags: flags == freezed
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as int,
      stage: stage == freezed
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as int,
      format: format == freezed
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as int,
      slots: slots == freezed
          ? _value.slots
          : slots // ignore: cast_nullable_to_non_nullable
              as int,
      participants: participants == freezed
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as int,
      winners: winners == freezed
          ? _value.winners
          : winners // ignore: cast_nullable_to_non_nullable
              as int?,
      winningStage: winningStage == freezed
          ? _value.winningStage
          : winningStage // ignore: cast_nullable_to_non_nullable
              as int?,
      internalFlags: internalFlags == freezed
          ? _value.internalFlags
          : internalFlags // ignore: cast_nullable_to_non_nullable
              as int?,
      winningStageTournamentID: winningStageTournamentID == freezed
          ? _value.winningStageTournamentID
          : winningStageTournamentID // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@Implements<TournamentRef>()
class _$_TournamentCollectionStageEntry
    extends _TournamentCollectionStageEntry {
  const _$_TournamentCollectionStageEntry(
      {required this.id,
      required this.name,
      this.logo,
      this.banner,
      required this.flags,
      required this.stage,
      required this.format,
      required this.slots,
      required this.participants,
      this.winners,
      this.winningStage,
      this.internalFlags,
      this.winningStageTournamentID})
      : super._();

  factory _$_TournamentCollectionStageEntry.fromJson(
          Map<String, dynamic> json) =>
      _$$_TournamentCollectionStageEntryFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? logo;
  @override
  final String? banner;
  @override
  final int flags;
  @override

  ///	* The stage of the tournament. Tournaments with stage 0 are the tournaments that are played first.
  final int stage;
  @override
  final int format;
  @override
  final int slots;
  @override
  final int participants;
  @override

  ///	* The number of participants that will go to the next stage of the tournament collection if they win.
  final int? winners;
  @override

  ///	* The ID of the stage in tournament_collection_stages. Only used in admin tournament collection editor.
  final int? winningStage;
  @override
  final int? internalFlags;
  @override

  ///		* The ID of the tournament in this collection that winners will go to.
  final int? winningStageTournamentID;

  @override
  String toString() {
    return 'TournamentCollectionStageEntry(id: $id, name: $name, logo: $logo, banner: $banner, flags: $flags, stage: $stage, format: $format, slots: $slots, participants: $participants, winners: $winners, winningStage: $winningStage, internalFlags: $internalFlags, winningStageTournamentID: $winningStageTournamentID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TournamentCollectionStageEntry &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.logo, logo) &&
            const DeepCollectionEquality().equals(other.banner, banner) &&
            const DeepCollectionEquality().equals(other.flags, flags) &&
            const DeepCollectionEquality().equals(other.stage, stage) &&
            const DeepCollectionEquality().equals(other.format, format) &&
            const DeepCollectionEquality().equals(other.slots, slots) &&
            const DeepCollectionEquality()
                .equals(other.participants, participants) &&
            const DeepCollectionEquality().equals(other.winners, winners) &&
            const DeepCollectionEquality()
                .equals(other.winningStage, winningStage) &&
            const DeepCollectionEquality()
                .equals(other.internalFlags, internalFlags) &&
            const DeepCollectionEquality().equals(
                other.winningStageTournamentID, winningStageTournamentID));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(logo),
      const DeepCollectionEquality().hash(banner),
      const DeepCollectionEquality().hash(flags),
      const DeepCollectionEquality().hash(stage),
      const DeepCollectionEquality().hash(format),
      const DeepCollectionEquality().hash(slots),
      const DeepCollectionEquality().hash(participants),
      const DeepCollectionEquality().hash(winners),
      const DeepCollectionEquality().hash(winningStage),
      const DeepCollectionEquality().hash(internalFlags),
      const DeepCollectionEquality().hash(winningStageTournamentID));

  @JsonKey(ignore: true)
  @override
  _$TournamentCollectionStageEntryCopyWith<_TournamentCollectionStageEntry>
      get copyWith => __$TournamentCollectionStageEntryCopyWithImpl<
          _TournamentCollectionStageEntry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TournamentCollectionStageEntryToJson(this);
  }
}

abstract class _TournamentCollectionStageEntry
    extends TournamentCollectionStageEntry implements TournamentRef {
  const factory _TournamentCollectionStageEntry(
      {required int id,
      required String name,
      String? logo,
      String? banner,
      required int flags,
      required int stage,
      required int format,
      required int slots,
      required int participants,
      int? winners,
      int? winningStage,
      int? internalFlags,
      int? winningStageTournamentID}) = _$_TournamentCollectionStageEntry;
  const _TournamentCollectionStageEntry._() : super._();

  factory _TournamentCollectionStageEntry.fromJson(Map<String, dynamic> json) =
      _$_TournamentCollectionStageEntry.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get logo;
  @override
  String? get banner;
  @override
  int get flags;
  @override

  ///	* The stage of the tournament. Tournaments with stage 0 are the tournaments that are played first.
  int get stage;
  @override
  int get format;
  @override
  int get slots;
  @override
  int get participants;
  @override

  ///	* The number of participants that will go to the next stage of the tournament collection if they win.
  int? get winners;
  @override

  ///	* The ID of the stage in tournament_collection_stages. Only used in admin tournament collection editor.
  int? get winningStage;
  @override
  int? get internalFlags;
  @override

  ///		* The ID of the tournament in this collection that winners will go to.
  int? get winningStageTournamentID;
  @override
  @JsonKey(ignore: true)
  _$TournamentCollectionStageEntryCopyWith<_TournamentCollectionStageEntry>
      get copyWith => throw _privateConstructorUsedError;
}

MatchHistory _$MatchHistoryFromJson(Map<String, dynamic> json) {
  return _MatchHistory.fromJson(json);
}

/// @nodoc
class _$MatchHistoryTearOff {
  const _$MatchHistoryTearOff();

  _MatchHistory call(
      {required int id,
      required int tournamentId,
      required int user1Id,
      required int user2Id,
      required String opponentName,
      int? score1,
      int? score2,
      required int flags}) {
    return _MatchHistory(
      id: id,
      tournamentId: tournamentId,
      user1Id: user1Id,
      user2Id: user2Id,
      opponentName: opponentName,
      score1: score1,
      score2: score2,
      flags: flags,
    );
  }

  MatchHistory fromJson(Map<String, Object?> json) {
    return MatchHistory.fromJson(json);
  }
}

/// @nodoc
const $MatchHistory = _$MatchHistoryTearOff();

/// @nodoc
mixin _$MatchHistory {
  int get id => throw _privateConstructorUsedError;
  int get tournamentId => throw _privateConstructorUsedError;
  int get user1Id => throw _privateConstructorUsedError;
  int get user2Id => throw _privateConstructorUsedError;
  String get opponentName => throw _privateConstructorUsedError;
  int? get score1 => throw _privateConstructorUsedError;
  int? get score2 => throw _privateConstructorUsedError;
  int get flags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchHistoryCopyWith<MatchHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchHistoryCopyWith<$Res> {
  factory $MatchHistoryCopyWith(
          MatchHistory value, $Res Function(MatchHistory) then) =
      _$MatchHistoryCopyWithImpl<$Res>;
  $Res call(
      {int id,
      int tournamentId,
      int user1Id,
      int user2Id,
      String opponentName,
      int? score1,
      int? score2,
      int flags});
}

/// @nodoc
class _$MatchHistoryCopyWithImpl<$Res> implements $MatchHistoryCopyWith<$Res> {
  _$MatchHistoryCopyWithImpl(this._value, this._then);

  final MatchHistory _value;
  // ignore: unused_field
  final $Res Function(MatchHistory) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? tournamentId = freezed,
    Object? user1Id = freezed,
    Object? user2Id = freezed,
    Object? opponentName = freezed,
    Object? score1 = freezed,
    Object? score2 = freezed,
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
              as int,
      user2Id: user2Id == freezed
          ? _value.user2Id
          : user2Id // ignore: cast_nullable_to_non_nullable
              as int,
      opponentName: opponentName == freezed
          ? _value.opponentName
          : opponentName // ignore: cast_nullable_to_non_nullable
              as String,
      score1: score1 == freezed
          ? _value.score1
          : score1 // ignore: cast_nullable_to_non_nullable
              as int?,
      score2: score2 == freezed
          ? _value.score2
          : score2 // ignore: cast_nullable_to_non_nullable
              as int?,
      flags: flags == freezed
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$MatchHistoryCopyWith<$Res>
    implements $MatchHistoryCopyWith<$Res> {
  factory _$MatchHistoryCopyWith(
          _MatchHistory value, $Res Function(_MatchHistory) then) =
      __$MatchHistoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      int tournamentId,
      int user1Id,
      int user2Id,
      String opponentName,
      int? score1,
      int? score2,
      int flags});
}

/// @nodoc
class __$MatchHistoryCopyWithImpl<$Res> extends _$MatchHistoryCopyWithImpl<$Res>
    implements _$MatchHistoryCopyWith<$Res> {
  __$MatchHistoryCopyWithImpl(
      _MatchHistory _value, $Res Function(_MatchHistory) _then)
      : super(_value, (v) => _then(v as _MatchHistory));

  @override
  _MatchHistory get _value => super._value as _MatchHistory;

  @override
  $Res call({
    Object? id = freezed,
    Object? tournamentId = freezed,
    Object? user1Id = freezed,
    Object? user2Id = freezed,
    Object? opponentName = freezed,
    Object? score1 = freezed,
    Object? score2 = freezed,
    Object? flags = freezed,
  }) {
    return _then(_MatchHistory(
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
              as int,
      user2Id: user2Id == freezed
          ? _value.user2Id
          : user2Id // ignore: cast_nullable_to_non_nullable
              as int,
      opponentName: opponentName == freezed
          ? _value.opponentName
          : opponentName // ignore: cast_nullable_to_non_nullable
              as String,
      score1: score1 == freezed
          ? _value.score1
          : score1 // ignore: cast_nullable_to_non_nullable
              as int?,
      score2: score2 == freezed
          ? _value.score2
          : score2 // ignore: cast_nullable_to_non_nullable
              as int?,
      flags: flags == freezed
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MatchHistory extends _MatchHistory {
  const _$_MatchHistory(
      {required this.id,
      required this.tournamentId,
      required this.user1Id,
      required this.user2Id,
      required this.opponentName,
      this.score1,
      this.score2,
      required this.flags})
      : super._();

  factory _$_MatchHistory.fromJson(Map<String, dynamic> json) =>
      _$$_MatchHistoryFromJson(json);

  @override
  final int id;
  @override
  final int tournamentId;
  @override
  final int user1Id;
  @override
  final int user2Id;
  @override
  final String opponentName;
  @override
  final int? score1;
  @override
  final int? score2;
  @override
  final int flags;

  @override
  String toString() {
    return 'MatchHistory(id: $id, tournamentId: $tournamentId, user1Id: $user1Id, user2Id: $user2Id, opponentName: $opponentName, score1: $score1, score2: $score2, flags: $flags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MatchHistory &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.tournamentId, tournamentId) &&
            const DeepCollectionEquality().equals(other.user1Id, user1Id) &&
            const DeepCollectionEquality().equals(other.user2Id, user2Id) &&
            const DeepCollectionEquality()
                .equals(other.opponentName, opponentName) &&
            const DeepCollectionEquality().equals(other.score1, score1) &&
            const DeepCollectionEquality().equals(other.score2, score2) &&
            const DeepCollectionEquality().equals(other.flags, flags));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(tournamentId),
      const DeepCollectionEquality().hash(user1Id),
      const DeepCollectionEquality().hash(user2Id),
      const DeepCollectionEquality().hash(opponentName),
      const DeepCollectionEquality().hash(score1),
      const DeepCollectionEquality().hash(score2),
      const DeepCollectionEquality().hash(flags));

  @JsonKey(ignore: true)
  @override
  _$MatchHistoryCopyWith<_MatchHistory> get copyWith =>
      __$MatchHistoryCopyWithImpl<_MatchHistory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MatchHistoryToJson(this);
  }
}

abstract class _MatchHistory extends MatchHistory {
  const factory _MatchHistory(
      {required int id,
      required int tournamentId,
      required int user1Id,
      required int user2Id,
      required String opponentName,
      int? score1,
      int? score2,
      required int flags}) = _$_MatchHistory;
  const _MatchHistory._() : super._();

  factory _MatchHistory.fromJson(Map<String, dynamic> json) =
      _$_MatchHistory.fromJson;

  @override
  int get id;
  @override
  int get tournamentId;
  @override
  int get user1Id;
  @override
  int get user2Id;
  @override
  String get opponentName;
  @override
  int? get score1;
  @override
  int? get score2;
  @override
  int get flags;
  @override
  @JsonKey(ignore: true)
  _$MatchHistoryCopyWith<_MatchHistory> get copyWith =>
      throw _privateConstructorUsedError;
}
