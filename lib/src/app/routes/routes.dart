import 'dart:developer';
import 'dart:math' hide log;

import 'package:fifa/r.dart';
import 'package:fifa/src/app/keys.dart';
import 'package:fifa/src/common/get_it_scoped_widget.dart';
import 'package:fifa/src/common/widgets/components/home_tab_view.dart';
import 'package:fifa/src/common/widgets/pages/splash_page.dart';
import 'package:fifa/src/features/club/club_page.dart';
import 'package:fifa/src/features/club/club_players_detail.dart';
import 'package:fifa/src/features/home/home_page.dart';
import 'package:fifa/src/features/login/forgot_password/check_your_inbox_page.dart';
import 'package:fifa/src/features/login/forgot_password/forgot_password_page.dart';
import 'package:fifa/src/features/login/forgot_password/reset_your_pass_page.dart';
import 'package:fifa/src/features/login/login/login_page.dart';
import 'package:fifa/src/features/login/signup/choose_a_club_page.dart';
import 'package:fifa/src/features/login/signup/signup_page.dart';
import 'package:fifa/src/features/match/match_details.dart';
import 'package:fifa/src/features/news/news_archive.dart';
import 'package:fifa/src/features/news/news_detail/news_detail_page.dart';
import 'package:fifa/src/features/org/org_page.dart';
import 'package:fifa/src/features/play_match/match/routes.dart';
import 'package:fifa/src/features/profile/profile_page.dart';
import 'package:fifa/src/features/profile/profile_settings_page.dart';
import 'package:fifa/src/features/streams/stream_page.dart';
import 'package:fifa/src/features/tournaments/tournament_details/collection/tournament_collection_page.dart';
import 'package:fifa/src/features/tournaments/tournament_details/tournament_page.dart';
import 'package:fifa/src/features/tournaments/tournament_list_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:routemaster/routemaster.dart';
// ignore: implementation_imports
import 'package:routemaster/src/trie_router/trie_router.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

final authenticatedStatusRoutes = AdvancedRouteMap(
  onUnknownRoute: kDebugMode ? null : (path) => Redirect(R.routeNames.initial),
  routes: {
    R.routeNames.initial: (_) => TabPage(
          child: const HomeTabViewPage(),
          paths: [
            R.routeNames.homeSection,
            R.routeNames.tournamentsSection,
            R.routeNames.streamsSection,
            R.routeNames.clubsSection,
            R.routeNames.profileSection,
          ],
        ),
    R.routeNames.homeSection: (route) => const MaterialPage<void>(
          child: HomePage(),
        ),
    R.routeNames.tournamentsSection: (route) => const MaterialPage<void>(
          child: TournamentListPage(),
        ),
    R.routeNames.streamsSection: (route) => const MaterialPage<void>(
          child: StreamListPage(),
        ),
    R.routeNames.clubsSection: (route) => const MaterialPage<void>(
          child: OrgPage(),
        ),
    R.routeNames.profileSection: (route) {
      final id = route.pathParameters['id'] == null ? null : int.tryParse(route.pathParameters['id']!);

      return MaterialPage<void>(
        key: ValueKey('profilePage-$id'),
        child: ProfilePage(
          userId: id,
          key: ValueKey('profilePage-$id'),
        ),
      );
    },
    R.routeNames.tournamentDetails: (route) => TransitionPage<void>(
          pushTransition: PageTransition.zoom,
          popTransition: PageTransition.zoom,
          child: ScopedDependency(
            scopeName: route.path,
            child: TournamentPage(
              tournamentId: int.parse(route.pathParameters['id']!),
            ),
          ),
        ),
    R.routeNames.tournamentCollectionDetails: (route) => TransitionPage<void>(
          pushTransition: PageTransition.zoom,
          popTransition: PageTransition.zoom,
          child: ScopedDependency(
            scopeName: route.path,
            child: TournamentCollectionPage(tournamentId: int.parse(route.pathParameters['id']!)),
          ),
        ),
    R.routeNames.clubDetails: (route) => TransitionPage<void>(
          pushTransition: PageTransition.zoom,
          popTransition: PageTransition.zoom,
          child: ScopedDependency(
            scopeName: route.path,
            child: ClubPage(
              id: int.parse(route.pathParameters['id']!),
            ),
          ),
        ),
    R.routeNames.profileSettings: (route) => MaterialPage<void>(
          child: ScopedDependency(scopeName: route.path, child: const ProfileSettingsPage()),
        ),
    R.routeNames.newsArchive: (route) => TransitionPage<void>(
          pushTransition: PageTransition.zoom,
          popTransition: PageTransition.zoom,
          child: ScopedDependency(
            scopeName: route.path,
            child: const NewsArchivePage(),
          ),
        ),
    R.routeNames.playersDetails: (route) => TransitionPage<void>(
          pushTransition: PageTransition.zoom,
          popTransition: PageTransition.zoom,
          child: ScopedDependency(
            scopeName: route.path,
            child: PlayersDetailView(
              title: route.queryParameters['title'] ?? '-',
            ),
          ),
        ),
    R.routeNames.matchDetails: (route) => TransitionPage<void>(
          pushTransition: PageTransition.zoom,
          popTransition: PageTransition.zoom,
          child: ScopedDependency(
            scopeName: route.path,
            child: MatchDetails(
              gamesCount: route.pathParameters['gamesCount'] == null
                  ? 0
                  : int.tryParse(route.pathParameters['gamesCount']!) ?? 0,
              team1Score: route.pathParameters['team1Score'] == null
                  ? 0
                  : int.tryParse(route.pathParameters['team1Score']!) ?? 0,
              team2Score: route.pathParameters['team2Score'] == null
                  ? 0
                  : int.tryParse(route.pathParameters['team2Score']!) ?? 0,
            ),
          ),
        ),
    R.routeNames.newsDetails: (route) => TransitionPage<void>(
          pushTransition: PageTransition.zoom,
          popTransition: PageTransition.zoom,
          child: ScopedDependency(
            scopeName: route.path,
            child: NewsDetailPage(
              id: int.parse(route.pathParameters['id']!),
            ),
          ),
        ),
    ...matchLobbyRoutes
  },
);

