import 'dart:developer';

import 'package:fifa/src/app/dependency_injection.dart';
import 'package:fifa/src/authentication/authentication.dart';
import 'package:fifa/src/common/environment.dart';
import 'package:fifa/src/common/services/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

///  Topics to which the user can be subscribed to
class Topics {
  static String privateUser(String userId) => 'private-user-$userId';
}

class FallBackPushNotificationService implements PushNotificationService {
  @override
  Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

  @override
  void _firebaseMessagingForegroundHandler(RemoteMessage message) {}

  @override
  Future<void> _firebaseMessagingOpenedInForegroundHandler(RemoteMessage message) async {}

  @override
  Environment get environment => Environment.staging;

  @override
  FirebaseMessaging get firebaseMessaging => throw UnimplementedError();

  @override
  Future<void> pendingPushNotifications() async {}

  @override
  Preferences get preferences => throw UnimplementedError();

  @override
  Future<void> registerListeners() async {}

  @override
  Future<void> requestForegroundNotificationPermission() async {}

  @override
  Future<void> requestNotificationPermission() async {}

  @override
  void subscribeToTopic(String topic) {}

  @override
  String get topicPrefix => '';

  @override
  void unsubscribeFromTopic(String topic) {}

  @override
  void unsubscribeFromTopics() {}
}

class PushNotificationService {
  final FirebaseMessaging firebaseMessaging;
  final Preferences preferences;
  final Environment environment;

  PushNotificationService({required this.environment, required this.firebaseMessaging, required this.preferences}) {
    registerListeners();
  }

  /// [dev|prod|staging]-[en|sv]-$topic
  String get topicPrefix => '${environment.serverSlug}-${preferences.locale ?? 'en'}-';

  /// Initializes [Firebase] and registers listeners.
  Future<void> registerListeners() async {
    try {
      FirebaseMessaging.onMessage.listen(_firebaseMessagingForegroundHandler);
      FirebaseMessaging.onMessageOpenedApp.listen(_firebaseMessagingOpenedInForegroundHandler);
      FirebaseMessaging.instance.getToken().then((token) {
       if(kDebugMode) log('PushNotificationService: FCM token: $token');
      });
      // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    } catch (e,st) {
      log('Failed to initialize firebase: $e', error: e, stackTrace: st);
    }
  }

  void subscribeToTopic(String topic) {
    final topicName = topicPrefix + topic;
    firebaseMessaging.subscribeToTopic(topicName);
    preferences.addSubscribedTopic(topicName);
    log('Subscribed to push notification topic: $topicName');
  }

  void unsubscribeFromTopic(String topic) {
    final topicName = topicPrefix + topic;
    firebaseMessaging.subscribeToTopic(topicName);
    preferences.addSubscribedTopic(topicName);
    log('Unsubscribed to push notification topic: $topicName');
  }

  ///Unsubscribes from all topics
  void unsubscribeFromTopics() {
    final currentSubscriptions = preferences.subscribedTopics;
    if (currentSubscriptions != null) {
      log('Removing subscriptions for $currentSubscriptions');
      for (final topic in currentSubscriptions) {
        firebaseMessaging.unsubscribeFromTopic(topic);
      }
      //remove subscriptions
      preferences.subscribedTopics = null;
    }
  }

  /// Runs when a message is received and the app is running but in the background.
  /// Note that this runs in its own isolate
  Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    log('Handling a background message: ${message.messageId} ${message.data} ${message.notification?.title}');
  }

  /// Runs when the app was terminated and was opened via a message
  Future<void> pendingPushNotifications() async {
    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      log('<<<*>>> App started from $initialMessage ${initialMessage.notification} ${initialMessage.data} ${initialMessage.notification?.title} ${initialMessage.notification?.body}');
      _firebaseMessagingOpenedInForegroundHandler(initialMessage);
    }
  }

  ///Runs when the app is opened and in foreground
  void _firebaseMessagingForegroundHandler(RemoteMessage message) {
    log('Got a message whilst in the foreground!');
    log('Message data: ${message.data}');

    if (message.notification != null) {
      log('Message also contained a notification: ${message.notification}');
    }
  }

  /// Runs when the app is in background but opened and user taps on the notification
  Future<void> _firebaseMessagingOpenedInForegroundHandler(RemoteMessage message) async {
    log('Got a message in background that opened the app');
    log('Message data: ${message.data}');
    if (message.notification != null) {
      log('Message also contained a notification: ${message.notification}');
    }
  }

  ///On Apple based platforms, once a permission request has been handled by the user (authorized or denied),
  ///it is not possible to re-request permission. The user must instead update permission via the device Settings UI:
  Future<void> requestNotificationPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    final settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');
//Notifications cannot be shown to users if the user has not "granted" your application permission.
//The overall notification permission of a single application can be either be
//"not determined", "granted" or "declined". Upon installing a new application, the default status is "not determined".
    switch (settings.authorizationStatus) {
      case AuthorizationStatus.authorized:
        log('User granted permission');
        getIt<PushNotificationService>()
            .subscribeToTopic(Topics.privateUser('${getIt<AuthenticationBloc>().state.user!.id}'));
        break;
      case AuthorizationStatus.denied:
      case AuthorizationStatus.notDetermined:
      case AuthorizationStatus.provisional:
        break;
    }
  }

  ///Foreground notifications (also known as "heads up") are those which display for a brief period of time
  ///above existing applications, and should be used for important events.
  Future<void> requestForegroundNotificationPermission() async {
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );
  }
}
