//
//  BottomSheetView.swift
//  DaangnMarketClone
//
//  Created by minimani on 2023/03/09.
//

import UIKit

class BottomSheetView: UIView {
    
    lazy var containerView: UIView = {
       let view = UIView()
        view.frame = .init(x: 0, y: UIScreen.height + UIWindow.bottomPadding, width: UIScreen.width, height: bottomSheetViewHeight)
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        return view
    }()
    
   lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = .init(x: 0, y: 0, width: UIScreen.width, height: UIScreen.height)
        scrollView.contentSize = .init(width: scrollView.frame.width, height: scrollView.frame.height)
       scrollView.backgroundColor = .black.withAlphaComponent(0.3)
       scrollView.delegate = self
        return scrollView
    }()
    
    lazy var dismissButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(selectDismissButton), for: .touchUpInside)
        return button
    }()
    
    var bottomSheetViewHeight: CGFloat = UIScreen.height - 200 + UIWindow.bottomPadding
    lazy var maxContentOffsetY: CGFloat = bottomSheetViewHeight + UIWindow.bottomPadding
    
    @objc func selectDismissButton() {
        scrollView.setContentOffset(.init(x: 0, y: 0), animated: true)
    }
    
    init() {
        super.init(frame: .init(x: 0, y: 0, width: UIScreen.width, height: UIScreen.height))
        setUI()
        self.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
       
        self.addSubview(scrollView)
        scrollView.addSubview(containerView)
        scrollView.addSubview(dismissButton)

        dismissButton.snp.makeConstraints { make in
            make.left.right.equalTo(self)
            make.top.bottom.equalToSuperview()
        }
        
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(UIScreen.height + UIWindow.bottomPadding)
            make.height.equalTo(bottomSheetViewHeight)
            make.width.equalTo(UIScreen.width)
            make.bottom.equalToSuperview()
        }
    }
    
    func presentBottomSheetView() {
        self.addToTopViewController()
        self.isHidden = false
        scrollView.setContentOffset(.init(x: 0, y: maxContentOffsetY), animated: true)
    }
}

extension BottomSheetView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y <= 0 {
            self.isHidden = true
        } else {
            self.isHidden = false
        }
        
        if scrollView.contentOffset.y > maxContentOffsetY {
            scrollView.contentOffset.y = maxContentOffsetY
        }
    }
}
