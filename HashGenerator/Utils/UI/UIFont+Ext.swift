//
//  UIFont+Ext.swift
//  HashGenerator
//
//  Created by Dai.Tran on 8/13/20.
//  Copyright © 2020 DaiTran. All rights reserved.
//

import UIKit

extension UIFont {
    private static func register(from url: URL) {
        guard let fontDataProvider = CGDataProvider(url: url as CFURL) else {
            print("Could not create font data provider for \(url).")
            return
        }
        let font = CGFont(fontDataProvider)
        var error: Unmanaged<CFError>?
        CTFontManagerRegisterGraphicsFont(font!, &error)
        if let error = error {
            print(error)
        }
    }
    
    public static func loadCustomFonts() {
        let fontNames = [
            "Roboto-Regular",
            "Roboto-Medium",
            "Roboto-Light",
            "Roboto-Bold"
        ]
        fontNames
            .map { Bundle.main.url(forResource: $0, withExtension: "ttf")! }
            .forEach { UIFont.register(from: $0) }
    }
}
