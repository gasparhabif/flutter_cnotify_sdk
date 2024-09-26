# flutter_cnotify_sdk

A new Flutter plugin project.

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/to/develop-plugins),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Publishing a new version
1. Update the version in `pubspec.yaml` and `ios/flutter_cnotify_sdk.podspec` files
2. Update the `CHANGELOG.md` file with the new version and changes
3. Run `dart pub publish --dry-run` to check if everything is ok
4. Push code changes to the repository
5. Run `dart pub publish` to publish the new version


## Updating the native SDKs
1. Update the version in `android/build.gradle` file
2. iOS does not required updating the SDK, because it is already the latest version
