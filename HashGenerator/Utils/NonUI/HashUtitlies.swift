//
//  HashUtitlies.swift
//  HashGenerator
//
//  Created by Dai.Tran on 8/13/20.
//  Copyright © 2020 DaiTran. All rights reserved.
//

import CommonCrypto
import Foundation

enum HashAlgorithm: String {
    case MD2
    case MD4
    case MD5
    case SHA1
    case SHA224
    case SHA256
    case SHA384
    case SHA512
    
    func hash(inputString: String) -> String? {
        guard let inputData = inputString.data(using: .utf8) else { return nil }
        let algos = [
            HashAlgorithm.MD2.rawValue: (CC_MD2, CC_MD2_DIGEST_LENGTH),
            HashAlgorithm.MD4.rawValue: (CC_MD4, CC_MD4_DIGEST_LENGTH),
            HashAlgorithm.MD5.rawValue: (CC_MD5, CC_MD5_DIGEST_LENGTH),
            HashAlgorithm.SHA1.rawValue: (CC_SHA1, CC_SHA1_DIGEST_LENGTH),
            HashAlgorithm.SHA224.rawValue: (CC_SHA224, CC_SHA224_DIGEST_LENGTH),
            HashAlgorithm.SHA256.rawValue: (CC_SHA256, CC_SHA256_DIGEST_LENGTH),
            HashAlgorithm.SHA384.rawValue: (CC_SHA384, CC_SHA384_DIGEST_LENGTH),
            HashAlgorithm.SHA512.rawValue: (CC_SHA512, CC_SHA512_DIGEST_LENGTH)
        ]
        guard let (hashAlgorithm, length) = algos[self.rawValue]  else { return nil }
        var hashData = Data(count: Int(length))

        _ = hashData.withUnsafeMutableBytes { digestBytes in
            inputData.withUnsafeBytes { messageBytes in
                hashAlgorithm(messageBytes, CC_LONG(inputData.count), digestBytes)
            }
        }
        return hashData.map { String(format: "%02hhx", $0) }.joined()
    }
}
