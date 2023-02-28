import 'dart:io';

import 'package:fifa/src/app/theme.dart';
import 'package:fifa/src/authentication/authentication_repository.dart';
import 'package:fifa/src/features/login/login/credentials/model/credential.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

/// Class that holds reference to app configurations and constants.
///
//The naming mimics Android's R class 😉
/// This class should hold only contain instances of other classes which in turn
/// will hold the app constants such as assets, themes, strings(not i18n) etc.
///Every classed contained here is meant to centralize constants and avoid runtime errors
///```
/// Text(R.str.website);
/// ```
class R {
  const R._();

  static _LocalStorageKey get localStorageKey => const _LocalStorageKey._();

  static _Strings get str => const _Strings._();

  static _Dimensions get dimen => const _Dimensions._();

  static _Themes get theme => const _Themes._();

  static _Fonts get fonts => const _Fonts._();

  static _Shapes get shapes => const _Shapes._();

  static _AppColors get colors => const _AppColors._();

  static _RouteNames get routeNames => const _RouteNames._();

  static _HiveBoxes get hiveBoxes => const _HiveBoxes._();

  static _ApiEndPoints get apiEndPoints => const _ApiEndPoints._();

  static _DateSpecifications get dateSpecifications => const _DateSpecifications._();

  static _Decorations get appDecorations => const _Decorations._();
}

/// Holds the themes used throughout the app
class _Themes {
  const _Themes._();

  ThemeData get light => CustomTheme(primary: R.colors.orange, isDark: true).fifaThemeData;

  ThemeData get dark => CustomTheme(primary: R.colors.orange, isDark: true).fifaThemeData;
}

///Contains the keys used in local Storage
///
///For example shared_preferences, hive or secure_storage among others
class _LocalStorageKey {
  const _LocalStorageKey._();

  String get isFirstUse => 'first_use';

  String get theme => 'selected_theme';

  String get locale => 'selected_locale';
}

///Holds strings that are used in your app and are not suitable for i18n
class _Strings {
  const _Strings._();

  String get website => 'https://www.example.com/';
}

///Holds common sizes fot icons or images
class _Dimensions {
  const _Dimensions._();

  _FontSizes get fontSize => const _FontSizes._();

  //Icon sizes
  double get iconSizeSM => 24;

  double get iconSizeM => 28;

  // Standard insets that should be defined in the design system
  double get insetXS => 4;

  double get insetSM => 8;

  double get insetM => 12;

  double get insetL => 16;

  double get fieldsAndButtonsHeight => 48;
}

class _FontSizes {
  const _FontSizes._();

  static const double scale = 1;

  double get body => 14 * scale;

  double get bodySm => 12 * scale;

  double get title => 16 * scale;
}

class _RouteNames {
  const _RouteNames._();

  String get initial => '/';

  String get homeSection => '/home';

  String get tournamentsSection => '/tournaments';

  String get streamsSection => '/streams';

  String get clubsSection => '/clubs';

  String get profileSection => '/profile/:id';

  String profileDetailsWithId(int id) => '/profile/$id';

  String get profileSettings => 'settings';

  String get clubPage => '/club/:id';

  String clubPageWithId(int id) => '/club/$id';

  String get forgotPassPage => '/forgotPassPage';

  String get checkYourInboxPage => '/checkYourInboxPage';

  String get signUpPage => '/signUpPage';

  String get chooseAClubPage => '/chooseAClubPage';

  ////////// MatchLobbyCheckIn route subset START
  String get match => '/match';

  String get matchLobby => '$match/lobby/:id';

  String matchLobbyWithId(int id) => '$match/lobby/$id';

  String get matchInProgress => '$match/in-progress/:id';

  String matchInProgressWithId(int id) => '$match/in-progress/$id';

  String get matchAddResult => '$match/add-result/:id';

  String matchAddResultWithId(int id) => '$match/add-result/$id';

  String get matchAwaitingConfirmation => '$match/waiting-confirmation/:id';

  String matchAwaitingConfirmationWithId(int id) => '$match/waiting-confirmation/$id';

  String get matchOver => '$match/game-over/:id';

  String matchOverWithId(int id) => '$match/game-over/$id';

  String get matchConfirmResult => '$match/confirm-result/:id';

  String matchConfirmResultWithId(int id) => '$match/confirm-result/$id';

  String get matchDispute => '$match/disputed/:id';

  String matchDisputeWithId(int id) => '$match/disputed/$id';

////////// MatchLobbyCheckIn route subset END

  String get newsArchive => 'newsArchive';

  ///// Organization
  String get clubDetails => 'club/:id';

  String clubDetailsWithId(String id) => 'club/$id';

