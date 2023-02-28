import 'dart:convert';


import 'package:fifa/src/common/domain/match/match.dart';
import 'package:fifa/src/common/domain/user/user.dart';
import 'package:fifa/src/notifications/data/notification.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fixtures.json.dart';

void main() {
  setUp(() {});
  group('User Model', () {
    test('User Model serialization', () {
      final serializedUser = User.fromJson(jsonDecode(mockUserResponse) as Map<String, dynamic>);
      expect(serializedUser, isA<User>());
      expect(serializedUser.token, 'wkcgooxG-PGm', reason: 'Correctly implements and parses [UserAuthenticated]');
      expect(serializedUser.username, 'fabian', reason: 'Correctly implements and parses [UserBasicInfo]');
      expect(serializedUser.birthYear, 1995, reason: 'Correctly implements and parses [UserExtended]');
    });

    test('User Notifications are parsed correctly', () {
      final serializedUser = User.fromJson(jsonDecode(userWithNotifications) as Map<String, dynamic>);
      final notifications = notificationsFromJson(serializedUser.notifications! as List<Map<String, dynamic>>);
      expect(notifications.length, 20);
    });
    test('User Active matches are parsed correctly', () {
      final serializedUser = User.fromJson(jsonDecode(userWithNotifications) as Map<String, dynamic>);
      expect(serializedUser.activeMatches?.length, 1);
      expect(serializedUser.activeMatches?[0], isA<ActiveMatch>());
    });
  });
}

List<Notification> notificationsFromJson(List<dynamic> str) =>
    List<Notification>.from(str.map<Notification>((dynamic x) => Notification.fromJson(x as Map<String, dynamic>)));
