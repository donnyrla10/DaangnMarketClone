//
//  MainTabbarController.swift
//  DaangnMarketClone
//
//  Created by minimani on 2023/02/25.
//

import UIKit

class MainTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let homeViewController = HomeViewController()
        
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        
        let homeTabbarItem = UITabBarItem(title: "홈", image: UIImage(named: "tabbar_button_unselected_home"), selectedImage: UIImage(named: "tabbar_button_selected_home"))
        homeNavigationController.tabBarItem = homeTabbarItem
        
        setViewControllers([homeNavigationController, UIViewController(),  UIViewController(), UIViewController(), UIViewController()], animated: true)
    }
}
