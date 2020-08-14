//
//  BaseViewModel.swift
//  HashGenerator
//
//  Created by DaiTran on 8/14/20.
//  Copyright © 2020 DaiTran. All rights reserved.
//

protocol BaseViewModelType: class {
    var isPurchased: Bool { get }
}

class BaseViewModel: BaseViewModelType {
    var isPurchased: Bool {
        GlobalKeychain.getBool(for: KeychainKey.isPurchased) ?? false
    }
}
