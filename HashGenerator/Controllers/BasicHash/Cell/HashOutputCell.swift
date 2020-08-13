//
//  HashOutputCell.swift
//  HashGenerator
//
//  Created by Dai.Tran on 8/13/20.
//  Copyright © 2020 DaiTran. All rights reserved.
//

import UIKit

class HashOutputCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contentTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentTextField.backgroundColor = .lightGray
        contentTextField.isEnabled = false
    }
    
    func configure(with item: BasicHashViewModel.CellLayoutItem) {
        nameLabel.text = item.name
        contentTextField.text = item.content
    }
}
