//
//  RootViewController.swift
//  DaangnMarketClone
//
//  Created by minimani on 2023/02/25.
//

import UIKit

class RootViewController: UIViewController {
    
    func presentViewController(viewController: UIViewController, completion: (() -> ())? = nil) {
        if let presentedViewController = self.presentedViewController {
            presentedViewController.dismiss(animated: false) {
                self.present(viewController, animated: false, completion: completion)
            }
        } else {
            self.present(viewController, animated: false, completion: completion)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.perform(#selector(attachSpalshViewController), with: nil, afterDelay: 0.0)
    }
    
    @objc func attachSpalshViewController() {
        let splashViewController = SplashViewController(rootViewController: self)
        splashViewController.modalPresentationStyle = .fullScreen
        self.presentViewController(viewController: splashViewController)
    }
    
    func attachViewController() {
        let mainTabbarController = MainTabbarController()
        mainTabbarController.modalPresentationStyle = .fullScreen
        self.presentViewController(viewController: mainTabbarController)
        
    }
}
