import 'dart:core';

import 'package:fifa/src/common/data/converters.dart';
import 'package:fifa/src/common/domain/org/org.dart';
import 'package:fifa/src/common/domain/tournament/tournament.dart';
import 'package:fifa/src/common/domain/user/user.dart';
import 'package:fifa/src/common/utils.dart';
import 'package:fifa/src/features/tournaments/collection/model/tournament_collection.dart';
import 'package:fifa/src/features/tournaments/model/tournament.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tournament.freezed.dart';
part 'tournament.g.dart';

@JsonSerializable()
class TournamentEntry implements TournamentDetails {
  final int id;
  final String name;
  final String? logo;
  final String? banner;
  final int flags;
  final int? internalFlags;
  @TimestampConverter()
  final DateTime startsAt;
  @NullableTimestampConverter()
  final DateTime? endsAt;
  final int participants;
  final int? slots;
  final GameId gameId;
  final String gameSettings;
  final String? description;
  final OrgRef? org;
  final League? league;
  final List<TournamentPrize>? prizes;
  final String? customBanner;
  final TournamentFormat format;
  final int winPoints;
  final int tiePoints;
  final int lossPoints;

  TournamentEntry({
    required this.id,
    required this.name,
    this.logo,
    this.banner,
    required this.flags,
    this.internalFlags,
    required this.startsAt,
    this.endsAt,
    required this.participants,
    this.slots,
    required this.gameId,
    required this.gameSettings,
    this.description,
    this.org,
    this.league,
    this.prizes,
    this.customBanner,
    required this.format,
    required this.winPoints,
    required this.tiePoints,
    required this.lossPoints,
  });

  factory TournamentEntry.fromJson(Map<String, dynamic> json) => _$TournamentEntryFromJson(json);

  int get rounds {
    switch (format) {
      case TournamentFormat.singleElimination:
      case TournamentFormat.swissSystem:
        return log2(participants).ceil();
      case TournamentFormat.roundRobin:
        return participants - 1;
      default:
        return 0;
    }
  }

  @override
  TournamentFormat? get tournamentFormat => format;

  @override
  bool get isCollection => tournamentFormat == null;
}

@freezed
class TournamentLobbyBasic with _$TournamentLobbyBasic {
  const factory TournamentLobbyBasic(
      {required int id,
      required int bracketId,
      @NullableTimestampConverter() DateTime? user1CheckIn,
      @NullableTimestampConverter() DateTime? user2CheckIn}) = _TournamentLobbyBasic;

  const TournamentLobbyBasic._();

  factory TournamentLobbyBasic.fromJson(Map<String, dynamic> json) => _$TournamentLobbyBasicFromJson(json);
}

@freezed
class TournamentLobby with _$TournamentLobby {
  // @Implements<TournamentLobbyBasic>()
  const factory TournamentLobby({
    required int id,
    required int bracketId,
    @NullableTimestampConverter() DateTime? user1CheckIn,
    @NullableTimestampConverter() DateTime? user2CheckIn,
    required UserBasicInfo user1,
    required UserBasicInfo user2,
    int? matchId,
    required int tournamentId,
    @TimestampConverter() required DateTime walkoverTime,
  }) = _TournamentLobby;

  const TournamentLobby._();

  factory TournamentLobby.fromJson(Map<String, dynamic> json) => _$TournamentLobbyFromJson(json);
}

@freezed
class League with _$League {
  const factory League({
    required int id,
    required String name,
    String? logo,
    int? countryId,
    required int inserted,
  }) = _League;

  factory League.fromJson(Map<String, dynamic> json) => _$LeagueFromJson(json);
}

@freezed
class TournamentPrize with _$TournamentPrize {
  const factory TournamentPrize({
    required int place,
    required String title,
    required String amount,
    String? image,
  }) = _TournamentPrize;

  factory TournamentPrize.fromJson(Map<String, dynamic> json) => _$TournamentPrizeFromJson(json);
}
