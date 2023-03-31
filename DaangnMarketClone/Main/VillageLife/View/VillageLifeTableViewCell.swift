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
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .systemBlue
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
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
        print("villageLifeInfo \(villageLifeInfo)")
        setData(villageLifeInfo)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 받아온 데이터 세팅하기
    private func setData(_ villageLifeInfo: VillageLife) {
        /// 쓸 데이터 미리 세팅하기
        guard let title = villageLifeInfo.title,
              let image = villageLifeInfo.image,
              let location = villageLifeInfo.location,
              let time = villageLifeInfo.time,
              let category = villageLifeInfo.category,
              let comment = villageLifeInfo.comment,
              let participants = villageLifeInfo.participants,
              let favorite = villageLifeInfo.favorite
        else { return }
        
        titleLabel.text = title
        locationLabel.text = "\(location)"
        writeTimeLabel.text = time
        thumbnail.image = UIImage(named: image)
        favoriteIconView.setData(title: "\(favorite)", icon: .favorite)
        
        
        /// 카테고리
        /// 질문, 카테고리일 때만 보이기
        if category == CategoryType.question.rawValue || category == CategoryType.accident.rawValue {
            categoryLabel.text = category
        } else {
            locationLabel.snp.makeConstraints {
                $0.leading.equalToSuperview().inset(16)
            }
        }
        
        
        /// 코멘트 0개일 때 처리
        // TODO: 더 좋은 방법 생각해서 해오기
        /// 스택뷰로 만들어보기
        if comment <= 0 {
            commentIconView.isHidden = true
            favoriteIconView.snp.makeConstraints {
                $0.leading.equalToSuperview().inset(16)
            }
        } else {
            commentIconView.setData(title: "\(comment)", icon: .comment)
        }
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
