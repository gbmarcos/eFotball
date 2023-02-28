import 'package:fifa/src/app/app.dart' show App;
import 'package:fifa/src/app/dependency_injection.dart';
import 'package:fifa/src/app/keys.dart';
import 'package:fifa/src/common/environment.dart';
import 'package:fifa/src/features/club/widgets/club_card.dart';
import 'package:fifa/src/features/club/widgets/featured_players.dart';
import 'package:fifa/src/features/match/matches_list.dart';
import 'package:fifa/src/features/news/news_list.dart';
import 'package:fifa/src/features/tournaments/tournament_section.dart';
import 'package:fifa/src/notifications/notification_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:integration_test/integration_test.dart';

// See dependency_injection.dart for testing dependencies that are used. These test dependencies mock data and API
// responses.
void main() {
  kTestMode = true;

  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
    ..framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.benchmarkLive
    // Necessary for being able to enterText in profile mode [https://stackoverflow.com/questions/71038404]
    ..testTextInput.register();

  setUp(() async {
    await registerGlobalDependencies(environment: Environment.staging);
  });
  testWidgets('Warm up shaders', (WidgetTester tester) async {
    await binding.watchPerformance(() async {
      // Build our app and trigger a frame.
      FlutterError.onError = (details) {};
      await tester.pumpWidget(const App());
      await tester.pumpAndSettle(const Duration(seconds: 1));
      // await createAccountFlow(tester);
      const runs = 1;

      for (var i = 0; i < runs; i++) {
        await forgotPasswordFlow(tester);
        await loginFlow(tester, password: '123456', username: 'mockUser');
        await warmupMatchDialog(tester);
        await warmupNotifications(tester);
        await warmupNewsPage(tester);
        await warmupClubPage(tester);
        await navigateToEachTab(tester);
        if (runs > 1 && i < runs - 1) {
          // More than one run and not the last run
          print('Login out');
          await logOut(tester);
        }
      }
    });
  });
}

Future<void> warmupNotifications(WidgetTester tester) async {
  final notificationIcon = find.byKey(Keys.notificationBell);

  await tester.tap(notificationIcon);
  await tester.pumpAndSettle();
  await tester.tap(find.byType(NotificationListTile).first);
  await tester.pumpAndSettle();

  await goBack(tester);
}

Future<void> warmupMatchDialog(WidgetTester tester,
    {bool decline = false}) async {
  await tester.pumpFPS(20);

  expect(find.byKey(Keys.lobbyCheckInDialog), findsOneWidget);

  await tester.pump(const Duration(seconds: 2));
// The dialog is dislpayed as soon as the app is loged in. If no warmup is wanted, then it must be declined
  if (decline) {
    await tester.tap(find.byKey(Keys.leaveCheckInDialogButtonKey));
    await tester.pumpAndSettle();
  } else {
    await tester.tap(find.byKey(Keys.confirmCheckInDialogButtonKey));

    await _warmupMatchPage(tester);
  }
}

Future<void> _warmupMatchPage(WidgetTester tester) async {
  await tester.pumpAndSettle();

  expect(find.byKey(Keys.matchInProgress), findsOneWidget);
  final submitScoreButton = find.byKey(Keys.matchInProgressSubmitScoreButton);
  await tester.tap(submitScoreButton);
  await tester.pumpAndSettle();

  expect(find.byKey(Keys.matchAddResult), findsOneWidget);
  await tester.pumpAndSettle(const Duration(seconds: 2));

  expect(find.byKey(Keys.matchDisputePage), findsOneWidget);

  await tester.tap(find.byKey(Keys.matchDisputePageAddEvidence));
  await tester.pumpAndSettle();

  expect(find.byKey(Keys.matchDisputeEvidenceDialog), findsOneWidget);
  final youtubeForm = find.byKey(Keys.matchDisputeEvidenceDialogYoutubeForm);
  await tester.tap(youtubeForm);
  await tester.pumpAndSettle();
  await tester.enterText(youtubeForm, 'https://www.youtube.com/watch?v=abc123');
  await tester.pumpAndSettle();

  await tester.tap(find.byKey(Keys.matchDisputeEvidenceDialogCancel));
  await tester.pumpAndSettle();
  await goBack(tester);
}

