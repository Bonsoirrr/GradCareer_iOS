//
//  TabBarController.swift
//  GradCareer
//
//  Created by Ziyi Liao on 4/13/22.
//

import UIKit
import Firebase
import FirebaseAuth

class TabBarController: UITabBarController {
    
    var homepage: HomeViewController?
    var management: managementViewController?
    var account: accountViewController?
    var subviewController: [UIViewController] = []
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    @objc func handleLogout(){
        do {
            try Auth.auth().signOut()
        } catch let logoutError{
            print(logoutError)
        }
        
        let loginController = LoginViewController()
        present(loginController, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: accountViewController())
        let vc3 = UINavigationController(rootViewController: managementViewController())

        viewControllers = [vc3, vc1, vc2]
                
        vc1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home-selected"))
        vc2.tabBarItem = UITabBarItem(title: "Account", image: UIImage(named:"account"), selectedImage: UIImage(named: "account-selected"))
        vc3.tabBarItem = UITabBarItem(title: "Management", image: UIImage(named: "management"), selectedImage: UIImage(named: "management-selected"))
        
        vc1.title = "Home"
        vc2.title = "Account"
        vc3.title = "Management"
        
        self.selectedIndex = 0
        self.selectedViewController = vc1

    }
    

}
