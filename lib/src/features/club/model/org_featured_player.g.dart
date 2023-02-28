// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'org_featured_player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrgFeaturedPlayer _$$_OrgFeaturedPlayerFromJson(Map<String, dynamic> json) =>
    _$_OrgFeaturedPlayer(
      id: json['id'] as int,
      userId: json['user_id'] as int?,
      username: json['username'] as String,
      altUsername: json['alt_username'] as String?,
      image: json['image'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      birthDay: json['birth_day'] as int?,
      birthMonth: json['birth_month'] as int?,
      birthYear: json['birth_year'] as int?,
      countryId: json['country_id'] as int?,
      stats: UserProfileStats.fromJson(json['stats'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_OrgFeaturedPlayerToJson(
        _$_OrgFeaturedPlayer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'username': instance.username,
      'alt_username': instance.altUsername,
      'image': instance.image,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'birth_day': instance.birthDay,
      'birth_month': instance.birthMonth,
      'birth_year': instance.birthYear,
      'country_id': instance.countryId,
      'stats': instance.stats,
    };

_$_UserProfileStats _$$_UserProfileStatsFromJson(Map<String, dynamic> json) =>
    _$_UserProfileStats(
      wins: json['wins'] as int?,
      losses: json['losses'] as int?,
      ties: json['ties'] as int?,
      drops: json['drops'] as int?,
      matches: json['matches'] as int?,
      goalsScored: json['goals_scored'] as int?,
      goalsConceded: json['goals_conceded'] as int?,
    );

Map<String, dynamic> _$$_UserProfileStatsToJson(_$_UserProfileStats instance) =>
    <String, dynamic>{
      'wins': instance.wins,
      'losses': instance.losses,
      'ties': instance.ties,
      'drops': instance.drops,
      'matches': instance.matches,
      'goals_scored': instance.goalsScored,
      'goals_conceded': instance.goalsConceded,
    };
