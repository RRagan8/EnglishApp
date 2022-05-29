import UIKit

class MainTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemRed
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: ProfileViewController())
        let vc3 = UINavigationController(rootViewController: ExercisesViewController())
        let vc4 = UINavigationController(rootViewController: TextsViewController())
        
        self.tabBar.tintColor = UIColor.black
        
        tabBar.unselectedItemTintColor = .black
        tabBar.tintColor = .blue
        
        self.tabBar.backgroundColor = UIColor.systemTeal
        
        vc1.tabBarItem.image = UIImage(systemName: "house.circle")
        vc2.tabBarItem.image = UIImage(systemName: "person.crop.circle")
        vc3.tabBarItem.image = UIImage(systemName: "highlighter")
        vc4.tabBarItem.image = UIImage(systemName: "book.circle")
        
        vc1.title = "Home"
        vc2.title = "Profile"
        vc3.title = "Exercises"
        vc4.title = "Texts"
        
        
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
    }
    
}
