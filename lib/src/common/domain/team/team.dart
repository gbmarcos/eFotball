import 'package:freezed_annotation/freezed_annotation.dart';

part 'team.g.dart';

@JsonSerializable()
class TeamRef {
  final int id;
  final String name;
  final String? logo;

  TeamRef({
    required this.id,
    required this.name,
    this.logo,
  });

  factory TeamRef.fromJson(Map<String, dynamic> json) => _$TeamRefFromJson(json);
}

@JsonSerializable()
class NextMatchTeam {
  final int? orgId;
  final int? teamId;
  final String? name;
  final String? logo;

  NextMatchTeam({this.orgId, this.teamId, this.name, this.logo});

  factory NextMatchTeam.fromJson(Map<String, dynamic> json) => _$NextMatchTeamFromJson(json);
}
