import 'package:fifa/main_staging.dart' as app;
import 'package:fifa/src/common/environment.dart';
import 'package:flutter_driver/driver_extension.dart';

void main() {
  kTestMode = true;

  enableFlutterDriverExtension();
  app.main();
}
