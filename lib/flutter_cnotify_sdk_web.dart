// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter

import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:web/web.dart' as web;

import 'flutter_cnotify_sdk_platform_interface.dart';

/// A web implementation of the FlutterCnotifySdkPlatform of the FlutterCnotifySdk plugin.
class FlutterCnotifySdkWeb extends FlutterCNotifySdkPlatform {
  /// Constructs a FlutterCnotifySdkWeb
  FlutterCnotifySdkWeb();

  static void registerWith(Registrar registrar) {
    FlutterCNotifySdkPlatform.instance = FlutterCnotifySdkWeb();
  }

  @override
  Future<void> init({
    String? googleServiceInfoPlistPathOverride,
    bool testing = false,
  }) {
    throw UnimplementedError(
      'Plugin has not been implemented for web yet. If you really need it, please contact us at cnotify@eruka.tech',
    );
  }
}
