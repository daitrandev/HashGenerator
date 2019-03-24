//
//  HashViewController.swift
//  HashGenerator
//
//  Created by Macbook on 3/13/19.
//  Copyright © 2019 DaiTran. All rights reserved.
//

import UIKit
import MessageUI

class HashViewController: BaseViewController {
    
    var baseModels = [
        BaseModel(textFieldText: "", labelText: "INPUT", isTextFieldEnabled: true),
        BaseModel(textFieldText: "", labelText: "MD2", isTextFieldEnabled: false),
        BaseModel(textFieldText: "", labelText: "MD4", isTextFieldEnabled: false),
        BaseModel(textFieldText: "", labelText: "MD5", isTextFieldEnabled: false),
        BaseModel(textFieldText: "", labelText: "SHA1", isTextFieldEnabled: false),
        BaseModel(textFieldText: "", labelText: "SHA224", isTextFieldEnabled: false),
        BaseModel(textFieldText: "", labelText: "SHA256", isTextFieldEnabled: false),
        BaseModel(textFieldText: "", labelText: "SHA384", isTextFieldEnabled: false),
        BaseModel(textFieldText: "", labelText: "SHA512", isTextFieldEnabled: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @objc override func refreshButtonAction() {
        
    }
    
    override func updateColor(isLightTheme: Bool) {
        super.updateColor(isLightTheme: isLightTheme)
        guard let visibleCells = tableView.visibleCells as? [BaseCell] else { return }
        for i in 0..<visibleCells.count {
            visibleCells[i].backgroundColor = view.backgroundColor
//            visibleCells[i].updateColor()
//            let tag = visibleCells[i].tag
//            visibleCells[i].base = bases[tag]
        }
    }
}

extension HashViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return baseModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! BaseCell
        cell.configure(with: baseModels[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
}
