import 'dart:io';
import 'package:fifa/src/app/dependency_injection.dart';
import 'package:fifa/src/app/keys.dart';
import 'package:fifa/src/common/environment.dart';
import 'package:fifa/src/features/profile/twitch/twitch_connection_settings.dart';
import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

/// Wrapper to a webView in which the user will Authenticate.
/// This widget is intended to be used as a dialog, if successful it will return a twitch auth code or null otherwise
/// Sample usage:
/// ```
///    final code = await showDialog<String?>(
///       context: context,
///       builder: (_) => TwitchModalConnect(connectionSettings: getIt<Environment>().twitchConnectionSettings),
///     );
/// ```
class TwitchModalConnect extends StatefulWidget {
  final TwitchConnectionSettings connectionSettings;
  const TwitchModalConnect({Key? key, required this.connectionSettings}) : super(key: key);

  @override
  _TwitchModalConnectState createState() => _TwitchModalConnectState();
}

class _TwitchModalConnectState extends State<TwitchModalConnect> {
  final CookieManager cookieManager = CookieManager();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    cookieManager.clearCookies();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: Keys.twitchWebView,
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      content: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          color: Theme.of(context).dialogBackgroundColor,
          width: double.infinity,
          height: MediaQuery.of(context).size.height * .8,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    key: Keys.twitchWebViewClose,
                    icon: const Icon(Icons.close_rounded),
                    onPressed: () {
                      Navigator.of(context).pop(null);
                    },
                  )
                ],
              ),
              Expanded(
                child: WebView(
                    initialUrl: widget.connectionSettings.twitchOauthUrl,
                    navigationDelegate: (NavigationRequest request) {
                      final env = getIt<Environment>();
                      if (request.url.startsWith(env.siteUrl)) {
                        print('>>>>>blocking navigation to $request}');
                        final code = request.url.split('/').last;
                        if (code.length == 30) {
                          Navigator.of(context).pop(code);
                        } else {
                          Navigator.of(context).pop(false);
                        }
                        return NavigationDecision.prevent;
                      } else if (request.url.startsWith('https://www.twitch') ||
                          request.url.startsWith('https://id.twitch') ||
                          request.url.startsWith(env.apiUrl)) {
                        print('>>>>>allowing navigation to $request');
                        return NavigationDecision.navigate;
                      }
                      print('>>>>>not allowing redirection for ${request}');
                      return NavigationDecision.prevent;
                    },
                    javascriptMode: JavascriptMode.unrestricted),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
