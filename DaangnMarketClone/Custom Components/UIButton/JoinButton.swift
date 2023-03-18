//
//  JoinButton.swift
//  DaangnMarketClone
//
//  Created by min on 2023/03/17.
//

import UIKit

class JoinButton: UIButton {
    
    init() {
        super.init(frame: .zero)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.clipsToBounds = true
        self.layer.cornerRadius = 5
        self.backgroundColor = .systemOrange
        self.setImage(UIImage(systemName: "plus")?.withRenderingMode(.alwaysTemplate), for: .normal)
        self.tintColor = .white
        self.setTitle("참여", for: .normal)

        self.snp.makeConstraints {
            $0.width.equalTo(80)
            $0.height.equalTo(35)
        }
    }
}
