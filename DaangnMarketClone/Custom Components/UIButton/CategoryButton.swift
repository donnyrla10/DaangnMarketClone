//
//  CategoryButton.swift
//  DaangnMarketClone
//
//  Created by minimani on 2023/03/09.
//

import UIKit

class CategoryButton: UIButton {
    
    let categoryTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "주제"
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        
        self.backgroundColor = .white
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.systemGray5.cgColor
        self.clipsToBounds = true
        self.layer.cornerRadius = 16
        
        self.addSubview(categoryTitleLabel)
        
        categoryTitleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        
        self.snp.makeConstraints { make in
            make.leading.equalTo(categoryTitleLabel.snp.leading).inset(-10)
            make.trailing.equalTo(categoryTitleLabel.snp.trailing).inset(-10)
            make.height.equalTo(35)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(title: String) {
        categoryTitleLabel.text = title
    }
}
