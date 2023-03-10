//
//  UIView+Ex.swift
//  DaangnMarketClone
//
//  Created by minimani on 2023/03/11.
//

import UIKit

extension UIView {
    func addToTopViewController() {
        if let keyWindow = UIApplication.shared.keyWindow {
            if var viewController = keyWindow.rootViewController {
                while viewController.presentedViewController != nil {
                    viewController = viewController.presentedViewController!
                }
                viewController.view.addSubview(self)
                self.snp.makeConstraints { make in
                    make.edges.equalToSuperview()
                }
            }
        }
    }
}
