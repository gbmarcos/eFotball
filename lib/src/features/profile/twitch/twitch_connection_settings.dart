/// Configuration for integrating with twitch . See https://dev.twitch.tv/docs/authentication/getting-tokens-oauth
/// The [twitchClientId] is owned by the backend.
class TwitchConnectionSettings {
  final String twitchClientId;
  final String twitchRedirectUri;
  final String responseType;
  final String scope;
  const TwitchConnectionSettings({
    required this.twitchClientId,
    required this.twitchRedirectUri,
    this.responseType = 'code',
    this.scope = 'user:read:email',
  });
  String get twitchOauthUrl => 'https://id.twitch.tv/oauth2/authorize'
      '?response_type=$responseType'
      '&client_id=$twitchClientId'
      '&redirect_uri=$twitchRedirectUri'
      '&scope=$scope';
  @override
  String toString() {
    return 'TwitchConnectionSettings{twitchClientId: $twitchClientId, twitchRedirectUri: $twitchRedirectUri}';
  }
}
