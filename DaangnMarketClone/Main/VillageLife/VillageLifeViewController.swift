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
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    /// UI 생성
    private func setUI() {
        self.view.addSubview(villageLifeTableView)
        
        villageLifeTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension VillageLifeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "\(indexPath.row)"
        
        if let reuseCell = tableView.dequeueReusableCell(withIdentifier: identifier) {
            return reuseCell
        }
        
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: identifier)
        
        return cell
    }
}
