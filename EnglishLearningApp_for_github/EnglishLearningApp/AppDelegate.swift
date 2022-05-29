import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {

        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {

    }
    
}

extension UIApplication {
        class func isFirstLaunch() -> Bool {
            if !UserDefaults.standard.bool(forKey: "hasBeenLaunchedBeforeFlag") {
                UserDefaults.standard.set(true, forKey: "hasBeenLaunchedBeforeFlag")
                UserDefaults.standard.synchronize()
                return true
            }
            return false
        }
    }

