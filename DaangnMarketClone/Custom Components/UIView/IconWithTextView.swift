//
//  IconWithTextView.swift
//  DaangnMarketClone
//
//  Created by minimani on 2023/03/04.
//

import UIKit

enum IconType {
    case comment
    case favorite
    case people
}

/// 아이콘과 텍스트가 같이 있는 UIView
class IconWithTextView: UIView {
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .systemGray2
        imageView.image = UIImage.init(systemName: "message")?.withRenderingMode(.alwaysTemplate)
        return imageView
    }()
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    init(iconType: IconType, text: String) {
        super.init(frame: .zero)
        
        self.addSubview(iconImageView)
        self.addSubview(textLabel)
        
        iconImageView.snp.makeConstraints {
            $0.top.bottom.leading.equalToSuperview()
            $0.width.height.equalTo(15)
        }
        
        textLabel.text = text
        textLabel.snp.makeConstraints {
            $0.leading.equalTo(iconImageView.snp.trailing).offset(3)
            $0.trailing.equalToSuperview()
            $0.centerY.equalTo(iconImageView)
        }
        
        self.snp.makeConstraints {
            $0.leading.equalTo(iconImageView.snp.leading)
            $0.trailing.equalTo(textLabel.snp.trailing)
            $0.top.equalTo(iconImageView.snp.top)
            $0.bottom.equalTo(iconImageView.snp.bottom)
        }
        
        setIcon(iconType: iconType)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setIcon(iconType: IconType) {
        switch iconType {
        case .comment:
            iconImageView.image = UIImage.init(systemName: "message")?.withRenderingMode(.alwaysTemplate)
        case .favorite:
            iconImageView.image = UIImage.init(systemName: "hand.thumbsup")?.withRenderingMode(.alwaysTemplate)
        case .people:
            iconImageView.image = UIImage.init(systemName: "person.2")?.withRenderingMode(.alwaysTemplate)
        }
    }
}
