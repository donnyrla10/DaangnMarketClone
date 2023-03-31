//
//  PostingSummaryListView.swift
//  DaangnMarketClone
//
//  Created by milli on 2023/03/31.
//

import UIKit

class PostingSummaryListView: UIView {
    
    lazy var summaryTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.sectionFooterHeight = 0
        return tableView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "게시글의 주제를 선택해 주세요."
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    private let defaultSummaryArray: [String] = ["동네질문", "동네사건사고"]
    private let interestSummaryArray: [String] = ["동네맛집", "동네소식", "생활정보", "취미생활", "일상", "분실/실종센터", "해주세요", "동네사진전"]
    
    init() {
        super.init(frame: .zero)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.addSubview(titleLabel)
        self.addSubview(summaryTableView)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(28)
            $0.leading.equalToSuperview().inset(16)
        }
        
        summaryTableView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(28)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension PostingSummaryListView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return defaultSummaryArray.count
        }
        
        return interestSummaryArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "기본 주제"
        } else {
            return "내 관심 주제"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "\(indexPath.section) \(indexPath.row)"
        
        if let reuseCell = tableView.dequeueReusableCell(withIdentifier: identifier) {
            return reuseCell
        }
        
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: identifier)
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
        
        if indexPath.section == 0 {
            cell.textLabel?.text = defaultSummaryArray[indexPath.row]
        } else {
            cell.textLabel?.text = interestSummaryArray[indexPath.row]
        }
        
        return cell
    }
    
}
