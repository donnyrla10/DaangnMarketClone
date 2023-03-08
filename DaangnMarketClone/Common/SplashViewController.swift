//
//  ViewController.swift
//  DaangnMarketClone
//
//  Created by 김영선 on 2023/02/23.
//

import UIKit

class SplashViewController: UIViewController {
    let daangnIconView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "DaangnIcon")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(daangnIconView)
        daangnIconView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(64)
        }
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

