import 'dart:async';
import 'dart:developer';

import 'package:fifa/r.dart';
import 'package:fifa/resources/resources.dart';
import 'package:fifa/src/app/dependency_injection.dart';
import 'package:fifa/src/app/routes/routes.dart';
import 'package:fifa/src/authentication/authentication.dart';
import 'package:fifa/src/authentication/authentication_repository.dart';
import 'package:fifa/src/authentication/bloc/authentication_bloc.dart';
import 'package:fifa/src/common/scroll_configuration.dart';
import 'package:fifa/src/features/home/home_page_cubit.dart';
import 'package:fifa/src/features/match/active_match_bloc/active_match_bloc.dart';
import 'package:fifa/src/features/play_match/match/routes.dart';
import 'package:fifa/src/features/play_match/match_bloc/match_lobby_bloc.dart';
import 'package:fifa/src/features/profile/settings_cubit.dart';
import 'package:fifa/src/common/environment.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/common/services/dialog_cubit/dialog_cubit.dart';
import 'package:fifa/src/notifications/notification_listener.dart';
import 'package:fifa/src/notifications/realtime_notifications_service/realtime_notifications_service.dart';
import 'package:fifa/src/push_notification/push_notifications_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';
import 'package:uni_links/uni_links.dart';

class App extends StatefulWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final PageStorageBucket _bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt<AuthenticationBloc>()),
        BlocProvider.value(value: getIt<SettingsCubit>()),
      ],
      child: BlocBuilder<SettingsCubit, SettingsState>(
        bloc: getIt<SettingsCubit>(),
        builder: (BuildContext context, state) => PageStorage(
          bucket: _bucket,
          key: const PageStorageKey('App'),
          child: AppView(
            locale: state.localeFromLanguageCode,
          ),
        ),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  final Locale? locale;

  const AppView({Key? key, required this.locale}) : super(key: key);

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  StreamSubscription? _sub;
  bool processingUri = false;

  @override
  void initState() {
    super.initState();
    _handleIncomingUri();
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: RoutemasterDelegate.builder(
        navigatorBuilder: (context, stack) {
          //todo(marcos) clean the stack when '/home' path is pushed
          return BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              //call "setState" to change the route map in "routesBuilder"
              //in this way it can swap between login page, home page and splash page
              setState(() {});

              if (state.status == AuthenticationStatus.authenticated) {
                log('pushing "auth" scope');
                registerAuthenticatedDependenciesScope();
                getIt<PushNotificationService>().subscribeToTopic(Topics.privateUser('${state.user!.id}'));
              } else {
                log('popping ${getIt.currentScopeName} scope');
                getIt.popScopesTill('auth');

                getIt<PushNotificationService>().unsubscribeFromTopics();
              }
              if (state.status == AuthenticationStatus.unauthenticated) {
                getIt<PushNotificationService>().unsubscribeFromTopics();
              }
            },
            listenWhen: (old, _new) {
              return old.status != _new.status;
            },
            child: ScrollConfiguration(
              behavior: const AppScrollBehavior(),
              child: HeroControllerScope(
                controller: MaterialApp.createMaterialHeroController(),
                child: PageStackNavigator.builder(
                  builder: (appPages) => appPages.map(
                    (currentPage) {
                      //If we assume that each Material Page related to
                      // the flow of matches has the path as a key,
                      // we can determine among all the pages which will
                      // have the MatchFlowPage included.

                      final pageKey = currentPage.key;

                      return (pageKey is ValueKey<String> && pageKey.value.startsWith(R.routeNames.match))
                          ? MaterialPage<void>(
                              child: MatchFlowPage(
                                key: const ValueKey<String>('MatchFlowPage'),
                                child: (currentPage as MaterialPage).child,
                              ),
                            )
                          : currentPage;
                    },
                  ),
                  stack: stack,
                ),
              ),
            ),
          );
        },
        routesBuilder: (context) {
          final authStatus = context.read<AuthenticationBloc>().state.status;
          //use different RouteMaps for each authentication status
          switch (authStatus) {
            case AuthenticationStatus.unknown:
              return unknownAuthStatusRoutes;
            case AuthenticationStatus.authenticated:
              return authenticatedStatusRoutes;
            case AuthenticationStatus.unauthenticated:
              return unauthenticatedStatusRoutes;
            case AuthenticationStatus.resettingPass:
              return resettingPassStatusRoutes;
          }
        },
        observers: [
          if (kDebugMode) AppRoutesObserver(),
          if (kReleaseMode) SentryRouteMasterObserver(),
        ],
      ),
      theme: R.theme.light,
      darkTheme: R.theme.dark,
      routeInformationParser: const RoutemasterParser(),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      locale: widget.locale,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }

  void _handleIncomingUri() {
    if (!Device.isDesktopDevice) {
      // It will handle app links while the app is already started - be it in
      // the foreground or in the background.
      _sub = uriLinkStream.listen(
        (Uri? uri) async {
          if (mounted) {
            await context.authenticationBloc.goToResetPass(uri?.path);
          }
        },
      );
    }
  }
}

/// Widget that injects the different dependencies needed for inheritedWidgets or other packages to work
class Dependencies extends StatelessWidget {
  final Environment environment;
  final Widget wrapped;

  const Dependencies(this.wrapped, {Key? key, required this.environment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //precache images
    precacheAllImages(context);

    return ListTileTheme(selectedColor: R.colors.orange, selectedTileColor: R.colors.menuBarBackground, child: wrapped);
  }

  void precacheAllImages(BuildContext context) {
    precacheImage(const AssetImage(Images.appLogo), context);
  }
}

class AuthenticatedDependencies extends StatelessWidget {
  final Widget child;

  const AuthenticatedDependencies({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<RealTimeClient>.value(value: getIt()),
        Provider<HomePageCubit>.value(value: getIt()),
        Provider<DialogCubit>.value(value: getIt()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<MatchLobbyBloc>.value(value: getIt()),
          BlocProvider<ActiveMatchBloc>.value(value: getIt())
        ],
        child: NotificationListenerWidget(child: child),
      ),
    );
  }
}
