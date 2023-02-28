import 'package:flutter_test/flutter_test.dart';

extension WidgetTesterX on WidgetTester {
  Future<void> waitFor(Finder finder) async {
    do {
      await pumpAndSettle();
      await Future<void>.delayed(const Duration(milliseconds: 100));
    } while (finder.evaluate().isEmpty);
  }
}
