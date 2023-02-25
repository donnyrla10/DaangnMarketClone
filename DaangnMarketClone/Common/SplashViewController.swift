//
//  ViewController.swift
//  DaangnMarketClone
//
//  Created by 김영선 on 2023/02/23.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        
        
    }

    init(rootViewController: RootViewController) {
        super.init(nibName: nil, bundle: nil)
    
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            rootViewController.attachViewController()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

