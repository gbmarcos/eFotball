import 'package:flutter/widgets.dart';

/// Keys are declared in this class in order to have a single source of truth between the app UI and the tests
class Keys {
  static const backButton = ValueKey('back-button');
  // Login
  static const splashPage = ValueKey('splash');
  static const loginPage = ValueKey('login');
  static const loginPageUserName = ValueKey('username');
  static const loginPagePassword = ValueKey('password');
  static const loginPageSignInButton = ValueKey('sign-in');
  static const loginPageForgotPasswordButton = ValueKey('forgot-password');
  static const forgotPasswordPageBackButton = ValueKey('forgot-password-page-back-button');
  static const loginPageCreateAccountButton = ValueKey('create-account');

  static const forgotPassPage = ValueKey('forgot-pass');
  static const checkYourInboxPage = ValueKey('check-your-inbox');
  static const resetYourPassPage = ValueKey('reset-your-pass');
  static const signUpPage = ValueKey('signup');

  //Bottom navigation bar
  static const bottomNavBarHome = ValueKey('bottom-nav-bar-home');
  static const bottomNavBarClub = ValueKey('bottom-nav-bar-club');
  static const bottomNavBarProfile = ValueKey('bottom-nav-bar-profile');
  static const bottomNavBarTournaments = ValueKey('bottom-nav-bar-tournaments');
  static const bottomNavBarStreams = ValueKey('bottom-nav-bar-streams');

  // Stream page
  static const streamPageLiveTab = ValueKey('stream-live-tab');
  static const streamPage = ValueKey('stream-page');
  static const streamPageArchiveTab = ValueKey('stream-archive-tab');

  // Profile page
  static const profilePage = ValueKey('profile');
  static const profilePageEditProfileButton = ValueKey('edit-profile');
  static const profilePageTabFriends = ValueKey('profile-tab-friends');
  static const profilePageTabOverview = ValueKey('profile-tab-overview');

  // // Profile Settings Page
  static const profileSettingsPage = ValueKey('profile-settings');
  static const profileSettingsPageEmailButton = ValueKey('profile-settings-change-email');
  static const profileSettingsPageLanguageGroup = ValueKey('profile-settings-language-group');
  static const profileSettingsPageLanguageDropdown = ValueKey('profile-settings-language-dropdown');
  static const profileSettingsPageConsoleDropdown = ValueKey('profile-settings-console-dropdown');
  static const profileSettingsPageSignOutButton = ValueKey('profile-settings-sign-out');
  static const signOutDialog = ValueKey('sign-out-dialog');
  static const signOutDialogCancelButton = ValueKey('sign-out-dialog-cancel-button');
  static const signOutDialogAcceptButton = ValueKey('sign-out-dialog-accept-button');
  static const twitchAccount = ValueKey('twitch-account');
  static const twitchWebView = ValueKey('twitch-web-view');
  static const twitchWebViewClose = ValueKey('twitch-web-view-close');

  // Club page
  static const clubPageFeedTab = ValueKey('club-page-feed-tab');
  static const clubPageEventsTab = ValueKey('club-page-events-tab');
  static const clubPageMatchesTab = ValueKey('club-page-matches-tab');

  // News
  static const newsPage = ValueKey('news-page');
  static const newsPageArticleTab = ValueKey('news-page-article-tab');
  static const newsPageCommentsTab = ValueKey('news-page-comments-tab');
  static const newsPageAddCommentForm = ValueKey('news-page-add-comment-form');
  static const newsHeaderAllNews = ValueKey('news-header-all-news');
  // News Archive
  static const newsPageArchive = ValueKey('news-page-archive');
  static const newsPageArchiveClubDropdown = ValueKey('news-page-archive-club-dropdown');

  // Tournament Page
  static const tournamentPage = ValueKey('tournament-page');
  static const tournamentPageJoinButton = ValueKey('tournament-page-join-button');
  static const tournamentStatsTable = ValueKey('tournament-stats-table');
  // // Tournament Page tabs
  static const tournamentPageInfoTab = ValueKey('tournament-page-info-tab');
  static const tournamentPageStreamsTab = ValueKey('tournament-page-streams-tab');
  static const tournamentPageResultsTab = ValueKey('tournament-page-results-tab');
  // // // Tournament Page Results sub tabs
  static const tournamentPageResultsScoreTab = ValueKey('tournament-page-results-score-tab');
  static const tournamentPageResultsBracketTab = ValueKey('tournament-page-results-bracket-tab');
  static const tournamentPageResultStatsTab = ValueKey('tournament-page-results-stats-tab');

  // Match
  static const matchInProgress = ValueKey('match-in-progress');
  static const matchInProgressSubmitScoreButton = ValueKey('match-in-progress-submit-score');
  static const matchScoreSubmissionPage = ValueKey('match-score-submission-page');
  static const matchDisputePage = ValueKey('match-dispute-page');
  static const matchDisputeEvidenceDialog = ValueKey('match-dispute-evidence-dialog');
  static const matchDisputeEvidenceDialogCancel = ValueKey('match-dispute-evidence-dialog-cancel');
  static const matchDisputeEvidenceDialogYoutubeForm = ValueKey('match-dispute-evidence-dialog-youtube-form');
  static const matchDisputePageAddEvidence = ValueKey('match-dispute-add-evidence-button');

  static const matchAddResult = ValueKey('match-add-result');

  static const homePageEventsTab = ValueKey('home-events-tab');
  static const homePageNewsTab = ValueKey('home-news-tab');
  static const homePageMatchesTab = ValueKey('home-matches-tab');
  static const tournamentList = PageStorageKey('tournaments-list');
  static const clubHomeSection = ValueKey('club-home-section');
  static const newsList = PageStorageKey('news-list');
  static const matchesList = PageStorageKey('matches-list');
  static const homePage = ValueKey('home');
  static const clubPage = ValueKey('club');
  static const newsHomeSection = ValueKey('news-home-section');
  static const matchesHomeSection = ValueKey('matches-home-section');
  static const chooseAClubPage = ValueKey('choose-a-club-page');
  static const tournamentsHomeSection = ValueKey('tournament-home-section');
  static const lobbyCheckInDialog = ValueKey('check-in-dialog');

  /// Minor Ui components keys
  static const confirmCheckInDialogButtonKey = ValueKey('check-in-match');
  static const liveNowTournamentCard = ValueKey('live-now-tournament-card');
  static const notificationBell = ValueKey('notification-bell');
  static const notificationAppBarTitle = ValueKey('notification-app-bar-title');

  static const leaveCheckInDialogButtonKey = ValueKey('leave-match');
  static const checkInSnackbarError = ValueKey('check-in-error');
  static const checkInSnackbarLeaveSuccess = ValueKey('leave-success');
  static const checkInSnackbarCheckInSuccess = ValueKey('check-in-success');
}
