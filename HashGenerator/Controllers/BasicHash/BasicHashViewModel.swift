//
//  BasicHashViewModel.swift
//  HashGenerator
//
//  Created by Dai.Tran on 8/13/20.
//  Copyright © 2020 DaiTran. All rights reserved.
//

protocol BasicHashViewModelDelegate: class, MessageDialogPresentable, HUDPresentable {
    func reloadOutputTableView()
}

protocol BasicHashViewModelType: class {
    var inputText: String? { get set }
    var cellLayoutItems: [BasicHashViewModel.CellLayoutItem] { get }
    var delegate: BasicHashViewModelDelegate? { get set }
}

class BasicHashViewModel: BasicHashViewModelType {
    struct CellLayoutItem {
        let algorithm: HashAlgorithm
        var content: String?
    }
    
    var inputText: String? {
        didSet {
            guard let inputText = inputText, !inputText.isEmpty else {
                clear()
                return
            }
            
            var cellLayoutItems = self.cellLayoutItems
            for index in 0..<cellLayoutItems.count {
                cellLayoutItems[index].content = cellLayoutItems[index].algorithm.hash(inputString: inputText)
            }
            self.cellLayoutItems = cellLayoutItems
        }
    }
    
    var cellLayoutItems: [CellLayoutItem] {
        didSet {
            delegate?.reloadOutputTableView()
        }
    }
    
    weak var delegate: BasicHashViewModelDelegate?
    
    init() {
        cellLayoutItems = [
            .init(algorithm: .MD2),
            .init(algorithm: .MD4),
            .init(algorithm: .MD5),
            .init(algorithm: .SHA1),
            .init(algorithm: .SHA224),
            .init(algorithm: .SHA256),
            .init(algorithm: .SHA384),
            .init(algorithm: .SHA512)
        ]
    }
    
    private func clear() {
        var cellLayoutItems = self.cellLayoutItems
        for index in 0..<cellLayoutItems.count {
            cellLayoutItems[index].content = nil
        }
        self.cellLayoutItems = cellLayoutItems
    }
}
