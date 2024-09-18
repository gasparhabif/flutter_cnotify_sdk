import 'flutter_cnotify_sdk_platform_interface.dart';

class FlutterCNotifySdk {
  Future<void> init({
    String? googleServiceInfoPlistPathOverride,
    bool testing = false,
  }) {
    return FlutterCNotifySdkPlatform.instance.init(
      googleServiceInfoPlistPathOverride: googleServiceInfoPlistPathOverride,
      testing: testing,
    );
  }
}
