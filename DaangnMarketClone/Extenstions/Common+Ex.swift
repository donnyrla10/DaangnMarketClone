//
//  Common+Ex.swift
//  DaangnMarketClone
//
//  Created by minimani on 2023/03/09.
//

import UIKit

extension UIScreen {
    static var width: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    static var height: CGFloat {
        return UIScreen.main.bounds.height
    }
}

extension UIWindow {
    static var bottomPadding: CGFloat {
        let window = UIApplication.shared.windows.first
        return window?.safeAreaInsets.bottom ?? 0
    }
}
