//
//  NavigationBar.swift
//  DaangnMarketClone
//
//  Created by 김영선 on 2023/03/31.
//

import UIKit

enum TabType {
    case home
    case village
}

// 메인탭의 UINavigationBar
class NavigationController: UINavigationController {
    let locationButton : UIBarButtonItem = {
        let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .heavy)
        button.setTitle("신림동", for: .normal)
        button.tintColor = .black
        button.setTitleColor(.black, for: .normal)
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        button.imageEdgeInsets = .init(top: 0, left: 10, bottom: 0, right: 0)
        button.semanticContentAttribute = .forceRightToLeft
        let locationButton = UIBarButtonItem(customView: button)
        return locationButton
    }()
    
    let firstButton : UIBarButtonItem = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = .black
        let barButton = UIBarButtonItem(customView: button)
        return barButton
    }()
    
    lazy var secondButton : UIBarButtonItem = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = .black
        let barButton = UIBarButtonItem(customView: button)
        return barButton
    }()
    
    let thirdButton : UIBarButtonItem = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "bell"), for: .normal)
        button.tintColor = .black
        let barButton = UIBarButtonItem(customView: button)
        return barButton
    }()
    
    let spacer : UIBarButtonItem = {
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = 10
        return spacer
    }()
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(rootViewController: UIViewController, tabType: TabType) {
        self.init(rootViewController: rootViewController)
        setNavigationBar(tabType: tabType, rootViewController: rootViewController)
    }
    
    private func setNavigationBar(tabType: TabType, rootViewController: UIViewController) {
        setButton(tabType: tabType)
        rootViewController.navigationItem.leftBarButtonItem = locationButton
        rootViewController.navigationItem.rightBarButtonItems = [thirdButton, spacer, secondButton, spacer, firstButton]
    }
    
    private func setButton(tabType: TabType) {
        switch tabType {
        case .home:
            let button = UIButton()
            button.setImage(UIImage(systemName: "line.3.horizontal"), for: .normal)
            button.tintColor = .black
            let barButton = UIBarButtonItem(customView: button)
            secondButton = barButton
        case .village:
            let button = UIButton()
            button.setImage(UIImage(systemName: "person.circle"), for: .normal)
            button.tintColor = .black
            let barButton = UIBarButtonItem(customView: button)
            secondButton = barButton        }
    }
    
}
