mkdir -p metrics-results
flutter pub run dart_code_metrics:metrics analyze lib --reporter=json > metrics-results/dart_code_metrics.json