Future<void> warmupNewsPage(WidgetTester tester) async {
  warmupCommentsSection(WidgetTester tester) async {
    expect(find.byKey(Keys.newsPage), findsOneWidget);

    final addCommentForm = find.byKey(Keys.newsPageAddCommentForm);
    await tester.tap(find.byKey(Keys.newsPageCommentsTab));
    await tester.pumpAndSettle();
    expect(addCommentForm, findsOneWidget);
    await tester.tap(addCommentForm);
    await tester.pumpAndSettle();
    await tester.enterText(addCommentForm, 'test comment');
    await tester.pumpAndSettle();
    await tester.enterText(addCommentForm, '');
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(Keys.newsPageArticleTab));
    await tester.pumpAndSettle();
  }

  openOtherNew(WidgetTester tester) async {
    expect(find.byKey(Keys.newsPage), findsOneWidget);

    final newsCard = find.byType(NewsCard);
    await scrollView(tester, offset: 1800, scrollUp: false);
    // await tester.scrollUntilVisible(find.byKey(Keys.newsHeaderAllNews), 1800);
    await tester.tap(newsCard.first);
    await tester.pumpAndSettle();

    expect(find.byKey(Keys.newsPage), findsOneWidget);
  }

  goToNewsArchive(WidgetTester tester) async {
    expect(find.byKey(Keys.newsPage), findsOneWidget);

    final newsHeader = find.byKey(Keys.newsHeaderAllNews);

    await scrollView(tester, offset: 1800, scrollUp: false);
    await tester.tap(newsHeader);
    await tester.pumpAndSettle();
    expect(find.byKey(Keys.newsPageArchive), findsOneWidget);

    await tester.tap(find.byKey(Keys.newsPageArchiveClubDropdown));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Keys.newsPageArchiveClubDropdown),
        warnIfMissed: false);
    await tester.pumpAndSettle();

    await goBack(tester);
  }

  enterNewsPageFromHome(WidgetTester tester) async {
    expect(find.byKey(Keys.homePage), findsOneWidget);

    await tester.tap(find.byType(NewsCard).first);
    await tester.pumpAndSettle();
    expect(find.byKey(Keys.newsPage), findsOneWidget);
  }

  await enterNewsPageFromHome(tester);

  await warmupCommentsSection(tester);
  await openOtherNew(tester);
  await goToNewsArchive(tester);
  await tester.pumpAndSettle();
  await goBack(tester);
  await tester.pumpAndSettle();
  await goBack(tester);
  await tester.pumpAndSettle();
}

Future<void> warmupClubPage(WidgetTester tester) async {
  final clubCard = find.byType(ClubCardSmall).at(1);
  await tester.tap(clubCard);
  await tester.pumpAndSettle();

  expect(find.byKey(Keys.clubPage), findsOneWidget);

  final allClubNews = find.byKey(Keys.newsHeaderAllNews);
  await tester.tap(allClubNews);
  await tester.pumpAndSettle();

  expect(find.byKey(Keys.newsPageArchive), findsOneWidget);
  await tester.pumpAndSettle();

  await goBack(tester);
  await tester.pumpAndSettle();

  await tester.tap(find.byKey(Keys.clubPageEventsTab));
  await tester.pumpAndSettle();

  await tester.tap(find.byKey(Keys.clubPageMatchesTab));
  await tester.pumpAndSettle();

  await tester.tap(find.byType(OrgMatchCard).first);
  await tester.pumpAndSettle();
  await goBack(tester);
  await tester.pumpAndSettle();

  await scrollView(tester, offset: 300);

  await tester.tap(find.byKey(Keys.clubPageEventsTab));
  await tester.pumpAndSettle();
  await scrollView(tester, offset: 200);

  await tester.tap(find.byKey(Keys.clubPageFeedTab));
  await tester.pumpAndSettle();

  await scrollView(tester, scrollUp: false, offset: 1800);
  await tester.pumpAndSettle();

  final playerCard = find.byType(FeaturedPlayerSmallCard).first;

  await tester.tap(playerCard);
  await tester.pumpAndSettle(const Duration(seconds: 1));
  await goBack(tester);
  await tester.pumpAndSettle();
  await goBack(tester);
  await tester.pumpAndSettle();
}

