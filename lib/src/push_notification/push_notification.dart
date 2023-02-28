import 'dart:developer';
import 'dart:io';

import 'package:fifa/src/common/environment.dart';
import 'package:fifa/src/common/services/shared_preferences.dart';
import 'package:fifa/src/push_notification/push_notifications_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

// ignore: always_use_package_imports
import 'firebase_options.dart';

export 'push_notification_data.dart';
export 'push_notifications_service.dart';
//Barrel file which exposes the service dependencies, entry points and API

// As firebase is platform dependant both the initialization of the FireBaseApp and instantiation of the class used to
// interface with the app can fail. It currently works for all platforms but linux and windows.

final _isPlatformUnSupported = kTestMode || (!kIsWeb && (Platform.isWindows || Platform.isLinux));

/// Initializes the Firebase app if the platform is supported.
/// Necessary not to crash the app on startup on unsupported platforms
///
///
Future<void> initializeFirebaseApp() async {
  if (!_isPlatformUnSupported) {
    try {
      await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    } catch (e) {
      log("exception initalizing firebase app:", error: e);
    }
  }
}

/// Returns an instance of PushNotificationService on supported platforms and a Mock in unsupported ones.
/// Necessary not to crash the app on service initialization on unsupported platforms
PushNotificationService platformDependantPushNotificationService({
  required Environment environment,
  FirebaseMessaging? firebaseMessaging,
  required Preferences preferences,
}) {
  if (_isPlatformUnSupported) {
    return FallBackPushNotificationService();
  } else {
    return PushNotificationService(
      firebaseMessaging: firebaseMessaging ?? FirebaseMessaging.instance,
      preferences: preferences,
      environment: environment,
    );
  }
}
