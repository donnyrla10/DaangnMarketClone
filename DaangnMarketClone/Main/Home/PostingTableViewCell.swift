//
//  PostingTableViewCell.swift
//  DaangnMarketClone
//
//  Created by 김영선 on 2023/03/03.
//

import UIKit

class PostingTableViewCell: UITableViewCell {
    let titleLabel : UILabel = { //"iPhone 14 Pro 판매합니다."
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 16)
        title.numberOfLines = 2
        return title
    }()
    let addressLabel = UILabel() //대학동
    let timeLabel = UILabel() //1시간 전
    let priceLabel = UILabel() //50,000원
    let reservedLabel = UILabel() //예약중
    
    let chatButton = UIButton()
    let heartButton = UIButton()
    
    let postingImageView : UIImageView = {
        let imgView = UIImageView()
        imgView.layer.cornerRadius = 6
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.layer.shadowRadius = 2
        return imgView
    }()
    
    init(reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setCellUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setCellUI() {
        //imageview 붙이기
        self.contentView.addSubview(postingImageView)
        postingImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.leading.equalToSuperview().offset(20)
            $0.bottom.equalToSuperview().offset(-12)
            $0.width.height.equalTo(100)
        }
        self.contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.leading.equalTo(postingImageView.snp.trailing).offset(16)
        }
    }
}
