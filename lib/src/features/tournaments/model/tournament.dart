import 'package:fifa/src/common/data/converters.dart';
import 'package:fifa/src/common/domain/tournament/tournament.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/features/club/model/club.dart';
import 'package:fifa/src/features/tournaments/collection/model/tournament_collection.dart';
import 'package:fifa/src/features/tournaments/tournament_details/models/tournament.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tournament.g.dart';

List<Tournament> tournamentFromJson(List<dynamic> str) =>
    List<Tournament>.from(str.map<Tournament>((dynamic x) => Tournament.fromJson(x as Map<String, dynamic>)));

@JsonSerializable()
class Tournament implements TournamentInterface {
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

  final String? customBanner;
  final TournamentFormat format;
  final int winPoints;
  final int tiePoints;
  final int lossPoints;
  final Club? org;

  Tournament({
    required this.id,
    required this.name,
    this.logo,
    this.banner,
    required this.flags,
    required this.internalFlags,
    required this.startsAt,
    this.endsAt,
    required this.participants,
    this.slots,
    required this.gameId,
    required this.gameSettings,
    this.org,
    this.customBanner,
    required this.format,
    required this.winPoints,
    required this.tiePoints,
    required this.lossPoints,
  });

  factory Tournament.fromJson(Map<String, dynamic> json) => _$TournamentFromJson(
      json..update('game_settings', (dynamic _) => 'MANUALLY REMOVED, SEE fromJson implementation'));

  TournamentFormat? get tournamentFormat => format;

  bool get isCollection => tournamentFormat == null;
}



class TournamentFormData {
  final bool hasBracket;
  final bool hasPoints;
  final bool allowTies;

  TournamentFormData({required this.hasBracket, required this.hasPoints, required this.allowTies});
}

extension TournamentFormatData on TournamentFormat {
  TournamentFormData get tournamentFormData {
    switch (this) {
      case TournamentFormat.matchmaking:
        return TournamentFormData(hasBracket: false, hasPoints: false, allowTies: true);
      case TournamentFormat.singleElimination:
        return TournamentFormData(hasBracket: true, hasPoints: false, allowTies: false);
      case TournamentFormat.swissSystem:
        return TournamentFormData(hasBracket: true, hasPoints: true, allowTies: true);
      case TournamentFormat.roundRobin:
        return TournamentFormData(hasBracket: true, hasPoints: true, allowTies: true);
      case TournamentFormat.stages:
        return TournamentFormData(hasBracket: true, hasPoints: true, allowTies: true);
    }
  }
}

enum SignupStatus {
  @JsonValue(1)
  notJoined,
  @JsonValue(2)
  pending,
  @JsonValue(3)
  joined
}

extension TournamentFormatX on TournamentFormat? {
  String stringValue(BuildContext context) {
    switch (this) {
      case TournamentFormat.matchmaking:
        return context.l10n.matchmaking;
      case TournamentFormat.singleElimination:
        return context.l10n.singleElimination;
      case TournamentFormat.swissSystem:
        return context.l10n.swiss;
      case TournamentFormat.roundRobin:
        return context.l10n.roundRobin;
      default:
        return '';
    }
  }
}

extension TournamentFlagsX on Tournament {
  /// Check if a tournament has a given flag[TournamentFlags]
  /// ```
  /// hasFlag(TournamentFlags.xbox);
  /// ```
  bool hasFlag(int requestedFlag) {
    return flags & requestedFlag != 0;
  }

  /// Check if a tournament has a given internal flag[InternalTournamentFlags]
  /// ```
  /// hasInternalFlag(InternalTournamentFlags.bracketsSaved);
  /// ```
  bool hasInternalFlag(int requestedFlag) {
    return (internalFlags ?? 0) & requestedFlag != 0;
  }
}

extension TournamentEntryFlagsX on TournamentEntry {
  /// Check if a tournament has a given flag[TournamentFlags]
  /// ```
  /// hasFlag(TournamentFlags.xbox);
  /// ```
  bool hasFlag(int requestedFlag) {
    return flags & requestedFlag != 0;
  }

  /// Check if a tournament has a given internal flag[InternalTournamentFlags]
  /// ```
  /// hasInternalFlag(InternalTournamentFlags.bracketsSaved);
  /// ```
  bool hasInternalFlag(int requestedFlag) {
    return (internalFlags??0) & requestedFlag != 0;
  }
}

extension TournamentCollectionFlagsX on TournamentCollection {
  /// Check if a tournament has a given flag[TournamentFlags]
  /// ```
  /// hasFlag(TournamentFlags.xbox);@Implements<TournamentInterface>()
  /// ```
  bool hasFlag(int requestedFlag) {
    return flags & requestedFlag != 0;
  }

  /// Check if a tournament has a given internal flag[InternalTournamentFlags]
  /// ```
  /// hasInternalFlag(InternalTournamentFlags.bracketsSaved);
  /// ```
  bool hasInternalFlag(int requestedFlag) {
    return (internalFlags ?? 0) & requestedFlag != 0;
  }
}

class TournamentFlags {
  const TournamentFlags._();

  static const xbox = 1 << 0;
  static const playstation = 1 << 1;
  static const canJoinAfterStart = 1 << 2;
  static const onlyMatchDifferentTeams = 1 << 3;
  static const autoAccept = 1 << 4;
  static const startImmediately = 1 << 5;
  static const featured = 1 << 6;
  static const tiesEnabled = 1 << 7;
  static const orgFeatured = 1 << 8;
  static const customBanner = 1 << 9;
}

class InternalTournamentFlags {
  const InternalTournamentFlags._();

  static const bracketsSaved = 1 << 0;
  static const tournamentStarted = 1 << 1;
}

enum GameId {
  @JsonValue(1)
  fifa21,
  @JsonValue(2)
  pes20,
  @JsonValue(3)
  fifa22,
}

extension GameIdNaming on GameId {
  String gameName() {
    switch (this) {
      case GameId.fifa21:
        return 'FIFA 21';
      case GameId.pes20:
        return 'eFootball PES 2020';
      case GameId.fifa22:
        return 'FIFA 22';
    }
  }

  String gameType() {
    switch (this) {
      case GameId.fifa21:
      case GameId.fifa22:
        return 'FIFA';
      case GameId.pes20:
        return 'PES';
    }
  }
}
