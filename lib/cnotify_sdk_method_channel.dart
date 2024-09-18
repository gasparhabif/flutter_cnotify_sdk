import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'cnotify_sdk_platform_interface.dart';

/// An implementation of [CNotifySdkPlatform] that uses method channels.
class MethodChannelCNotifySdk extends CNotifySdkPlatform {
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
