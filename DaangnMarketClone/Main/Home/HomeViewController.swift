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
    // viewmodel 객체 생성
    private var homeViewModel: HomeViewModel = HomeViewModel()
    
    let tableView = UITableView()
    lazy var postingFloatingButton : UIButton = {
        if #available(iOS 15.0, *) {
            var config = UIButton.Configuration.plain()
            var titleAttr = AttributedString.init("글쓰기")
            titleAttr.font = .systemFont(ofSize: 18, weight: .heavy)
            config.attributedTitle = titleAttr
            config.image = UIImage(systemName: "plus")
            config.imagePadding = 8
            config.imagePlacement = .leading
            config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 14, weight: .semibold)
            let button = UIButton(configuration: config)
            button.layer.cornerRadius = 25
            button.backgroundColor = .orange
            button.tintColor = .white
            button.layer.shadowRadius = 2
            button.addTarget(self, action: #selector(selectPostingButton), for: .touchUpInside)
            return button
        }else {
            let button = UIButton()
            button.titleLabel?.font = .systemFont(ofSize: 18, weight: .heavy)
            button.setTitle("글쓰기", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.setImage(UIImage(systemName: "plus"), for: .normal)
            button.imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 10)
            button.layer.cornerRadius = 25
            button.backgroundColor = .orange
            button.tintColor = .white
            button.layer.shadowRadius = 2
            return button
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        setUI()
    }
    
    @objc func selectPostingButton(_ sender: UIButton) {
        postingFloatingButton.titleLabel!.text == "글쓰기" ? postingFloatingButton.setTitle("", for: .normal) : postingFloatingButton.setTitle("글쓰기", for: .normal)
        UIView.animate(withDuration: 0.2) {
            self.postingFloatingButton.snp.updateConstraints {
                if self.postingFloatingButton.titleLabel!.text != "글쓰기" {
                    $0.width.equalTo(110)
                }else {
                    $0.width.equalTo(50)
                }
            }
            self.postingFloatingButton.superview!.layoutIfNeeded()
        }
        
        let postingViewController = FloatingButtonViewController()
        postingViewController.modalPresentationStyle = .overFullScreen
        self.present(postingViewController, animated: false)
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
                let button = UIButton()
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
    
    private func setUI() {
        self.view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        self.view.addSubview(postingFloatingButton)
        postingFloatingButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalToSuperview().offset(-100)
            $0.width.equalTo(110)
            $0.height.equalTo(50)
        }
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.itemList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //view model에서 데이터 리스트의 원소가져오기 하나씩
        let item = homeViewModel.itemList[indexPath.row]
        let identifier = "\(indexPath)"
        //guard를 사용해서 identifier와 같지 않으면 return UITableViewCell로 해버렸는데, 같으면 resuableCell을 사용해야됨
        guard let reusableCell = tableView.dequeueReusableCell(withIdentifier: identifier) else {
            let cell = ItemTableViewCell(reuseIdentifier: identifier)
            cell.titleLabel.text = item.title
            cell.postingImageView.image = UIImage(named: item.image!) //우선.. 기본 이미지없으니까 강제..
            cell.locationLabel.text = item.location
            //값이 없어서.. 쓰레기값을 넣어서 나중에 처리
            //model을 optional 타입으로 만들지 않을 수 없음 -> 나쁜 선택
            //String(describing:) -> String 타입으로 변환? -> String으로 감싸서 문자열로 변환
            cell.priceLabel.text = "\(item.price ?? 0)"
            cell.heartIconView.textLabel.text = "\(item.favorite ?? -1)"
            cell.chatIconView.textLabel.text = "\(item.chat ?? -1)"
            return cell
        }
        return reusableCell
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
