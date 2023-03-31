//
//  VillageLifeTableViewCell.swift
//  DaangnMarketClone
//
//  Created by minimani on 2023/03/03.
//

import UIKit

class VillageLifeTableViewCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.numberOfLines = 2
        label.text = "당근마켓 동네생활 테스트"
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "질문"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .systemBlue
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.text = "· 미아동"
        label.textColor = .systemGray2
        return label
    }()
    
    let writeTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.text = "· 1초 전"
        label.textColor = .systemGray2
        return label
    }()
    
    let thumbnail: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray5
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        return imageView
    }()
    
    let commentIconView: IconWithTextView = {
        let view = IconWithTextView(iconType: .comment, text: "6")
        return view
    }()
    
    let favoriteIconView: IconWithTextView = {
        let view = IconWithTextView(iconType: .favorite, text: "1")
        return view
    }()
    
    init(reuseIdentifier: String?, villageLifeInfo: VillageLife) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setUI()
        setData(villageLifeInfo: villageLifeInfo)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setData(villageLifeInfo: VillageLife) {
        titleLabel.text = villageLifeInfo.title
        categoryLabel.text = villageLifeInfo.category
        locationLabel.text = villageLifeInfo.location
    }
    
    private func setUI() {
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(categoryLabel)
        self.contentView.addSubview(locationLabel)
        self.contentView.addSubview(writeTimeLabel)
        self.contentView.addSubview(thumbnail)
        self.contentView.addSubview(commentIconView)
        self.contentView.addSubview(favoriteIconView)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        categoryLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(16)
        }
        
        locationLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.equalTo(categoryLabel.snp.trailing).offset(3)
        }
        
        writeTimeLabel.snp.makeConstraints {
            $0.leading.equalTo(locationLabel.snp.trailing).offset(3)
            $0.top.equalTo(locationLabel.snp.top)
        }
        
        thumbnail.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(16)
            $0.width.height.equalTo(65)
        }
        
        commentIconView.snp.makeConstraints {
            $0.top.equalTo(locationLabel.snp.bottom).offset(12)
            $0.leading.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(16)
        }
        
        favoriteIconView.snp.makeConstraints {
            $0.top.equalTo(locationLabel.snp.bottom).offset(12)
            $0.leading.equalTo(commentIconView.snp.trailing).offset(5)
        }
        
        self.contentView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.top).inset(-16)
            $0.bottom.equalTo(commentIconView.snp.bottom).inset(-16)
            $0.edges.equalToSuperview()
        }
    }
}
