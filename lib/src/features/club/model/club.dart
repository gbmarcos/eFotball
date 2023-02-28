import 'package:fifa/src/common/data/converters.dart';
import 'package:fifa/src/common/domain/org/org.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'club.freezed.dart';
part 'club.g.dart';

List<Club> clubsFromJson(List<dynamic> str) =>
    List<Club>.from(str.map<Club>((dynamic x) => Club.fromJson(x as Map<String, dynamic>)));

/// This model is also called OrgRef in the domain
@freezed
class Club with _$Club {
  @Implements<OrgRef>()
  const factory Club({
    required int id,
    required String name,
    String? logo,
    String? background,
    String? bannerUrl,
    required String slug,
    required int flags,
    @TimestampConverter() required DateTime inserted,
  }) = _Club;

  factory Club.fromJson(Map<String, dynamic> json) => _$ClubFromJson(json);
}

extension ClubFlagsX on Club {
  /// Check if a club/org has a given flag[ClubFlags]
  /// ```
  /// hasFlag(ClubFlags.forumEnabled);
  /// ```
  bool hasFlag(int requestedFlag) {
    return flags & requestedFlag != 0;
  }
}

class ClubFlags {
  const ClubFlags._();

  static const featured = 1 << 0;
  static const deleted = 1 << 1;
  static const autoAccept = 1 << 2;
  static const forumEnabled = 1 << 3;
  static const allowNonMembersToCreateForumThreads = 1 << 4;
  static const allowNonMembersToReplyToForumThreads = 1 << 5;
  static const publicMemberList = 1 << 6;
  static const overrideBanner = 1 << 7;
  static const allowAdminsToFeatureTournamentsFrontPage = 1 << 8;
  static const visible = 1 << 9;
  static const rankFifaPS = 1 << 10;
  static const rankFifaXbox = 1 << 11;
  static const rankPesPS = 1 << 12;
  static const rankPesXbox = 1 << 13;
}
