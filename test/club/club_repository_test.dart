import 'dart:convert';

import 'package:fifa/src/common/domain/user/user.dart';
import 'package:fifa/src/features/club/model/club.dart';
import 'package:fifa/src/features/club/model/org_featured_player.dart';
import 'package:fifa/src/features/club/model/ranking.dart';
import 'package:fifa/src/features/club/model/social_media.dart';
import 'package:fifa/src/features/club/model/user_ranked.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fixtures.json.dart';

void main() {
  group('Check Club data layer', () {
    test('Clubs  are correctly deserialized', () async {
      final serializedClubs = mockClubList();
      expect(serializedClubs, isA<List<Club>>());
      expect(serializedClubs.length, 4);
    });
    test('Social media models are correctly deserialized', () async {
      final serializedSocialMedia = mockSocialMediaList();
      expect(serializedSocialMedia, isA<List<SocialMedia>>());
      expect(serializedSocialMedia.length, 10);
    });
    test('Ranking and UserRanked models  are correctly deserialized', () async {
      final serializeRanking = mockRanking();
      expect(serializeRanking, isA<Ranking>());
      expect(serializeRanking.ranking, isA<List<List<UserRanked>?>>());
      expect(serializeRanking.ranking.length, 2);
      expect(serializeRanking.ranking[0], null);
      expect(serializeRanking.getRankingForConsole(Console.xbox), null);
      expect(serializeRanking.ranking[1]?.length, 7);
      expect(serializeRanking.getRankingForConsole(Console.playstation)?.length, 7);
    });
    test('OrgFeaturedPlayers and UserStats models are correctly deserialized', () async {
      final serializedOrgFeaturedPlayers = mockOrgFeaturedPlayers();
      expect(serializedOrgFeaturedPlayers, isA<List<OrgFeaturedPlayer>>());
      expect(serializedOrgFeaturedPlayers.length, 3);
    });
  });
}

List<Club> mockClubList() => clubsFromJson(jsonDecode(mockClubsResponse) as List<dynamic>);

List<SocialMedia> mockSocialMediaList() => socialMediaFromJson(jsonDecode(mockSocialMedia) as List<dynamic>);

Ranking mockRanking() => Ranking.fromJson(jsonDecode(mockOrgRankingFifa) as List<dynamic>);

List<OrgFeaturedPlayer> mockOrgFeaturedPlayers() =>
    orgFeaturedPlayerFromJson(jsonDecode(mockOrgFeaturedPlayer) as List<dynamic>);
