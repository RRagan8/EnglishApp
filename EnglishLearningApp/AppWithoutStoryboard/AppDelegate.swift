import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var articles: [Article] = []
    var words: [Word] = []
    var exercises: [Exercise] = []
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let db = DBHelper()
        let db_word = DBHelper_word()
        let db_article = DBHelper_article()
        let db_exercise = DBHelper_exercise()
        
        if UIApplication.isFirstLaunch() {
            db_word.fillInWords()
            db_article.createArticles()
            db_exercise.createExercises()
        }
        
        self.words = db_word.read()
        self.articles = db_article.read()
        self.exercises = db_exercise.read()
        
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

