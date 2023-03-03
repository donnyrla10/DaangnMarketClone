//
//  AppDelegate.swift
//  DaangnMarketClone
//
//  Created by 김영선 on 2023/02/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let window: UIWindow = UIWindow()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window.rootViewController = RootViewController()
        window.makeKeyAndVisible()
        return true
    }
}

