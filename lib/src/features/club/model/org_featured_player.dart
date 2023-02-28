import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/common/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'org_featured_player.freezed.dart';

part 'org_featured_player.g.dart';

List<OrgFeaturedPlayer> orgFeaturedPlayerFromJson(List<dynamic> str) => List<OrgFeaturedPlayer>.from(
    str.map<OrgFeaturedPlayer>((dynamic x) => OrgFeaturedPlayer.fromJson(x as Map<String, dynamic>)));

@freezed
abstract class OrgFeaturedPlayer with _$OrgFeaturedPlayer {
  const factory OrgFeaturedPlayer({
    required int id,
    int? userId,
    required String username,

    ///The username that this player's known as on other websites.
    String? altUsername,

    ///The player's team picture.
    String? image,
    String? firstName,
    String? lastName,
    int? birthDay,
    int? birthMonth,
    int? birthYear,
    int? countryId,
    required UserProfileStats stats,
  }) = _OrgFeaturedPlayer;

  const OrgFeaturedPlayer._();

  factory OrgFeaturedPlayer.fromJson(Map<String, dynamic> json) => _$OrgFeaturedPlayerFromJson(json);

  DateTime? get birthDateTime => birthDate(birthYear: birthYear, birthMonth: birthMonth, birthDay: birthDay);

  ///Calculates the age of an user comparing its [birthDate] to the current Date
  ///it takes into account the months and days for the calculation
  ///if [birthYear] is null this value is also null
  int? get age => birthDateTime?.calculateAge();
}

@freezed
abstract class UserProfileStats with _$UserProfileStats {
  const factory UserProfileStats({
    int? wins,
    int? losses,
    int? ties,
    int? drops,
    int? matches,
    int? goalsScored,
    int? goalsConceded,
  }) = _UserProfileStats;

  const UserProfileStats._();

  factory UserProfileStats.fromJson(Map<String, dynamic> json) => _$UserProfileStatsFromJson(json);

  /// The percentage between wins/ (wins+losses).
  /// Its used wins+losses instead of matches because sometimes the amounts do not match
  /// The result is nullable although both attributes are required they also could be zero
  /// Thus the [winRatio] being NaN
  double? get winRatio {
    if ((wins == null || losses == null) || (wins == 0 && losses == 0)) {
      return null;
    } else {
      return wins! / (wins! + losses!);
    }
  }

  int get totalMatches {
    final total = (wins ?? 0) + (losses ?? 0) + (ties ?? 0);
    print('total $total');
    return total;
  }

  double? get winPercentage => winRatio == null ? null : winRatio! * 100;
}
