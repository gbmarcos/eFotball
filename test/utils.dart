
import 'package:fifa/src/features/login/signup/utils/extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});
  group('Check countryNameFromId function', () {
    test('countryNameFromId function', () {
      expect(countryNameFromId(0), 'Afghanistan');
      expect(countryNameFromId(210), 'Sweden');
      expect(countryNameFromId(244), 'Zimbabwe');
      expect(countryNameFromId(256), null);
    });
  });
}
