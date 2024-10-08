package com.example.flutter_cnotify_sdk

import android.content.Context
import android.util.Log
import me.cnotify.cnotify_android_sdk.CNotifySDK
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** FlutterCnotifySdkPlugin */
class FlutterCnotifySdkPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var context: Context  // Store the context


  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_cnotify_sdk")
    channel.setMethodCallHandler(this)
    context = flutterPluginBinding.applicationContext

  }

  override fun onMethodCall(call: MethodCall, result: Result) {  
    if (call.method == "initSDK") {
      val testing = call.argument<Boolean>("testing") ?: false  // Use false if null
      Log.d("CNotifySDK", "Initializing CNotifySDK with testing mode: $testing")
      CNotifySDK.getInstance(context, testing)

      Log.d("CNotifySDK", "CNotifySDK initialized")
      result.success("CNotifySDK initialized")
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