Future<void> forgotPasswordFlow(WidgetTester tester) async {
  final forgotPasswordButton = find.byKey(Keys.loginPageForgotPasswordButton);
  await scrollView(tester, offset: 200, scrollUp: false);
  await tester.tap(forgotPasswordButton);
  await tester.pumpAndSettle();
  expect(find.byKey(Keys.forgotPassPage), findsOneWidget);
  await tester.tap(find.byKey(Keys.forgotPasswordPageBackButton));
  await tester.pumpAndSettle();
}

Future<void> createAccountFlow(WidgetTester tester) async {
  final createAccountButton = find.byKey(Keys.loginPageCreateAccountButton);
  await tester.tap(createAccountButton);
  await tester.pumpAndSettle();
  expect(find.byKey(Keys.signUpPage), findsOneWidget);
  final backButton = find.byType(BackButton);
  await tester.tap(backButton);
}

/// Introduces credentials and logs in to the app
/// It navigates to the home page

Future<void> loginFlow(WidgetTester tester,
    {String username = 'fabian', String password = 'manzanilla'}) async {
  final user = find.byKey(Keys.loginPageUserName);
  final passwordField = find.byKey(Keys.loginPagePassword);
  final loginButton = find.byKey(Keys.loginPageSignInButton);
  await tester.pump();

  await tester.tap(user);
  await tester.enterText(user, username);
  await tester.pumpAndSettle();

  await tester.tap(passwordField);
  await tester.enterText(passwordField, password);
  await tester.pumpAndSettle();

  await tester.tap(loginButton);

  await tester.pump(const Duration(seconds: 2));

  final homePage = find.byKey(Keys.homePage);
  expect(homePage, findsOneWidget);
}

Future<void> scrollHomePageTabs(WidgetTester tester) async {
  // Kye value pairs of the Tab's keys and their corresponding lists
  const homePageTabKeys = [
    Tuple2(Keys.homePageEventsTab, Keys.tournamentList),
    Tuple2(Keys.homePageNewsTab, Keys.newsList),
    Tuple2(Keys.homePageMatchesTab, Keys.matchesList),
  ];

  for (final tab in homePageTabKeys) {
    final tabWidget = find.byKey(tab.first);
    await tester.tap(tabWidget);
    await tester.pumpAndSettle();
    final list = find.byKey(tab.second);
    await scrollView(tester, scrollable: list);
  }
}

Future<void> navigateToEachTab(WidgetTester tester) async {
  // Kye value pairs of the Tab's keys and their corresponding lists
  const bottomNavBarKeys = [
    Tuple2(Keys.bottomNavBarProfile, _fiddleInProfilePage),
    Tuple2(Keys.bottomNavBarTournaments, _fiddleInTournamentPage),
    Tuple2(Keys.bottomNavBarStreams, _fiddleInStreamsPage),
    Tuple2(Keys.bottomNavBarClub, _fiddleInClubsPage),
    Tuple2(Keys.bottomNavBarHome, _fiddleInHomePage),
  ];

  for (final tab in bottomNavBarKeys) {
    final tabWidget = find.byKey(tab.first);
    await tester.tap(tabWidget);
    await tester.pumpAndSettle();
    await scrollView(tester, offset: 800);
    await tester.scrollUp();
    await tab.second(tester);

    await tester.pumpAndSettle();
  }
}

Future<void> _fiddleInStreamsPage(WidgetTester tester) async {
  expect(find.byKey(Keys.streamPage), findsOneWidget);
  final liveTab = find.byKey(Keys.streamPageLiveTab);
  final archiveTab = find.byKey(Keys.streamPageArchiveTab);
  // Scroll live streams
  await tester.tap(liveTab);
  await tester.pumpAndSettle();
  await scrollView(tester, offset: 400);
  await tester.pumpAndSettle();
  // Scroll archive
  await tester.tap(archiveTab);
  await tester.pumpAndSettle();
  await scrollView(tester, offset: 400);
  await tester.pumpAndSettle();
}

