import 'package:flutter/foundation.dart';

import 'cnotify_sdk_platform_interface.dart';

class CNotifySdk {
  Future<void> init({
    String? googleServiceInfoPlistPathOverride,
    bool testing = false,
  }) {
    debugPrint("Initializing CNotifySDK (v0.4.2) with testing mode: $testing");
    return CNotifySdkPlatform.instance.init(
      googleServiceInfoPlistPathOverride: googleServiceInfoPlistPathOverride,
      testing: testing,
    );
  }
}
