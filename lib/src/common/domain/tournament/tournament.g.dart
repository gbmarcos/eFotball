// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournament.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TournamentRef _$TournamentRefFromJson(Map<String, dynamic> json) =>
    TournamentRef(
      id: json['id'] as int,
      name: json['name'] as String,
      logo: json['logo'] as String?,
      banner: json['banner'] as String?,
      flags: json['flags'] as int,
      internalFlags: json['internal_flags'] as int?,
    );

Map<String, dynamic> _$TournamentRefToJson(TournamentRef instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'banner': instance.banner,
      'flags': instance.flags,
      'internal_flags': instance.internalFlags,
    };

NextMatchTournament _$NextMatchTournamentFromJson(Map<String, dynamic> json) =>
    NextMatchTournament(
      id: json['id'] as int?,
      name: json['name'] as String?,
      logo: json['logo'] as String?,
    );

Map<String, dynamic> _$NextMatchTournamentToJson(
        NextMatchTournament instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
    };
