import 'dart:convert';
import 'package:fifa/src/common/environment.dart';
import 'package:integration_test/integration_test_driver.dart';

Future<void> main() {
  kTestMode = true;
  return integrationDriver(
    responseDataCallback: (data) async {
      if (data != null) {
        tryCatch(() async {
          // final timeline = Timeline.fromJson(data['warmup_timeline'] as Map<String, dynamic>);
          //
          // // Convert the Timeline into a TimelineSummary that's easier to
          // // read and understand.
          // final summary = TimelineSummary.summarize(timeline);
          //
          // // Then, write the entire timeline to disk in a json format.
          // // This file can be opened in the Chrome browser's tracing tools
          // // found by navigating to chrome://tracing.
          // // Optionally, save the summary to disk by setting includeSummary
          // // to true
          // await summary.writeTimelineToFile(
          //   'warmup_timeline',
          //   pretty: true,
          // );
          print("Performance test completed" '${jsonEncode(data)}');
          for (final entry in data.entries) {
            await writeResponseData(
              entry.value as Map<String, dynamic>,
              testOutputFilename: entry.key,
              destinationDirectory: 'integration_test',
            );
          }
        });
      }
    },
  );
}

void tryCatch(Function() fn) async {
  try {
    print('responseDataCallback performance driver');
    await fn();
  } catch (e) {
    print('Caught exceptions tryCatch ');
    print(e);
  }
}
// extension WaitForTap on FlutterDriver {
//   Future<void> waitForAndTap(SerializableFinder finder) async {
//     await waitFor(finder);
//     await tap(finder);
//   }
// }
//Future<void> main() async {
//   await integrationDriver(
//     responseDataCallback: (reportData) async {
//       if (reportData != null) {
//         for (final entry in reportData.entries) {
//           await writeResponseData(
//             entry.value as Map<String, dynamic>,
//             testOutputFilename: entry.key,
//             destinationDirectory: 'integration_test_output',
//           );
//         }
//       }
//     },
//   );
// }
