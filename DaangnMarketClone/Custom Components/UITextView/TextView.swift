//
//  TextView.swift
//  DaangnMarketClone
//
//  Created by milli on 2023/03/31.
//

import UIKit

class TextView: UITextView {
    
    private let placeholderLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray4
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    init() {
        super.init(frame: .zero, textContainer: nil)
        self.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func placeholder(text: String) {
        placeholderLabel.text = text
        self.addSubview(placeholderLabel)
        placeholderLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.trailing.equalToSuperview()
        }
    }
}

extension TextView: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        placeholderLabel.alpha = 0.0
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.isEmpty {
            placeholderLabel.alpha = 1.0
        } else {
            placeholderLabel.alpha = 0.0
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            placeholderLabel.alpha = 1.0
        } else {
            placeholderLabel.alpha = 0.0
        }
    }
}
