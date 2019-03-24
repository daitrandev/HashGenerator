//
//  BaseCell.swift
//  HashGenerator
//
//  Created by Macbook on 3/13/19.
//  Copyright © 2019 DaiTran. All rights reserved.
//

import UIKit

class BaseCell: UITableViewCell {
    let label: UILabel = {
        let label = UILabel()
        label.text = "Base"
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        label.textColor = .white
        label.backgroundColor = UserDefaults.standard.bool(forKey: isLightThemeKey) ? .red : .orange
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 2
        textField.layer.cornerRadius = 5
        textField.textAlignment = .center
        textField.layer.masksToBounds = true
        textField.backgroundColor = .white
        textField.layer.borderColor = UserDefaults.standard.bool(forKey: isLightThemeKey) ? UIColor.red.cgColor : UIColor.orange.cgColor
        textField.returnKeyType = .done
        textField.delegate = self
        textField.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    func configure(with baseModel: BaseModel) {
        label.text = baseModel.labelText
        textField.placeholder = baseModel.labelText == "INPUT" ? "TEXT" : baseModel.labelText
        textField.text = baseModel.textFieldText
        textField.isEnabled = baseModel.isTextFieldEnabled
        textField.backgroundColor = !baseModel.isTextFieldEnabled ? UIColor(red: 1, green: 0, blue: 0, alpha: 0.5) : .white
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    func setupLayout() {
        contentView.addSubview(label)
        contentView.addSubview(textField)
        
        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
        label.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        textField.topAnchor.constraint(equalTo: label.topAnchor).isActive = true
        textField.bottomAnchor.constraint(equalTo: label.bottomAnchor).isActive = true
        textField.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 8).isActive = true
        textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BaseCell: UITextFieldDelegate {
    @objc func textFieldEditingChanged(textField: UITextField) {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
