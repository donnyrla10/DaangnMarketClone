//
//  PostingViewController.swift
//  DaangnMarketClone
//
//  Created by 김영선 on 2023/03/10.
//

import UIKit
import SwiftUI
import SnapKit

class FloatingButtonViewController: UIViewController {
    lazy var cancelButton : UIButton = {
        if #available(iOS 15.0, *) {
            var config = UIButton.Configuration.plain()
            config.image = UIImage(systemName: "xmark")
            config.imagePadding = 8
            config.imagePlacement = .leading
            config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 14, weight: .semibold)
            let button = UIButton(configuration: config)
            button.layer.cornerRadius = 25
            button.backgroundColor = .white
            button.tintColor = .black
            button.addTarget(self, action: #selector(cancelPostingButton), for: .touchUpInside)
            return button
        }else {
            let button = UIButton()
            button.titleLabel?.font = .systemFont(ofSize: 18, weight: .heavy)
            button.setImage(UIImage(systemName: "xmark"), for: .normal)
            button.imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 10)
            button.layer.cornerRadius = 25
            button.backgroundColor = .white
            button.tintColor = .black
            return button
        }
    }()
    
    lazy var background : UIButton = {
        let backgroundButton = UIButton()
        backgroundButton.backgroundColor = .black
        backgroundButton.alpha = 0.6
        backgroundButton.addTarget(self, action: #selector(cancelPostingButton), for: .touchUpInside)
        return backgroundButton
    }()
    
    lazy var myItemButton : UIButton = {
        if #available(iOS 15.0, *) {
            var config = UIButton.Configuration.plain()
            var titleAttr = AttributedString.init("내 물건 팔기")
            titleAttr.font = .systemFont(ofSize: 18, weight: .regular)
            config.attributedTitle = titleAttr
            config.image = UIImage(systemName: "bag.badge.plus")
            config.imagePadding = 8
            config.imagePlacement = .leading
            config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 14, weight: .semibold)
            let button = UIButton(configuration: config)
            button.layer.cornerRadius = 14
            button.backgroundColor = .white
            button.tintColor = .black
            button.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 0)
            button.contentHorizontalAlignment = .leading
            button.addTarget(self, action: #selector(myItemPostingButton), for: .touchUpInside)
            return button
        }else {
            let button = UIButton()
            button.titleLabel?.font = .systemFont(ofSize: 18, weight: .regular)
            button.setTitle("내 물건 팔기", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.setImage(UIImage(systemName: "bag.badge.plus"), for: .normal)
            button.imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 10)
            button.layer.cornerRadius = 14
            button.backgroundColor = .white
            button.tintColor = .black
            button.contentHorizontalAlignment = .left
            button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 50)
            button.addTarget(self, action: #selector(myItemPostingButton), for: .touchUpInside)
            return button
        }
    }()
    
    /// type을 이용해 동네생활에서는 다른 뷰가 뜨도록
    init(viewType: ViewType = .home) {
        super.init(nibName: nil, bundle: nil)
        setUI()
        setData(viewType: viewType)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func cancelPostingButton(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: false)
    }
    
    @objc func myItemPostingButton(_ sender: UIButton) {
        let postingItemViewController = PostingItemViewController()
        postingItemViewController.modalPresentationStyle = .overFullScreen
        self.present(postingItemViewController, animated: true)
    }
    
    @objc func postingVillageLife() {
        let postingVillageLifeViewController = PostingVillageLifeViewController()
        postingVillageLifeViewController.modalPresentationStyle = .fullScreen
        self.present(postingVillageLifeViewController, animated: true)
    }
    
    private func setData(viewType: ViewType) {
        /// addTarget 초기화
        myItemButton.removeTarget(nil, action: nil, for: .allEvents)
        
        switch viewType {
            case .home:
                myItemButton.setTitle("내 물건 팔기", for: .normal)
                myItemButton.addTarget(self, action: #selector(myItemPostingButton), for: .touchUpInside)
            case .villageLife:
                myItemButton.setTitle("동네 생활", for: .normal)
                myItemButton.addTarget(self, action: #selector(postingVillageLife), for: .touchUpInside)
        }
    }
    
    private func setUI() {
        self.view.addSubview(background)
        self.view.addSubview(cancelButton)
        self.view.addSubview(myItemButton)
        background.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        cancelButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalToSuperview().offset(-100)
            $0.width.height.equalTo(50)
        }
        myItemButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalTo(cancelButton.snp.top).offset(-16)
            $0.width.equalTo(200)
            $0.height.equalTo(56)
        }
    }
}

//Previews ===============================================================
struct PostingViewController_Previews: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
    }
    
    struct Container: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
            //SceneDelegate에서 처음에 HomeViewController를 보여주기 위해서 작업한 것과 비슷한 작업
            //CollectionView 띄워주기
            let postingViewController = FloatingButtonViewController()
            return UINavigationController(rootViewController: postingViewController)
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
        typealias UIViewControllerType = UIViewController
    }
}
