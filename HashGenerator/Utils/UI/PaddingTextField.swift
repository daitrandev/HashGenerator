//
//  PaddingTextField.swift
//  HashGenerator
//
//  Created by DaiTran on 8/14/20.
//  Copyright © 2020 DaiTran. All rights reserved.
//

import UIKit

class PaddingTextField: UITextField {
    let padding = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
