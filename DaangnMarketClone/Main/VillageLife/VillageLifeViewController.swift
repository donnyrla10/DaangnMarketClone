//
//  VillageLifeViewController.swift
//  DaangnMarketClone
//
//  Created by minimani on 2023/03/03.
//

import UIKit

class VillageLifeViewController: BaseUIViewController {
    
    lazy var villageLifeTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.separatorInset = .zero
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        tableView.tableHeaderView = villageLifeTableHeaderView
        return tableView
    }()
    
    lazy var villageLifeTableHeaderView: VillageLifeTableHeaderView = {
        let view = VillageLifeTableHeaderView()
        view.categoryButtonAction = categoryButtonAction
        return view
    }()
    
    lazy var floatingButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.layer.cornerRadius = 25
        button.backgroundColor = .orange
        button.tintColor = .white
        button.layer.shadowRadius = 2
        button.addTarget(self, action: #selector(selectFloatingButton), for: .touchUpInside)
        return button
    }()
    
    private let topicListView = TopicListView()
    
    @objc func selectFloatingButton() {
        let postingViewController = FloatingButtonViewController(viewType: .villageLife)
        postingViewController.modalPresentationStyle = .overFullScreen
        self.present(postingViewController, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    /// UI 생성
    private func setUI() {
        self.view.addSubview(villageLifeTableView)
        self.view.addSubview(floatingButton)
        
        villageLifeTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        floatingButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(100)
            $0.width.height.equalTo(50)
        }
    }
    
    private func categoryButtonAction(_ sender: UIButton) {
        print("button : \(sender.tag)")
        
        /// 주제
        if sender.tag == 0 {
            let bottomSheetView = BottomSheetView(contentView: topicListView)
            bottomSheetView.presentBottomSheetView()
        }
    }
}

extension VillageLifeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "\(indexPath.row)"
        
        if let reuseCell = tableView.dequeueReusableCell(withIdentifier: identifier) {
            return reuseCell
        }
        
        let cell = VillageLifeTableViewCell.init(reuseIdentifier: identifier)
        
        return cell
    }
}
