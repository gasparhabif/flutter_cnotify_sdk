import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_cnotify_sdk_method_channel.dart';

abstract class FlutterCNotifySdkPlatform extends PlatformInterface {
  /// Constructs a FlutterCnotifySdkPlatform.
  FlutterCNotifySdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterCNotifySdkPlatform _instance = MethodChannelFlutterCnotifySdk();

  /// The default instance of [FlutterCNotifySdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterCnotifySdk].
  static FlutterCNotifySdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterCNotifySdkPlatform] when
  /// they register themselves.
  static set instance(FlutterCNotifySdkPlatform instance) {
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