  String get playersDetails => 'players';

  String get matchDetails => 'matchDetails/:gamesCount/:team1Score/:team2Score';

  String matchDetailsWithData({
    required int gamesCount,
    required int team1Score,
    required int team2Score,
  }) =>
      'matchDetails/$gamesCount/$team1Score/$team2Score';

  String get newsDetails => 'news/:id';

  String newsDetailsWithId(int id) => 'news/$id';

  String get matchmaking => '$match/matchmaking/:id';

  String matchmakingWithId(int id) => '$match/matchmaking/$id';

  //tournament routes

  String get tournamentDetails => 'tournament/:id';

  String tournamentDetailsWithId(String id) => 'tournament/$id';

  //tournament collection routes
  String get tournamentCollectionDetails => 'tournament/collection/:id';

  String tournamentCollectionDetailsWithId(String id) => 'tournament/collection/$id';
}

class _Fonts {
  const _Fonts._();

  String get poppins => 'Poppins';
}

class _ApiEndPoints {
  const _ApiEndPoints._();

  String get login => '/user/login';

  String get forgotPassword => '/user/password/forgot';

  String get resetPassword => '/user/password/reset';

  String get signup => '/user/signup';

  String get latestMatches => '/matches/latest';

  String get matchesSearch => '/matches/search';

  String get latestOrgMatches => '/org/match/latest/list';

  String get matchesLatestOrgsList => '/matches/latest/orgs/list';

  String get featuredNextMatch => '/org/match/next';

  String get getMatch => '/match/get';

  String get streams => '/streams/list';

  String get pastStreams => '/past_streams/list';

  String get userprofile => '/user/profile/get';

  String get ownUserprofile => '/user/profile/own/get';

  String get singleTournament => '/tournament/get';

  String get tournamentParticipants => '/tournament/participants/get';

  String get tournamentParticipant => '/tournament/participant/get';

  String get tournamentBrackets => '/tournament/brackets/get';

  String get changeProfileImage => '/user/profile/avatar/upload';

  String get changePass => '/user/password/change';

  String get updateProfile => '/user/profile/update';

  String get friendsSearch => '/friends/search';

  String get orgsSearch => '/orgs/search';

  String get disputeScore => '/tournament/matchmaking/scores/decline';

  String get uploadEvidence => '/match/upload_evidence';

  String get tournamentSignUp => '/tournament/signup';

  String get tournamentSignUpCancel => '/tournament/signup/cancel';

  String get leagueTeamsList => '/league/teams/list';

  String get matchmakingEnter => '/tournament/matchmaking/enter';

  String get matchmakingKeepAlive => '/tournament/matchmaking/keepalive';

  String get matchmakingQueueCount => '/tournament/matchmaking/queue_count';

  String get matchmakingLeave => '/tournament/matchmaking/leave';
}

class TextStyles {
  const TextStyles._();

  static TextStyle poppins = TextStyle(fontFamily: R.fonts.poppins, fontWeight: FontWeight.w400, height: 1);
  static late TextStyle h2Medium = poppins.copyWith(fontSize: 18, fontWeight: FontWeight.w500);
  static late TextStyle listTileTitle = poppins.copyWith(fontSize: 14, fontWeight: FontWeight.w500);
  static late TextStyle listTileTrailing =
      poppins.copyWith(fontSize: 13, fontWeight: FontWeight.w400, color: R.colors.listTileTrailing);
  static late TextStyle title = poppins.copyWith(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white);
  static late TextStyle h1 = poppins.copyWith(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white);
  static late TextStyle tab = poppins.copyWith(fontSize: 16, fontWeight: FontWeight.w600);
  static late TextStyle countdownTimer = poppins.copyWith(fontSize: 24, fontWeight: FontWeight.w600);
  static late TextStyle subTitleSm = poppins.copyWith(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.white);
  static late TextStyle subTitle =
      poppins.copyWith(fontSize: 12, fontWeight: FontWeight.w500, color: R.colors.inputBoxTextInitiative);
  static late TextStyle h2Bold = poppins.copyWith(fontSize: 18, fontWeight: FontWeight.w600);
}

/// Breakpoint at which the app can adapt its UI for
class Breakpoint {
  static const double sm = 500; // Mobile
  static const double md = 767; // Tablet
  static const double lg = 990; // Desktop
  static const double xl = 1200; // Large-desktop
}

class Device {
  static final isMobileDevice = !kIsWeb && (Platform.isIOS || Platform.isAndroid);

  static final isDesktopDevice = !kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux);

  static final isMobileDeviceOrWeb = kIsWeb || isMobileDevice;

  static final isDesktopDeviceOrWeb = kIsWeb || isDesktopDevice;
}