Future<void> goToHomePageTabsDetails(WidgetTester tester) async {
  // Kye value pairs of the Tab's keys and their corresponding lists
  const homePageTabKeys = [
    Tuple2(Keys.homePageEventsTab, TournamentCard),
    Tuple2(Keys.homePageNewsTab, NewsCard),
    Tuple2(Keys.homePageMatchesTab, MatchCard),
  ];

  for (final tab in homePageTabKeys) {
    final tabWidget = find.byKey(tab.first);
    await tester.tap(tabWidget);
    await tester.pumpAndSettle();
    final item = find.byType(tab.second);

    await tester.tap(item.first);
    await tester.pumpAndSettle();

    await goBack(tester);
    await tester.pumpAndSettle();
  }
}

Future<void> _fiddleInHomePage(WidgetTester tester) async {
  await scrollHomePageTabs(tester);
  await goToHomePageTabsDetails(tester);
}

Future<void> _fiddleInTournamentPage(WidgetTester tester) async {
  await _warmupTournamentMatchMaking(tester);

  await scrollView(tester, offset: 200, scrollUp: false);

  await tester.tap(find.byType(TournamentCard).at(1));
  await tester.pumpAndSettle();

  await warmupTournamentPage(tester);
}

Future<void> _warmupTournamentMatchMaking(WidgetTester tester) async {
  final liveNowTournament = find.byKey(Keys.liveNowTournamentCard);
  final joinMatchmakingMatch = find.byKey(Keys.tournamentPageJoinButton);

  await tester.tap(liveNowTournament);
  await tester.pumpAndSettle(const Duration(seconds: 3));

  await tester.tap(joinMatchmakingMatch);

  await tester.pumpFPS(60);

  await goBack(tester);

  await goBack(tester);
}

Future<void> warmupTournamentPage(WidgetTester tester) async {
  final infoTab = find.byKey(Keys.tournamentPageInfoTab);
  final resultsTab = find.byKey(Keys.tournamentPageResultsTab);
  final streamsTab = find.byKey(Keys.tournamentPageStreamsTab);

  final scoresSubTab = find.byKey(Keys.tournamentPageResultsScoreTab);
  final bracketSubTab = find.byKey(Keys.tournamentPageResultsBracketTab);
  final statsSubTab = find.byKey(Keys.tournamentPageResultStatsTab);

  await scrollView(tester, offset: 100);

  await tester.tap(resultsTab);
  await tester.pumpAndSettle();

  await tester.tap(streamsTab);
  await tester.pumpAndSettle();

  await tester.tap(resultsTab);
  await tester.pumpAndSettle();

  await tester.tap(scoresSubTab);
  await tester.pumpAndSettle();
  await scrollView(tester, offset: 100);

  await tester.tap(bracketSubTab);
  await tester.pumpAndSettle();
  await scrollView(tester, offset: 100, axis: Axis.horizontal);
  await scrollView(tester, offset: 100);

  await tester.tap(statsSubTab);
  await tester.pumpAndSettle();
  await scrollView(tester,
      offset: 100,
      scrollUp: false,
      scrollable: find.byKey(Keys.tournamentStatsTable));

  await scrollView(tester, offset: 100, axis: Axis.horizontal);

  await tester.tap(infoTab);
  await tester.pumpAndSettle();

  await goBack(tester);
}

Future<void> _fiddleInClubsPage(WidgetTester tester) async {}

Future<void> _fiddleInProfilePage(WidgetTester tester) async {
  expect(find.byKey(Keys.profilePage), findsOneWidget);

  final friendsTab = find.byKey(Keys.profilePageTabFriends);
  final settingsButton = find.byKey(Keys.profilePageEditProfileButton);

  await scrollView(tester, offset: 5200);

  await tester.tap(friendsTab);
  await tester.pumpAndSettle();
  await scrollView(tester, offset: 600);
  await tester.pumpAndSettle();

  await tester.scrollUp(offset: 800);

  await tester.tap(settingsButton);
  await tester.pumpAndSettle();

  expect(find.byKey(Keys.profileSettingsPage), findsOneWidget);
  await _fiddleProfileSettingsPage(tester);
  await tester.tap(find.byKey(Keys.bottomNavBarProfile));
  await tester.pumpAndSettle();
}

