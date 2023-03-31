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
        let villageLifeViewController = VillageLifeViewController()
        
        let homeNavigationController = NavigationController(rootViewController: homeViewController, tabType: .home)
        let villageLifeNavigationController = NavigationController(rootViewController: villageLifeViewController, tabType: .village)

        let homeTabbarItem = UITabBarItem(title: "홈", image: UIImage(named: "tabbar_button_unselected_home"), selectedImage: UIImage(named: "tabbar_button_selected_home"))
        homeNavigationController.tabBarItem = homeTabbarItem
        
        let villageLifeTabbarItem = UITabBarItem(title: "동네생활", image: UIImage(), selectedImage: UIImage())
        villageLifeNavigationController.tabBarItem = villageLifeTabbarItem
        
        setViewControllers([homeNavigationController, villageLifeNavigationController,  UIViewController(), UIViewController(), UIViewController()], animated: true)
    }
}
