// import 'package:fifa/src/app/keys.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'extensions.dart';
//
// class LoginRobot {
//   const LoginRobot(this.tester);
//
//   final WidgetTester tester;
//
//   Future<void> enterUser(String user) async {
//     final userNameField = find.byKey(Keys.loginPageUserName);
//     await tester.tap(userNameField);
//     await tester.enterText(userNameField, user);
//   }
//
//   Future<void> enterPassword(String password) async {
//     final passwordField = find.byKey(Keys.loginPagePassword);
//     await tester.tap(passwordField);
//     await tester.enterText(passwordField, password);
//   }
//
//   Future<void> tapLoginButton() async {
//     await tester.tap(find.byKey(Keys.loginPageSignInButton));
//   }
//
//   Future<void> checkInvalidCredentialsMessageIsShown() async {
//     // final errorMessageFinder = find.byValueKey('snackbar');
//     throw UnimplementedError();
//   }
//
//   Future<void> checkHomeScreenIsShown() async {
//     final welcomeMessageFinder = find.byKey(Keys.homePage);
//     await tester.waitFor(welcomeMessageFinder);
//   }
//
//   Future<void> checkPendingMatchDialogIsShown() async {
//     final welcomeMessageFinder = find.byKey(Keys.lobbyCheckInDialog);
//     await tester.waitFor(welcomeMessageFinder);
//   }
// }
//
// class CheckInRobot {
//   const CheckInRobot(this.tester);
//
//   final WidgetTester tester;
//
//   Future<void> tapLeaveMatch() async {
//     await tester.tap(find.byKey(Keys.leaveCheckInDialogButtonKey));
//   }
//
//   Future<void> checkLeaveMessageIsShown() async {
//     final welcomeMessageFinder = find.text('Left the match');
//     await tester.waitFor(welcomeMessageFinder);
//     // expect(await tester.getText(welcomeMessageFinder), 'Left the match');
//   }
//
//   Future<void> tapEnterMatch(String password) async {
//     await tester.tap(find.byKey('check-in-match'));
//     await tester.tap(find.byKey('check-in-match'));
//   }
// }
//
// // class HomeRobot {
// //   const HomeRobot(this.driver);
// //
// //   final FlutterDriver driver;
// //
// //   Future<void> scrollToBottom(String listKey) async {
// //     // await driver.waitFor(find.byType('CustomScrollView'));
// //     final lastItem = find.byValueKey('Svenska');
// //     await driver.scrollUntilVisible(find.byType('CustomScrollView'), lastItem, dyScroll: -600);
// //     // await driver.scrollUntilVisible(find.byType('CustomScrollView'), find.byValueKey('home-news-tab'), dyScroll: 500);
// //   }
// //
// //   Future<void> tapEventsTab() async => driver.tap(find.byValueKey('home-events-tab'));
// //
// //   Future<void> tapNewsTab() async => driver.tap(find.byValueKey('home-news-tab'));
// //
// //   Future<void> tapMatchesTab() async => driver.tap(find.byValueKey('home-matches-tab'));
// // }
