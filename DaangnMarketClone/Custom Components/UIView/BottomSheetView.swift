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
        view.frame = .init(x: 0, y: UIScreen.height + 48, width: UIScreen.width, height: bottomSheetViewHeight)
        view.backgroundColor = .white
        return view
    }()
    
   var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = .init(x: 0, y: 0, width: UIScreen.width, height: UIScreen.height)
        scrollView.contentSize = .init(width: scrollView.frame.width, height: scrollView.frame.height)
        scrollView.backgroundColor = .blue
        return scrollView
    }()
    
    var bottomSheetViewHeight: CGFloat = UIScreen.height - 100
    
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

        
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(UIScreen.height + 48)
            make.height.equalTo(bottomSheetViewHeight)
            make.width.equalTo(UIScreen.width)
            make.bottom.equalToSuperview()
        }
    }
    
    func presentBottomSheetView() {
        if let viewController = UIApplication.shared.keyWindow?.visibleViewController as? UIViewController {
            viewController.view.addSubview(self)
            self.isHidden = false
            scrollView.setContentOffset(.init(x: 0, y: bottomSheetViewHeight), animated: true)
        }
    }
}
