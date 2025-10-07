import Flutter
import UIKit
import GoogleMaps

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Lê a chave do arquivo Secrets.plist
    var googleMapsApiKey = ""
    if let path = Bundle.main.path(forResource: "Secrets", ofType: "plist"),
       let secrets = NSDictionary(contentsOfFile: path),
       let apiKey = secrets["GOOGLE_MAPS_API_KEY"] as? String {
      googleMapsApiKey = apiKey
    }
    
    GMSServices.provideAPIKey(googleMapsApiKey)
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