///Common shapes of the widgets
class _Shapes {
  const _Shapes._();

  BorderRadius get radius_4 => BorderRadius.circular(4);
  BorderRadius get radius_6 => BorderRadius.circular(6);

  BorderRadius get radius_15 => BorderRadius.circular(15);
}

///Color's palette of the App
class _AppColors {
  const _AppColors._();

  Color get orange => const Color(0xFFFFA814);

  Color get inputBoxErrorColor => Colors.deepOrangeAccent;

  Color get background => const Color(0xFF101113);

  Color get cardBackground => const Color(0xFF16181B);

  Color get boxBackground => const Color(0xFF1D1F21);

  Color get menuBarBackground => const Color(0xFF202326);

  Color get textBoxBG => const Color(0xFF23252A);

  Color get inputBoxStroke => const Color(0xFF2E2F34);

  Color get gameCountTagBackground => const Color(0xFF2C3036);

  Color get tabBarUnselected => const Color(0xFF30343c);

  Color get inputBoxTextInitiative => const Color(0xFF787B7F);

  Color get notFilledSocialMedia => const Color(0xFF35383D);

  Color get tournamentDescriptionColor => const Color(0xFFABADAE);

  Color get iconColourOff => const Color(0xFFC9C9C9);

  Color get tableRowOdd => const Color(0xFF141618);

  Color get tableRowEven => Colors.transparent;

  Color get tableScoreColor => const Color(0xFF191A1D);

  Color get circleAvatarColor => const Color(0xFF33383D);

  Color get bottomMainBarColor => const Color(0xFF313539);

  Color get searchFieldUnderlineColor => const Color(0xFF383A3F);

  Color get listTileTrailing => const Color(0xFF616161);

  Color get lobbyCheckInCardSection => const Color(0xFF2C2F33);

  Color get liveIndicator => const Color(0xFFE30A3E);

  //The color of the <p> HTML tag
  Color get htmlPTagColor => const Color(0xFFCBCCCF);
}

class _HiveBoxes {
  const _HiveBoxes._();

  Box<AuthenticationStatus> get authenticationStatus =>
      Hive.box<AuthenticationStatus>(AuthenticationRepository.authHiveBoxName);

  Box<UserCredential> get loggedUser => Hive.box<UserCredential>(AuthenticationRepository.loggedUserHiveBoxName);

  Box<UserCredential> get userCredential => Hive.box<UserCredential>(UserCredential.hiveBoxName);
}

class _DateSpecifications {
  const _DateSpecifications._();

  ///  17:35 CEST
  String formatHmm(DateTime dateTime) => DateFormat('H:mm').format(dateTime);

  /// Minutes and seconds: 15:30
  String formatMMS(DateTime dateTime) => DateFormat('mm:ss').format(dateTime);

  /// 7 hours ago
  String formatTimeago(DateTime dateTime, Locale locale) => timeago.format(dateTime, locale: locale.languageCode);

  /// 15 June
  String formatDM(DateTime dateTime) => DateFormat('dd, MMMM').format(dateTime);

  /// 15 June 2002
  String formatDMY(DateTime dateTime) => DateFormat('d MMMM yyyy').format(dateTime);

  /// Feb 21
  /// Equivalent to `MaterialLocalizations.of(context).formatShortMonthDay(dateTime)`
  String localizeMD(DateTime dateTime, BuildContext context) =>
      MaterialLocalizations.of(context).formatShortMonthDay(dateTime);

  DateTime get maxDateOfBirthAllowed => DateTime(
        DateTime.now().year - 4,
        DateTime.now().month,
        DateTime.now().day,
      );
}

class _Decorations {
  const _Decorations._();

  InputDecorationTheme get commonFieldDecoration => InputDecorationTheme(
        contentPadding: EdgeInsets.zero,
        hintStyle: TextStyle(
          fontSize: 13,
          color: R.colors.inputBoxTextInitiative,
        ),
        labelStyle: TextStyle(
          fontSize: 13,
          color: R.colors.inputBoxTextInitiative,
        ),
        filled: true,
        fillColor: R.colors.textBoxBG,
        focusedBorder: OutlineInputBorder(
          borderRadius: R.shapes.radius_4,
          borderSide: BorderSide(
            color: R.colors.orange,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: R.colors.inputBoxStroke,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: R.colors.inputBoxStroke,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: R.colors.inputBoxErrorColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: R.colors.inputBoxErrorColor,
          ),
        ),
        errorMaxLines: 5,
        errorStyle: TextStyle(
          color: R.colors.inputBoxErrorColor,
        ),
      );
}
