//
//  ComparisionViewModel.swift
//  HashGenerator
//
//  Created by DaiTran on 8/14/20.
//  Copyright © 2020 DaiTran. All rights reserved.
//

protocol ComparisionViewModelDelegate: class, MessageDialogPresentable {
    func renderOutput(isSame: Bool)
}

protocol ComparisionViewModelType: class {
    var firstInputText: String? { get set }
    var secondInputText: String? { get set }
    var delegate: ComparisionViewModelDelegate? { get set }
}

class ComparisionViewModel: ComparisionViewModelType {
    var firstInputText: String? {
        didSet {
            delegate?.renderOutput(isSame: firstInputText == secondInputText)
        }
    }
    
    var secondInputText: String? {
        didSet {
            delegate?.renderOutput(isSame: firstInputText == secondInputText)
        }
    }
    
    weak var delegate: ComparisionViewModelDelegate?
}
