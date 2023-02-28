import 'package:fifa/src/common/exceptions.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static final Preferences _instance = Preferences._internal();

  factory Preferences() {
    return _instance;
  }

  Preferences._internal();

  late SharedPreferences _prefs;

  Future<void> initPrefs() async {
    try {
      _prefs = await SharedPreferences.getInstance();
    } catch (e) {
      await Sentry.captureException(SharedPreferencesException(message: 'Error loading sharedPreferences $e'));
    }
  }

  Future<void> resetSettings() async {
    await _prefs.clear();
  }

  String? get username {
    return _prefs.getString('username');
  }

  set username(String? value) {
    if (value == null) {
      _prefs.remove('username');
    } else {
      _prefs.setString('username', value);
    }
  }

  String? get locale {
    return _prefs.getString('locale');
  }

  set locale(String? value) {
    if (value == null) {
      _prefs.remove('locale');
    } else {
      _prefs.setString('locale', value);
    }
  }

  List<String>? get subscribedTopics {
    return _prefs.getStringList('push_notification_subscribed_topics');
  }

  ///Will add the [topic] to the subscribed topics list without deleting the previous
  Future<bool> addSubscribedTopic(String topic) {
    final previousTopics = _prefs.getStringList('push_notification_subscribed_topics');
//remove duplicates
    return _prefs.setStringList('push_notification_subscribed_topics', {...?previousTopics, topic}.toList());
  }

  set subscribedTopics(List<String>? subscribedTopics) {
    if (subscribedTopics == null) {
      _prefs.remove('push_notification_subscribed_topics');
    } else {
      _prefs.setStringList('userpush_notification_subscribed_topicsname', subscribedTopics);
    }
  }
}
