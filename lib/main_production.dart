import 'dart:async';

import 'package:fifa/r.dart';
import 'package:fifa/src/app/app.dart';
import 'package:fifa/src/app/app_bloc_observer.dart';
import 'package:fifa/src/app/dependency_injection.dart';
import 'package:fifa/src/common/environment.dart';
import 'package:fifa/src/push_notification/push_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routemaster/routemaster.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  const environment = Environment.production;
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebaseApp();

  Routemaster.setPathUrlStrategy();

  Bloc.observer = AppBlocObserver();
  await registerGlobalDependencies(environment: environment);

  // Force portrait mode
  await SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  // Use dart zone to log errors that occur outside runApp(replace with Crashlytics if you want)
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(statusBarColor: R.colors.menuBarBackground));

  await SentryFlutter.init(
    (options) {
      options
        ..dsn = environment.sentryUrl
        ..reportSilentFlutterErrors = true;
    },
    appRunner: () => runApp(const Dependencies(App(), environment: environment)),
  );
}