Future<void> _fiddleProfileSettingsPage(WidgetTester tester,
    {bool warmupTwitch = false}) async {
  expect(find.byKey(Keys.profileSettingsPage), findsOneWidget);

  final emailButton = find.byKey(Keys.profileSettingsPageEmailButton);
  await tester.tap(emailButton);
  await tester.pumpAndSettle();
  await scrollView(tester, scrollUp: false, offset: 4000);

  final languageDropdown = find.byKey(Keys.profileSettingsPageLanguageDropdown);
  // final consoleDropdown = find.byKey(Keys.profileSettingsPageConsoleDropdown);
  final signOut = find.byKey(Keys.profileSettingsPageSignOutButton);
  final signOutDialogCancelButton = find.byKey(Keys.signOutDialogCancelButton);
  final twitch = find.byKey(Keys.twitchAccount);
  final twitchWebViewClose = find.byKey(Keys.twitchWebViewClose);

  await tester.tap(languageDropdown);
  await tester.pumpAndSettle();

  await tester.tapAt(Offset(10,40));
  await tester.pumpAndSettle();

  await tester.tap(signOut);
  await tester.pumpAndSettle();

  expect(find.byKey(Keys.signOutDialog), findsOneWidget);

  await tester.tap(signOutDialogCancelButton);
  await tester.pumpAndSettle();

  if (warmupTwitch) {
    await tester.tap(twitch);
    await tester.pumpAndSettle();
    expect(find.byKey(Keys.twitchWebView), findsOneWidget);
    await tester.pumpAndSettle(const Duration(seconds: 4));

    await tester.tap(twitchWebViewClose);
    await tester.pumpAndSettle();
  }
}

Future<void> logOut(WidgetTester tester) async {
  final signOut = find.byKey(Keys.profileSettingsPageSignOutButton);
  final signOutDialogAcceptButton = find.byKey(Keys.signOutDialogAcceptButton);
  final settingsButton = find.byKey(Keys.profilePageEditProfileButton);

  final tabWidget = find.byKey(Keys.bottomNavBarProfile);
  await tester.tap(tabWidget);
  await tester.pumpAndSettle();

  await tester.tap(settingsButton);
  await tester.pumpAndSettle();

  expect(find.byKey(Keys.profileSettingsPage), findsOneWidget);

  await scrollView(tester, scrollUp: false);

  await tester.tap(signOut);
  await tester.pumpAndSettle();
  expect(find.byKey(Keys.signOutDialog), findsOneWidget);

  await tester.tap(signOutDialogAcceptButton);
  await tester.pumpAndSettle();
}

Future<void> scrollView(
  WidgetTester tester, {
  double offset = 3500,
  Finder? scrollable,
  bool scrollUp = true,
  Axis axis = Axis.vertical,
}) async {
  final list = scrollable ?? find.byType(Scrollable).first;
  final speed = offset * 4;
  final dx = axis == Axis.vertical ? 0.0 : offset;
  final dy = axis == Axis.horizontal ? 0.0 : offset;

  //Scroll down
  await tester.fling(list, Offset(-dx, -dy), speed);
  await tester.pumpAndSettle();
  await tester.pumpAndSettle();
  //Then back to the top again
  if (scrollUp) {
    await tester.fling(list, Offset(dx, dy), speed);
    await tester.pumpAndSettle();
  }
}

Future<void> goBack(WidgetTester tester) async {
  await tester.tap(find.byKey(Keys.backButton));
  await tester.pumpAndSettle();
}

extension on WidgetTester {
  Future<void> scrollUp({double offset = 800, Finder? scrollable}) async {
    final list = scrollable ?? find.byType(Scrollable).first;
    await drag(list, Offset(0, offset));
    await pumpAndSettle();
  }

  Future<void> pumpFPS(int frames, [int? fps]) async {
    final _fps = fps != null
        ? Duration(milliseconds: 1000 ~/ fps)
        : const Duration(milliseconds: 17);
    for (var c = 0; c < frames; c++) {
      await pump(_fps);
    }
  }
}

// await binding.traceAction(
//   () async {
//     // Scroll until the item to be found appears.
//     await tester.scrollUntilVisible(
//       itemFinder,
//       500.0,
//       scrollable: listFinder,
//     );
//   },
//   reportKey: 'scrolling_timeline',
// );
