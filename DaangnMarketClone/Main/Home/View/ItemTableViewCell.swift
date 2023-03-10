//
//  PostingTableViewCell.swift
//  DaangnMarketClone
//
//  Created by 김영선 on 2023/03/03.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    let titleLabel : UILabel = { //"iPhone 14 Pro 판매합니다."
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 15)
        title.numberOfLines = 2
        return title
    }()
    
    let addressLabel : UILabel = {
        let address = UILabel()
        address.font = UIFont.systemFont(ofSize: 13)
        address.text = "신림동"
        address.textColor = .systemGray2
        return address
    }()

    let timeLabel : UILabel = {
        let time = UILabel()
        time.font = UIFont.systemFont(ofSize: 13)
        time.text = "· 2시간 전"
        time.textColor = .systemGray2
        return time
    }()
    
    let priceLabel : UILabel = {
        let price = UILabel()
        price.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        price.text = "40,000원"
        return price
    }()
    
    let reservedView : UIView = {
        // Label Create.
        let reserved = UILabel()
        reserved.text = "예약중"
        reserved.textColor = .green
        reserved.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        
        //Rectangle Create
        let rectangleView = UIView()
        rectangleView.backgroundColor = UIColor(red: 34/225, green: 116/225, blue: 28/225, alpha: 1)
        rectangleView.clipsToBounds = true
        rectangleView.layer.cornerRadius = 2.0
        rectangleView.addSubview(reserved)
        reserved.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        return rectangleView
    }()

    let chatIconView: IconWithTextView = {
        let view = IconWithTextView(iconType: .chat, text: "2")
        return view
    }()
    
    let heartIconView: IconWithTextView = {
        let view = IconWithTextView(iconType: .heart, text: "4")
        return view
    }()
    
    let shareMessageIconView: IconWithTextView = {
        let view = IconWithTextView(iconType: .message, text: "1")
        return view
    }()

    let postingImageView : UIImageView = {
        let imgView = UIImageView()
        imgView.layer.cornerRadius = 6
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.layer.borderColor = CGColor(gray: 0.9, alpha: 1)
        imgView.layer.borderWidth = 1.2
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
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(reservedView)
        self.contentView.addSubview(addressLabel)
        self.contentView.addSubview(timeLabel)
        self.contentView.addSubview(priceLabel)
        self.contentView.addSubview(heartIconView)
        self.contentView.addSubview(chatIconView)

        postingImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.leading.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview().offset(-12)
            $0.width.height.equalTo(100.fromIPX) //14 Pro 기준으로, 393 / 375 -> 1.048 * 100 = 104.8
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalTo(postingImageView.snp.trailing).offset(10)
        }
        
        addressLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.equalTo(postingImageView.snp.trailing).offset(10)
        }
        
        timeLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.equalTo(addressLabel.snp.trailing).offset(3)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(addressLabel.snp.bottom).offset(10)
            $0.leading.equalTo(postingImageView.snp.trailing).offset(10)
        }
        
        heartIconView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(12)
        }

        chatIconView.snp.makeConstraints {
            $0.trailing.equalTo(heartIconView.snp.leading).offset(-4)
            $0.bottom.equalToSuperview().inset(12)
        }
        
//        reservedView.snp.makeConstraints {
//            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
//            $0.leading.equalTo(postingImageView.snp.trailing).offset(10)
//        }
    }
}

//객체 상대값 (width)
extension CGFloat {
    var fromIPX: CGFloat {
        let screenIPXWidth = 375.0
        let screenWidth = UIScreen.main.bounds.size.width
        let ratio = screenWidth / screenIPXWidth
        return self * ratio
//        return CGFloat((Int((CGFloat(self) * ratio) * 2) + 1)) / 2.0        // 0.5 단위 round
    }
}

extension Int {
    var fromIPX: CGFloat {
        let screenIPXWidth = 375.0
        let screenWidth = UIScreen.main.bounds.size.width
        let ratio = screenWidth / screenIPXWidth
        return CGFloat(self) * ratio
//        return CGFloat((Int((CGFloat(self) * ratio) * 2) + 1)) / 2.0        // 0.5 단위 round
    }
}
