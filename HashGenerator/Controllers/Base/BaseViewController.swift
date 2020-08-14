//
//  BaseViewController.swift
//  HashGenerator
//
//  Created by DaiTran on 8/14/20.
//  Copyright © 2020 DaiTran. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        navigationController?.navigationBar.titleTextAttributes = [
            .font: UIFont(name: "Roboto-Medium", size: 18)!
        ]
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "refresh"),
            style: .plain,
            target: self,
            action: #selector(didTapRefresh)
        )
        navigationController?.navigationBar.tintColor = UIColor.pinkCoral
        tabBarController?.tabBar.tintColor = UIColor.pinkCoral
    }
    
    @objc func didTapRefresh() {
    
    }
}
