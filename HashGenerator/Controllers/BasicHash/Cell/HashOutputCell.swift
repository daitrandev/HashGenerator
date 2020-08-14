//
//  HashOutputCell.swift
//  HashGenerator
//
//  Created by Dai.Tran on 8/13/20.
//  Copyright © 2020 DaiTran. All rights reserved.
//

import UIKit

protocol HashOutputCellDelegate: class {
    func didTapCopy(string: String)
}

class HashOutputCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contentTextField: PaddingTextField!
    @IBOutlet weak var copyButton: UIButton!
    
    weak var delegate: HashOutputCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentTextField.backgroundColor = .lightGray
        contentTextField.isEnabled = false
        copyButton.imageView?.set(color: .white)
        
        copyButton.addTarget(self, action: #selector(didTapCopy), for: .touchUpInside)
    }
    
    func configure(with item: BasicHashViewModel.CellLayoutItem) {
        nameLabel.text = item.algorithm.rawValue
        contentTextField.text = item.content
    }
    
    @objc private func didTapCopy() {
        delegate?.didTapCopy(string: contentTextField.text!)
    }
}
