.PHONY: setup
setup:
	flutter channel stable
	flutter upgrade
	flutter pub get
	cd ios/ && pod install && cd ..


.PHONY: dependencies
dependencies:
	flutter clean && flutter pub get dependencies && flutter packages get

.PHONY: analyze
analyze:
	flutter analyze

.PHONY: format 
format:
	dart format -l 120 lib/

.PHONY: build-runner
build-runner:
	flutter  pub pub run build_runner build --delete-conflicting-outputs

.PHONY: watch
watch:
	flutter  pub pub run build_runner watch --delete-conflicting-outputs

.PHONY: unit-test
unit-test:
	flutter test --coverage --coverage-path=./coverage/lcov.info

.PHONY: invalidate-cache
invalidate-cache:
	android/gradlew cleanBuildCache

.PHONY: staging
staging:
	flutter run --flavor staging --target lib/main_staging.dart

.PHONY: production
production:
	flutter run --flavor production --target lib/main_production.dart

.PHONY: sksl
sksl:
	 flutter drive --driver=integration_test/test_driver/integration_perf_driver.dart --target=integration_test/shader_warmup_test.dart --profile --no-dds --flavor staging --dart-define=test=true --cache-sksl --purge-persistent-cache --write-sksl-on-exit flutter_warmup.sksl.json

.PHONY: sksl-debug
sksl-debug:
	 flutter drive --driver=integration_test/test_driver/integration_perf_driver.dart --target=integration_test/shader_warmup_test.dart --no-dds --flavor staging --dart-define=testing=true --cache-sksl --purge-persistent-cache --write-sksl-on-exit flutter_warmup.sksl.json

.PHONY: drive-sksl-from-integration
drive-sksl-from-integration:
	flutter drive --target=integration_test/e2e.dart --driver=integration_test/shader_warmup_driver.dart --profile --flavor staging --bundle-sksl-path flutter_warmup_ios_2.10.sksl.json

.PHONY: drive-sksl-from-drive
drive-sksl-from-drive:
	flutter drive --target=integration_test/e2e.dart --driver=integration_test/shader_warmup_driver.dart --profile --flavor staging --bundle-sksl-path flutter_drive_ios.sksl.json

.PHONY: drive
drive:
	flutter drive --target=integration_test/e2e.dart --driver=integration_test/shader_warmup_driver.dart --profile --flavor staging