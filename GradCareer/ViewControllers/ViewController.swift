//
//  ViewController.swift
//  GradCareer
//
//  Created by Ziyi Liao on 4/11/22.
//

import UIKit

class ViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    // create a logout button at top-left
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
    }
    
    @objc func handleLogout(){
        let loginController = LoginViewController()
        present(loginController, animated: true, completion: nil)
    }
    
}
