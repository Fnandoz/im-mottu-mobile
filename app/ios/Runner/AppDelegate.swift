import Flutter
import UIKit
import Network

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
      
      let controller = window?.rootViewController as! FlutterViewController
      
      let methodChannel = FlutterMethodChannel(name: MethodChannelHelper.CHANNEL.rawValue, binaryMessenger: controller.binaryMessenger)
      
      let monitor = NWPathMonitor()
      
      monitor.pathUpdateHandler = { path in
          if path.status == .satisfied {
              methodChannel.invokeMethod(MethodChannelHelper.IS_DEVICE_OFFLINE_METHOD.rawValue, arguments: false)
          } else {
              methodChannel.invokeMethod(MethodChannelHelper.IS_DEVICE_OFFLINE_METHOD.rawValue, arguments: true)
          }
      }
      let queue = DispatchQueue(label: "NetworkMonitor")
      monitor.start(queue: queue)
      
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
