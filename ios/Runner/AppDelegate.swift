import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {


    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let mainChannel = FlutterMethodChannel(name: "main.flutter",
                                                  binaryMessenger: controller.binaryMessenger)
        mainChannel.setMethodCallHandler({
          (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in

            if (call.method == "getAppTitle") {
                result(self.CFBundleDisplayName())
            } else if (call.method == "getAppKey") {
                result(self.appKey())
            } else if (call.method == "isPro") {
                result(self.isPro())
            } else if (call.method == "getAdBannerId") {
                result(self.admobBannerId())
            } else if (call.method == "getAdInterstitialId") {
                result(self.admobInterId())
            } else if (call.method == "getAdRewardedId") {
                result(self.admobVideoId())
            } else if (call.method == "getLanguageCode") {
                result(self.language())
            } else if (call.method == "getAppRatingPackage") {
                result(self.appRatingPackage())
            }

        })

        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)

    }

    func appRatingPackage() -> String {
        return langString(key: "appRatingPackage")
    }
    
    func language() -> String {
        return langString(key: "language")
    }

    func admobBannerId() -> String {
        return langString(key: "admobBannerId")
    }

    func admobInterId() -> String {
        return langString(key: "admobInterId")
    }

    func admobVideoId() -> String {
        return langString(key: "admobVideoId")
    }

    func CFBundleDisplayName() -> String {
        return langString(key: "CFBundleDisplayName")
    }

    func appKey() -> String {
        return langString(key: "appKey")
    }

    func isPro() -> Bool {
        return langString(key: "isPro") == "true"
    }
    
    func langString(key: String) -> String {
        return NSLocalizedString(key, tableName: "InfoPlist",
                                 value: defaultString(key: key), comment: "")
    }
    
    func defaultString(key: String) -> String {
        let fallbackLanguage = "en"
        guard let fallbackBundlePath = Bundle.main.path(forResource: fallbackLanguage, ofType: "lproj") else { return key }
        guard let fallbackBundle = Bundle(path: fallbackBundlePath) else { return key }
        let fallbackString = fallbackBundle.localizedString(forKey: key, value: "", table: "InfoPlist")
        return fallbackString
    }
    
}
