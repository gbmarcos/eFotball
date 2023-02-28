import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'package:very_good_performance/very_good_performance.dart';

import 'robots.dart';

void main() {
  late FlutterDriver driver;
  late LoginRobot loginRobot;
  late CheckInRobot checkInRobot;
  late HomeRobot homeRobot;

  setUpAll(() async {
    driver = await FlutterDriver.connect();
    loginRobot = LoginRobot(driver);
    checkInRobot = CheckInRobot(driver);
    homeRobot = HomeRobot(driver);
  });

  tearDownAll(() {
    driver.close();
  });

  group('Login', () {
    test('log in into the app', () async {
      await driver.capturePerformanceReport(
        reportName: 'login_performance',
        action: () async {
          await loginRobot.enterUser('fabian');
          await loginRobot.enterPassword('manzana');
          await loginRobot.tapLoginButton();
        },
      );
    });
    test('leave match', () async {
      await driver.runUnsynchronized(
        () async {
          await checkInRobot.tapLeaveMatch();
          await Future<void>.delayed(const Duration(seconds: 1));
          await checkInRobot.checkLeaveMessageIsShown();
        },
      );
    });
    test('scroll home page', () async {
      await driver.runUnsynchronized(() async {
        await driver.capturePerformanceReport(
          reportName: 'home-page-scroll',
          action: () async {
            await homeRobot.scrollToBottom('news-list');
            // await homeRobot.tapMatchesTab();
            await Future<void>.delayed(const Duration(milliseconds: 500));
          },
        );
      });
    }, timeout: const Timeout(Duration(minutes: 1)));
  });
}
