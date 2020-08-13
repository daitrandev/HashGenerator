//
//  MainTabBarController.swift
//  BaseConverter
//
//  Created by Dai Tran on 4/20/18.
//  Copyright © 2018 Dai Tran. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hashViewController = BasicHashViewController()
        let hashViewNavController = UINavigationController(rootViewController: hashViewController)
        hashViewNavController.tabBarItem.image = UIImage(named: "hash")
        hashViewNavController.title = "Hash"
        
//        let hmacViewController = HMACViewController()
//        let hmacViewNavController = UINavigationController(rootViewController: hmacViewController)
//        hmacViewNavController.tabBarItem.image = UIImage(named: "key")
//        hmacViewNavController.title = "Key"
//
//        let comparisionViewController = ComparisionViewController()
//        let comparisionViewNavController = UINavigationController(rootViewController: comparisionViewController)
//        comparisionViewNavController.tabBarItem.image = UIImage(named: "magnifier")
//        comparisionViewNavController.title = "Comparision"
        
        viewControllers = [hashViewNavController]//, hmacViewNavController, comparisionViewNavController]
    }
}
