//
//  PostingVillageLifeViewController.swift
//  DaangnMarketClone
//
//  Created by milli on 2023/03/31.
//

import UIKit

class PostingVillageLifeViewController: BaseUIViewController {

    lazy var navigationBar : UINavigationBar = {
        let navigationBar = UINavigationBar()
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.barTintColor = .white
        return navigationBar
    }()
    
    @objc func tapCancelButton() {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    @objc func tapDoneButton() {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "동네생활 글쓰기"
        setNavigationBar()
    }
    
    private func setNavigationBar() {
        self.view.addSubview(navigationBar)
        navigationBar.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        let navigationItem = UINavigationItem(title: "내 물건 팔기")
        let cancelButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(tapCancelButton))
        let doneButton = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(tapDoneButton))
        cancelButton.tintColor = .black
        doneButton.tintColor = .orange
        navigationItem.leftBarButtonItem = cancelButton
        navigationItem.rightBarButtonItem = doneButton
        navigationBar.setItems([navigationItem], animated: true)
    }
}
