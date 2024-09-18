import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_cnotify_sdk_platform_interface.dart';

/// An implementation of [FlutterCNotifySdkPlatform] that uses method channels.
class MethodChannelFlutterCnotifySdk extends FlutterCNotifySdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_cnotify_sdk');

  @override
  Future<void> init({
    String? googleServiceInfoPlistPathOverride,
    bool testing = false,
  }) async {
    await methodChannel.invokeMethod<String>('initSDK', {
      'filePath': googleServiceInfoPlistPathOverride,
      'testing': testing,
    });
  }
}
