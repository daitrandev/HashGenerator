//
//  HMACViewModel.swift
//  HashGenerator
//
//  Created by DaiTran on 8/14/20.
//  Copyright © 2020 DaiTran. All rights reserved.
//

protocol HMACViewModelDelegate: BasicHashViewModelDelegate { }

protocol HMACViewModelType: class {
    var inputText: String? { get set }
    var inputKey: String? { get set }
    var cellLayoutItems: [CellLayoutItem] { get }
    var delegate: HMACViewModelDelegate? { get set }
}

class HMACViewModel: HMACViewModelType {
    var inputText: String? {
        didSet {
            calculateHMAC()
        }
    }
    
    var inputKey: String? {
        didSet {
            calculateHMAC()
        }
    }
    
    var cellLayoutItems: [CellLayoutItem] {
        didSet {
            delegate?.reloadOutputTableView()
        }
    }
    
    weak var delegate: HMACViewModelDelegate?
    
    init() {
        cellLayoutItems = [
            .init(algorithm: .MD5),
            .init(algorithm: .SHA1),
            .init(algorithm: .SHA224),
            .init(algorithm: .SHA256),
            .init(algorithm: .SHA384),
            .init(algorithm: .SHA512)
        ]
    }
    
    private func calculateHMAC() {
        guard
            let inputText = inputText, !inputText.isEmpty,
            let inputKey = inputKey, !inputKey.isEmpty else {
            clear()
            return
        }
        
        var cellLayoutItems = self.cellLayoutItems
        for index in 0..<cellLayoutItems.count {
            cellLayoutItems[index].content = cellLayoutItems[index].algorithm.hmac(inputString: inputText, key: inputKey)
        }
        self.cellLayoutItems = cellLayoutItems
    }
    
    private func clear() {
        var cellLayoutItems = self.cellLayoutItems
        for index in 0..<cellLayoutItems.count {
            cellLayoutItems[index].content = nil
        }
        self.cellLayoutItems = cellLayoutItems
    }
}
