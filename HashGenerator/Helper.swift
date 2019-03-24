//
//  Helper.swift
//  HashGenerator
//
//  Created by Macbook on 3/13/19.
//  Copyright © 2019 DaiTran. All rights reserved.
//

import UIKit

enum Helper {
    static func rateApp(appId: String, completion: @escaping ((_ success: Bool)->())) {
        guard let url = URL(string : "itms-apps://itunes.apple.com/app/" + appId) else {
            completion(false)
            return
        }
        guard #available(iOS 10, *) else {
            completion(UIApplication.shared.openURL(url))
            return
        }
        
        UIApplication.shared.open(url)
    }
    
    static func makeAlert(title: String, message: String, isUpgradeMessage: Bool) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Done", comment: ""), style: .cancel, handler: {(action) in
//            self.setNeedsStatusBarAppearanceUpdate()
        }))
        if (isUpgradeMessage) {
            alert.addAction(UIAlertAction(title: NSLocalizedString("Upgrade", comment: ""), style: .default, handler: { (action) in
//                self.setNeedsStatusBarAppearanceUpdate()
                self.rateApp(appId: appId) { success in
                    print("RateApp \(success)")
                }
            }))
        }
        
        return alert
    }
}
