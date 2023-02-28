// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeamRef _$TeamRefFromJson(Map<String, dynamic> json) => TeamRef(
      id: json['id'] as int,
      name: json['name'] as String,
      logo: json['logo'] as String?,
    );

Map<String, dynamic> _$TeamRefToJson(TeamRef instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
    };

NextMatchTeam _$NextMatchTeamFromJson(Map<String, dynamic> json) =>
    NextMatchTeam(
      orgId: json['org_id'] as int?,
      teamId: json['team_id'] as int?,
      name: json['name'] as String?,
      logo: json['logo'] as String?,
    );

Map<String, dynamic> _$NextMatchTeamToJson(NextMatchTeam instance) =>
    <String, dynamic>{
      'org_id': instance.orgId,
      'team_id': instance.teamId,
      'name': instance.name,
      'logo': instance.logo,
    };
