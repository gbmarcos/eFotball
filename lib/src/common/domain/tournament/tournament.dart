import 'package:freezed_annotation/freezed_annotation.dart';

part 'tournament.g.dart';

@JsonSerializable()
class TournamentRef {
  final int id;
  final String name;
  final String? logo;
  final String? banner;
  final int flags;
  final int? internalFlags;

  TournamentRef({
    required this.id,
    required this.name,
    this.logo,
    this.banner,
    required this.flags,
    this.internalFlags,
  });

  factory TournamentRef.fromJson(Map<String, dynamic> json) => _$TournamentRefFromJson(json);

  @override
  String toString() {
    return 'TournamentRef{id: $id, name: $name, logo: $logo, banner: $banner, flags: $flags, internalFlags: $internalFlags}';
  }
}

abstract class TournamentInterface implements TournamentRef {
  final int? slots;
  final int participants;
  final DateTime startsAt;

  TournamentInterface({
    this.slots,
    required this.participants,
    required this.startsAt,
  });

  TournamentFormat? get tournamentFormat;

  bool get isCollection => tournamentFormat == null;
}

extension TournamentFlagsX on TournamentRef {
  /// Check if a tournament has a given flag[TournamentFlags]
  /// ```
  /// hasFlag(TournamentFlags.xbox);
  /// ```
  bool hasFlag(int requestedFlag) {
    return flags & requestedFlag != 0;
  }

  bool hasInternalFlag(int requestedFlag) {
    return (internalFlags != null) && (internalFlags! & requestedFlag != 0);
  }
}

@JsonSerializable()
class NextMatchTournament {
  final int? id;
  final String? name;
  final String? logo;

  NextMatchTournament({this.id, this.name, this.logo});

  factory NextMatchTournament.fromJson(Map<String, dynamic> json) => _$NextMatchTournamentFromJson(json);
}

enum TournamentFormat {
  @JsonValue(0)
  matchmaking,
  @JsonValue(1)
  singleElimination,
  @JsonValue(2)
  swissSystem,
  @JsonValue(3)
  roundRobin,
  @JsonValue(4)
  stages,
}
