import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'cnotify_sdk_method_channel.dart';

abstract class CNotifySdkPlatform extends PlatformInterface {
  /// Constructs a FlutterCnotifySdkPlatform.
  CNotifySdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static CNotifySdkPlatform _instance = MethodChannelCNotifySdk();

  /// The default instance of [CNotifySdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelCNotifySdk].
  static CNotifySdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CNotifySdkPlatform] when
  /// they register themselves.
  static set instance(CNotifySdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> init({
    String? googleServiceInfoPlistPathOverride,
    bool testing = false,
  }) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
