import CNotifySDK
import Flutter
import UIKit

public class FlutterCnotifySdkPlugin: NSObject, FlutterPlugin, UIApplicationDelegate {
  var cNotifySDK: CNotifySDK?

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_cnotify_sdk", binaryMessenger: registrar.messenger())
    let instance = FlutterCnotifySdkPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "initSDK":
      initCNotifySDK(call.arguments, result: result)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func initCNotifySDK(_ arguments: Any, result: @escaping FlutterResult) {
    guard let args = arguments as? [String: Any] else {
      result(FlutterError(code: "INVALID_ARGUMENTS", message: "Arguments must be a dictionary", details: nil))
      return
    }
    
    let filePath = args["filePath"] as? String ?? "GoogleService-Info.plist"
    let testingMode = args["testing"] as? Bool ?? false

    print("Initializing CNotifySDK with file: \(filePath)")

    let filePathWithoutExtension = filePath.replacingOccurrences(of: ".plist", with: "")
    if let file = Bundle.main.path(forResource: filePathWithoutExtension, ofType: "plist") {
      cNotifySDK = CNotifySDK(contentsOfFile: file, testing: testingMode)
      UNUserNotificationCenter.current().delegate = cNotifySDK
      result("CNotifySDK initialized")
      print("CNotifySDK initialized (testing mode: \(testingMode))")
    } else {
      result(FlutterError(code: "FILE_NOT_FOUND", message: "Plist file not found", details: nil))
    }
  }

    // Ensure to add this method to handle notifications
  public func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
      cNotifySDK!.application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
  }

  public func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
      cNotifySDK!.application(application, didFailToRegisterForRemoteNotificationsWithError: error)
  }
}
