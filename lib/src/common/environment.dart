import 'package:fifa/src/features/profile/twitch/twitch_connection_settings.dart';

/// Variable used for deciding if the app is running using fake data or not.
/// This is used for testing purposes. If this is set to true, the app will use fake data.
/// If this is set to false, the app will use real data.
/// This is set to false by default.
/// You could set this to true by executing the following command in the terminal:
/// Note that dart-define MUST be at last in the command
///
/// ```
/// flutter run --dart-define=testing=true
/// ```
bool kTestMode = const bool.fromEnvironment('test');

class Environment {
  final String apiUrl;
  final String siteUrl;
  final String assetsUrl;
  final String pusherKey;
  final String sentryUrl;
  final String serverSlug;
  final TwitchConnectionSettings twitchConnectionSettings;

  const Environment({
    required this.serverSlug,
    required this.siteUrl,
    required this.apiUrl,
    required this.assetsUrl,
    required this.pusherKey,
    required this.sentryUrl,
    required this.twitchConnectionSettings,
  });
  bool get isTestMode => kTestMode;
  static const production = Environment(
    siteUrl: 'https://www.efotboll.se',
    apiUrl: 'https://api.efotboll.se',
    assetsUrl: 'https://static.efotboll.se',
    pusherKey: '4eb23fcb3bf82835139b',
    sentryUrl: 'https://d18a1b47fbfd428a8e06c8f4838999da@o622038.ingest.sentry.io/5944236',
    serverSlug: 'prod',
    twitchConnectionSettings: TwitchConnectionSettings(
      twitchClientId: 'ozcgm7pbe1d44oa7abytyeua5qk5ce',
      twitchRedirectUri: 'https://api.efotboll.se/twitch/redirect',
    ),
  );

  static const staging = Environment(
    siteUrl: 'https://fifa-staging.oneplace.club',
    apiUrl: 'https://fifa-staging-api.oneplace.club',
    assetsUrl: 'https://fifa-staging-static.oneplace.club',
    pusherKey: 'ab6709bf23ae5538c27d',
    sentryUrl: '',
    twitchConnectionSettings: TwitchConnectionSettings(
      twitchClientId: 'r32neg0j3n1ithn04bql8a74gcileiw',
      twitchRedirectUri: 'https://fifa-staging-api.oneplace.club/twitch/redirect',
    ),
    serverSlug: 'staging',
  );
}
