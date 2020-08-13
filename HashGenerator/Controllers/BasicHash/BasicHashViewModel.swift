//
//  BasicHashViewModel.swift
//  HashGenerator
//
//  Created by Dai.Tran on 8/13/20.
//  Copyright © 2020 DaiTran. All rights reserved.
//

protocol BasicHashViewModelType: class {
    var cellLayoutItems: [BasicHashViewModel.CellLayoutItem] { get }
}

class BasicHashViewModel: BasicHashViewModelType {
    struct CellLayoutItem {
        let name: String
        var content: String?
    }
    
    var cellLayoutItems: [CellLayoutItem]
    
    init() {
        cellLayoutItems = [
            .init(name: "MD2"),
            .init(name: "MD4"),
            .init(name: "MD5"),
            .init(name: "SHA1"),
            .init(name: "SHA224"),
            .init(name: "SHA256"),
            .init(name: "SHA384"),
            .init(name: "SHA512")
        ]
    }
    
    
}