final unauthenticatedStatusRoutes = RouteMap(
  onUnknownRoute: (path) => Redirect(R.routeNames.initial),
  routes: {
    R.routeNames.initial: (_) => const MaterialPage<void>(
          child: LoginPage(),
          restorationId: 'login',
          key: Keys.loginPage,
        ),
    R.routeNames.forgotPassPage: (_) => const MaterialPage<void>(
          child: ForgotPasswordPage(),
          restorationId: 'forgotPass',
          key: Keys.forgotPassPage,
        ),
    R.routeNames.checkYourInboxPage: (_) => const MaterialPage<void>(
          child: CheckYourInboxPage(),
          restorationId: 'checkYourInbox',
          key: Keys.checkYourInboxPage,
        ),
    R.routeNames.signUpPage: (_) => const MaterialPage<void>(
          child: SignUpPage(),
          restorationId: 'signUpPage',
          key: Keys.signUpPage,
        ),
    R.routeNames.chooseAClubPage: (_) => const MaterialPage<void>(
          child: ChooseAClubPage(),
          restorationId: 'chooseAClubPage',
          key: Keys.chooseAClubPage,
        ),
  },
);

final resettingPassStatusRoutes = RouteMap(
  onUnknownRoute: (path) => Redirect(R.routeNames.initial),
  routes: {
    R.routeNames.initial: (_) => const MaterialPage<void>(
          child: ResetYourPasswordPage(),
          restorationId: 'resetYourPass',
          key: Keys.resetYourPassPage,
        ),
  },
);

final unknownAuthStatusRoutes = RouteMap(
  onUnknownRoute: (path) => Redirect(R.routeNames.initial),
  routes: {
    R.routeNames.initial: (_) => const MaterialPage<void>(
          child: SplashPage(),
          key: Keys.splashPage,
          restorationId: 'splash',
        ),
  },
);

class AppRoutesObserver extends RoutemasterObserver {
  final VoidCallback? onRouteChange;

  AppRoutesObserver({this.onRouteChange});

  // Routemaster Observer extends NavigatorObserver and
  // receives all nested Navigator events
  @override
  void didPop(Route route, Route? previousRoute) {
    log('didPop($route,previous= $previousRoute)');
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    log('didRemoveRoute($route,page= $previousRoute)');
  }

