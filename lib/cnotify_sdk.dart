import 'cnotify_sdk_platform_interface.dart';

class CNotifySdk {
  Future<void> init({
    String? googleServiceInfoPlistPathOverride,
    bool testing = false,
  }) {
    return CNotifySdkPlatform.instance.init(
      googleServiceInfoPlistPathOverride: googleServiceInfoPlistPathOverride,
      testing: testing,
    );
  }
}
