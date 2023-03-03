//
//  HomeViewController.swift
//  DaangnMarketClone
//
//  Created by minimani on 2023/02/25.
//

import UIKit
import SwiftUI
import SnapKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //네비게이션 바 추가
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        if #available(iOS 15.0, *) {
            var config = UIButton.Configuration.plain()
            var titleAttr = AttributedString.init("동네이름")
            titleAttr.font = .systemFont(ofSize: 18, weight: .heavy)
            config.attributedTitle = titleAttr
            config.image = UIImage(systemName: "chevron.down")
            config.imagePadding = 8
            config.imagePlacement = .trailing
            config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 10, weight: .semibold)
            let selectedVillageButton = UIButton(configuration: config)
            selectedVillageButton.tintColor = .black
            let villageButton = UIBarButtonItem(customView: selectedVillageButton)
            self.navigationItem.leftBarButtonItem = villageButton
        } else {
            let button: UIButton = {
                var button = UIButton()
                button.titleLabel?.font = .systemFont(ofSize: 18, weight: .heavy)
                button.setTitle("동네이름", for: .normal)
                button.setTitleColor(.black, for: .normal)
                button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
                button.imageEdgeInsets = .init(top: 0, left: 10, bottom: 0, right: 0)
                button.semanticContentAttribute = .forceRightToLeft
                return button
            }()
            button.tintColor = .black
            let villageButton = UIBarButtonItem(customView: button)
            self.navigationItem.leftBarButtonItem = villageButton
        }
        let searchButton = UIButton()
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.tintColor = .black
        let search = UIBarButtonItem(customView: searchButton)
        
        let categoryButton = UIButton()
        categoryButton.setImage(UIImage(systemName: "line.3.horizontal"), for: .normal)
        categoryButton.tintColor = .black
        let category = UIBarButtonItem(customView: categoryButton)
        
        let alarmButton = UIButton()
        alarmButton.setImage(UIImage(systemName: "bell"), for: .normal)
        alarmButton.tintColor = .black
        let alarm = UIBarButtonItem(customView: alarmButton)
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = 10
        
        self.navigationItem.rightBarButtonItems = [alarm, spacer, category, spacer, search]
    }
    
}

//Previews ===============================================================
struct HomeViewController_Previews: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
    }
    
    struct Container: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
            //SceneDelegate에서 처음에 HomeViewController를 보여주기 위해서 작업한 것과 비슷한 작업
            //CollectionView 띄워주기
            let homeViewController = HomeViewController()
            return UINavigationController(rootViewController: homeViewController)
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
        typealias UIViewControllerType = UIViewController
    }
}
