import 'dart:io';

import 'package:fifa/src/common/environment.dart';
import 'package:fifa/src/notifications/realtime_notifications_service/mock_realtime_client.dart';
import 'package:fifa/src/notifications/realtime_notifications_service/realtime_notifications_service.dart';
import 'package:flutter/foundation.dart';

/// Returns an instance of PushNotificationService on supported platforms and a Mock in unsupported ones.
/// Necessary not to crash the app on service initialization on unsupported platforms
RealTimeClient platformDependantRealtimeNotifications({
  required Environment environment,
  required int id,
  required String token,
}) {
  if (true || kTestMode || kIsWeb || Platform.isWindows || Platform.isLinux) {
    return MockRealtimeClient();
  } else {
    return PusherRealtimeNotifications(environment: environment, userId: id, token: token);
  }
}
