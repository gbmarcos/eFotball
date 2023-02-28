import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

class LoginRobot {
  const LoginRobot(this.driver);

  final FlutterDriver driver;

  Future<void> enterUser(String user) async {
    await driver.tap(find.byValueKey('username'));
    await driver.enterText(user);
  }

  Future<void> enterPassword(String password) async {
    await driver.tap(find.byValueKey('password'));
    await driver.enterText(password);
  }

  Future<void> tapLoginButton() async {
    await driver.tap(find.byValueKey('sign-in'));
  }

  // Future<void> checkInvalidCredentialsMessageIsShown() async {
  //   final errorMessageFinder = find.byValueKey('snackbar');
  //   await driver.waitFor(errorMessageFinder);
  // }

  Future<void> checkHomeScreenIsShown() async {
    final welcomeMessageFinder = find.byValueKey('home');
    await driver.waitFor(welcomeMessageFinder);
  }

  Future<void> checkPendingMatchDialogIsShown() async {
    final welcomeMessageFinder = find.byValueKey('check-in-dialog');
    await driver.waitFor(welcomeMessageFinder, timeout: const Duration(seconds: 2));
  }
}

class CheckInRobot {
  const CheckInRobot(this.driver);

  final FlutterDriver driver;

  Future<void> tapLeaveMatch() async {
    await driver.tap(find.byValueKey('leave-match'));
  }

  Future<void> checkLeaveMessageIsShown() async {
    final welcomeMessageFinder = find.text('Left the match');
    await driver.waitFor(welcomeMessageFinder);
    expect(await driver.getText(welcomeMessageFinder), 'Left the match');
  }

  Future<void> tapEnterMatch(String password) async {
    await driver.tap(find.byValueKey('check-in-match'));
  }
}

class HomeRobot {
  const HomeRobot(this.driver);

  final FlutterDriver driver;

  Future<void> scrollToBottom(String listKey) async {
    // await driver.waitFor(find.byType('CustomScrollView'));
    final lastItem = find.byValueKey('Svenska');
    await driver.scrollUntilVisible(find.byType('CustomScrollView'), lastItem, dyScroll: -600);
    // await driver.scrollUntilVisible(find.byType('CustomScrollView'), find.byValueKey('home-news-tab'), dyScroll: 500);
  }

  Future<void> tapEventsTab() async => driver.tap(find.byValueKey('home-events-tab'));
  Future<void> tapNewsTab() async => driver.tap(find.byValueKey('home-news-tab'));
  Future<void> tapMatchesTab() async => driver.tap(find.byValueKey('home-matches-tab'));
}
