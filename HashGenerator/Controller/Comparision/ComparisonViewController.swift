//
//  ComparisonViewControler.swift
//  HashGenerator
//
//  Created by Macbook on 3/23/19.
//  Copyright © 2019 DaiTran. All rights reserved.
//

import UIKit

class ComparisionViewController: BaseViewController {
    lazy var textFields: [UITextField] = {
        let textFields = [UITextField(), UITextField()]
        textFields.forEach {
            $0.placeholder = "INPUT"
            $0.layer.borderWidth = 2
            $0.layer.cornerRadius = 5
            $0.textAlignment = .center
            $0.layer.masksToBounds = true
            $0.backgroundColor = .white
            $0.layer.borderColor = UserDefaults.standard.bool(forKey: isLightThemeKey) ? UIColor.red.cgColor : UIColor.orange.cgColor
            $0.returnKeyType = .done
            $0.delegate = self
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        return textFields
    }()
    
    let compareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Compare", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.layer.masksToBounds = true
        button.backgroundColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    func setupLayout() {
        view.addSubview(textFields[0])
        view.addSubview(compareButton)
        view.addSubview(textFields[1])
        
        textFields[0].topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 8).isActive = true
        textFields[0].heightAnchor.constraint(equalToConstant: 45).isActive = true
        textFields[0].leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        textFields[0].trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        
        compareButton.topAnchor.constraint(equalTo: textFields[0].bottomAnchor, constant: 8).isActive = true
        compareButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        compareButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        compareButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        textFields[1].topAnchor.constraint(equalTo: compareButton.bottomAnchor, constant: 8).isActive = true
        textFields[1].heightAnchor.constraint(equalToConstant: 45).isActive = true
        textFields[1].leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        textFields[1].trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
    }
}

extension ComparisionViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