  // Routemaster-specific observer method
  @override
  void didChangeRoute(RouteData routeData, Page page) {
    log('didChangeRoute($routeData,page= $page)');
    onRouteChange?.call();
  }
}

class SentryRouteMasterObserver extends RoutemasterObserver {
  SentryRouteMasterObserver({Hub? hub}) : hub = hub ?? HubAdapter();

  final Hub hub;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _addBreadcrumb(
      type: 'didPush',
      from: previousRoute?.settings,
      to: route.settings,
    );
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);

    _addBreadcrumb(
      type: 'didReplace',
      from: oldRoute?.settings,
      to: newRoute?.settings,
    );
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);

    _addBreadcrumb(
      type: 'didPop',
      from: route.settings,
      to: previousRoute?.settings,
    );
  }

  void _addBreadcrumb({
    required String type,
    RouteSettings? from,
    RouteSettings? to,
  }) {
    hub.addBreadcrumb(
      RouteObserverBreadcrumb(
        navigationType: type,
        from: from,
        to: to,
      ),
    );
  }
}

final _pathContext = path.Context(style: path.Style.url);

class AdvancedRouteMap extends RouteMap {
  final _relativeRoutesRouter = TrieRouter();
  final int _maxRelativeSegments;

  AdvancedRouteMap({required Map<String, PageBuilder> routes, UnknownRouteCallback? onUnknownRoute})
      : _maxRelativeSegments = _maxSegmentsInRelativePath(routes),
        super(
          routes: Map.fromEntries(routes.entries.where((e) => e.key.startsWith('/'))),
          onUnknownRoute: onUnknownRoute,
        ) {
    _relativeRoutesRouter.addAll(Map.fromEntries(routes.entries.where((e) => !e.key.startsWith('/'))));
  }

  @override
  List<RouterResult>? getAll(String path) {
    assert(path.startsWith('/'), '');
    var pathResult = super.getAll(path);
    if (pathResult != null) {
      return pathResult;
    }
    if (_maxRelativeSegments <= 0) {
      return null;
    }

    // first, find the longest absolute path prefix
    final segments = _pathContext.split(path);
    var i = 0;
    for (i = segments.length - 1; i > 0; i--) {
      final candidate = _pathContext.joinAll(segments.getRange(0, i));
      pathResult = super.getAll(candidate);
      if (pathResult != null) {
        break;
      }
    }
    if (pathResult == null) {
      return null;
    }
    final absolutePart = _pathContext.joinAll(segments.getRange(0, i));
    final allResults = [pathResult];

    // then remove absolute path and eagerly consume path from start by first trying _maxRelativeSegments long prefix
    var prefix = absolutePart;
    var relativeSegments = segments.getRange(i, segments.length).toList();
    while (relativeSegments.isNotEmpty) {
      for (i = min(_maxRelativeSegments, relativeSegments.length); i > 0; i--) {
        final candidate = _pathContext.joinAll(relativeSegments.getRange(0, i));
        pathResult = _relativeRoutesRouter.getAll(candidate);
        if (pathResult != null) {
          allResults.add(_transformAllToAbsolute(pathResult, prefix));
          break;
        }
      }
      if (pathResult == null) {
        return null;
      }
      prefix = _pathContext.joinAll([prefix, ...relativeSegments.getRange(0, i)]);
      relativeSegments = relativeSegments.getRange(i, relativeSegments.length).toList();
    }
    return allResults.expand((i) => i).toList();
  }

  List<RouterResult> _transformAllToAbsolute(List<RouterResult> relativeResult, String absolutePath) =>
      relativeResult.map((relRes) => _transformToAbsolute(relRes, absolutePath)).toList();

  RouterResult _transformToAbsolute(RouterResult relativeResult, String absolutePath) {
    return RouterResult(
      builder: relativeResult.builder,
      pathParameters: relativeResult.pathParameters,
      pathSegment: _pathContext.join(absolutePath, relativeResult.pathSegment),
      pathTemplate: _pathContext.join(absolutePath, relativeResult.pathTemplate),
    );
  }
}

int _maxSegmentsInRelativePath(Map<String, PageBuilder> allRoutes) {
  return allRoutes.keys
      .where((path) => !path.startsWith('/'))
      .fold(0, (previousValue, relativePath) => max(relativePath.split('/').length, previousValue));
}
