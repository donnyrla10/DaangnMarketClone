//
//  VillageLifeTableHeaderView.swift
//  DaangnMarketClone
//
//  Created by minimani on 2023/03/09.
//

import UIKit

class VillageLifeTableHeaderView: UIView {
    
    var categoryButtonAction: ((_ sender: UIButton) -> ())?
    
    var categoryButtonArray: [CategoryButton] = []
    var dummyCategoryTitle: [String] = ["주제", "인기글", "같이해요", "동네맛집", "동네질문", "동네소식"]
    
    @objc func selectCategoryButton(_ sender: UIButton) {
        if let categoryButtonAction = categoryButtonAction {
            categoryButtonAction(sender)
        }
    }
    
    init() {
        super.init(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        let categoryScrollView = UIScrollView()
        categoryScrollView.showsHorizontalScrollIndicator = false
        self.addSubview(categoryScrollView)
        categoryScrollView.frame = .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50)
        
        for i in 0..<dummyCategoryTitle.count {
            let cateogryButton = CategoryButton()
            cateogryButton.tag = i
            cateogryButton.setTitle(title: dummyCategoryTitle[i])
            cateogryButton.addTarget(self, action: #selector(selectCategoryButton), for: .touchUpInside)
            
            categoryButtonArray.append(cateogryButton)
        }
        
        for i in 0..<categoryButtonArray.count {
            categoryScrollView.addSubview(categoryButtonArray[i])
            
            if i == 0 {
                categoryButtonArray[i].snp.makeConstraints { make in
                    make.centerY.equalToSuperview()
                    make.leading.equalToSuperview().inset(15)
                }
            } else if i == categoryButtonArray.count - 1 {
                categoryButtonArray[i].snp.makeConstraints { make in
                    make.centerY.equalToSuperview()
                    make.leading.equalTo(categoryButtonArray[i-1].snp.trailing).offset(10)
                    make.trailing.equalToSuperview().inset(15)
                }
            } else {
                categoryButtonArray[i].snp.makeConstraints { make in
                    make.centerY.equalToSuperview()
                    make.leading.equalTo(categoryButtonArray[i-1].snp.trailing).offset(10)
                }
            }
        }
    }
}
