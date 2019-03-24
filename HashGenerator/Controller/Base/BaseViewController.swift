//
//  BaseViewController.swift
//  HashGenerator
//
//  Created by Macbook on 3/13/19.
//  Copyright © 2019 DaiTran. All rights reserved.
//

import UIKit
import MessageUI

class BaseViewController: UIViewController {
    
    let cellId = "cellId"
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.backgroundColor = .clear
        tableView.register(BaseCell.self, forCellReuseIdentifier: cellId)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var isLightTheme = UserDefaults.standard.bool(forKey: isLightThemeKey)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "home"), style: .done, target: self, action: #selector(didTapHome))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "refresh"), style: .plain, target: self, action: #selector(refreshButtonAction))
        
        if UserDefaults.standard.object(forKey: isLightThemeKey) == nil {
            UserDefaults.standard.set(true, forKey: isLightThemeKey)
        }
        
        setupTableView()
    }
    
    func setupTableView() {
        tableView.constraintTo(top: view.layoutMarginsGuide.topAnchor, bottom: view.layoutMarginsGuide.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0)
    }
    
    @objc private func didTapHome() {
        
    }
    
    @objc func refreshButtonAction() {
        
    }
    
    func updateColor(isLightTheme: Bool) {
        updateNavigationBarColor(isLightTheme: isLightTheme)
        updateTabBarColor(isLightTheme: isLightTheme)
        
        setNeedsStatusBarAppearanceUpdate()
        
        view.backgroundColor = isLightTheme ? UIColor.white : UIColor.black
    }
    
    private func updateNavigationBarColor(isLightTheme: Bool) {
        navigationController?.navigationBar.barTintColor = isLightTheme ? .white : .black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: isLightTheme ? UIColor.black : UIColor.white]
        navigationController?.navigationBar.tintColor = isLightTheme ? .red : .orange
    }
    
    private func updateTabBarColor(isLightTheme: Bool) {
        tabBarController?.tabBar.tintColor = isLightTheme ? .red : .orange
        tabBarController?.tabBar.barTintColor = isLightTheme ? .white : .black
    }
}

extension BaseViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension BaseViewController: MFMailComposeViewControllerDelegate {
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setToRecipients(["universappteam@gmail.com"])
        mailComposerVC.setSubject("[Hash-Generator++ Feedback]")
        
        return mailComposerVC
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
