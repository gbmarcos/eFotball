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

import 'src/app/app.dart';
import 'src/app/dependency_injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebaseApp();

  Routemaster.setPathUrlStrategy();

  Bloc.observer = AppBlocObserver();

  await registerGlobalDependencies(environment: Environment.staging);
  // FlutterError.onError = (details) {
  //   log(details.exceptionAsString(), stackTrace: details.stack);r
  // };

  // Force portrait mode
  await SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(statusBarColor: R.colors.menuBarBackground));

  // Use dart zone to log errors that occur outside runApp(replace with Crashlytics if you want)
  runApp(Dependencies(const App(), environment: getIt<Environment>()));
}
