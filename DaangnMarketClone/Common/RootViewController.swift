//
//  RootViewController.swift
//  DaangnMarketClone
//
//  Created by minimani on 2023/02/25.
//

import UIKit
import SwiftUI

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

struct RootViewController_Previews: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
    }
    
    struct Container: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
            //SceneDelegate에서 처음에 HomeViewController를 보여주기 위해서 작업한 것과 비슷한 작업
            //CollectionView 띄워주기
            let rootViewController = RootViewController()
            return UINavigationController(rootViewController: rootViewController)
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
        typealias UIViewControllerType = UIViewController
    }
}
