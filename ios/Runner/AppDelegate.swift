import UIKit
import Flutter
import GoogleMaps

@main
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        if let path = Bundle.main.path(forResource: "Keys", ofType: "plist"),
           let keys = NSDictionary(contentsOfFile: path),
           let apiKey = keys["GoogleMapsApiKey"] as? String {
            GMSServices.provideAPIKey(apiKey)
            print("Google Maps API Key: \(apiKey)")
        } else {
            print("Keys.plist not found or GoogleMapsApiKey missing")
            fatalError("Google Maps API Key not found in Keys.plist")
        }

        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}