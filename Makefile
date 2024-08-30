#.PHONY: build/preBuild
pre-build:
	flutter pub get
	flutter packages pub run build_runner build --delete-conflicting-outputs

#.PHONY: build/android-dev-debug
build-android-dev-debug: pre-build
	flutter build apk --debug --flavor dev
	open build/app/outputs/flutter-apk/

#.PHONY: build-android-dev
build-android-dev: pre-build
	flutter build apk --release --flavor dev
	open build/app/outputs/flutter-apk/

#.PHONY: build-android-stg
build-android-stg: pre-build
	flutter build apk --release --flavor stg
	open build/app/outputs/flutter-apk/

#.PHONY: build/android-prd
build-android-prd: pre-build
	flutter build apk --release --flavor prd
	open build/app/outputs/flutter-apk/

#.PHONY: build/android-prd-bundle
build-android-prd-bundle: pre-build
	flutter build appbundle --release --flavor prod
	open build/app/outputs/flutter-appbundle/

#.PHONY: build/ios-dev
build-ios-dev: pre-build
	flutter build ios --release

#.PHONY: build/ios-stg
build-ios-stg: pre-build
	flutter build ios --release

#.PHONY: build/ios-prod
build-ios-prod: pre-build
	flutter build ios --release

gen-launcher-splash: pre-build
	flutter pub run flutter_launcher_icons
	#dart run flutter_native_splash:create

