//
//  PostingItemViewController.swift
//  DaangnMarketClone
//
//  Created by 김영선 on 2023/03/17.
//

import UIKit
import SwiftUI

//present modal sheet
//Scroll
class PostingItemViewController: UIViewController {
    lazy var navigationBar : UINavigationBar = {
        let navigationBar = UINavigationBar()
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.barTintColor = .white
        return navigationBar
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    var divider1: UIView = {
        let divider = UIView()
        divider.backgroundColor = .systemGray5
        return divider
    }()
    
    var divider2: UIView = {
        let divider = UIView()
        divider.backgroundColor = .systemGray5
        return divider
    }()
    
    var divider3: UIView = {
        let divider = UIView()
        divider.backgroundColor = .systemGray5
        return divider
    }()
    
    var divider4: UIView = {
        let divider = UIView()
        divider.backgroundColor = .systemGray5
        return divider
    }()
    
    var cameraButton: UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 1
        button.layer.borderColor = CGColor(gray: 0.8, alpha: 1)
        button.layer.cornerRadius = 4
        button.setImage(UIImage(systemName: "camera.fill"), for: .normal)
        button.setTitle("0/10", for: .normal)
        button.setTitleColor(.systemGray5, for: .normal)
        button.tintColor = .black
        return button
    }()
    
    var titleTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "글 제목"
        textfield.font = UIFont.systemFont(ofSize: 18)
        return textfield
    }()
    
    var priceTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "₩ 가격 (선택사항)"
        textfield.font = UIFont.systemFont(ofSize: 18)
        return textfield
    }()
    
    var postingTextView: UITextView = {
        let textview = UITextView()
        textview.text = "신림동에 올릴 게시글 내용을 작성해주세요.\n(판매 금지 물품은 게시가 제한될 수 있어요.)"
        textview.font = UIFont.systemFont(ofSize: 18)
        textview.textColor = .systemGray4
        return textview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setNavigationBar()
        setUI()
    }
    
    private func setNavigationBar() {
        self.view.addSubview(navigationBar)
        navigationBar.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        let navigationItem = UINavigationItem(title: "내 물건 팔기")
        let cancelButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(tapCancelButton))
        let doneButton = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(tapDoneButton))
        cancelButton.tintColor = .black
        doneButton.tintColor = .orange
        navigationItem.leftBarButtonItem = cancelButton
        navigationItem.rightBarButtonItem = doneButton
        navigationBar.setItems([navigationItem], animated: true)
    }
    
    @objc func tapCancelButton() {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    @objc func tapDoneButton() {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    private func setUI() {
        self.view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        [cameraButton, divider1, titleTextField, divider2, priceTextField, divider3, postingTextView, divider4].forEach {
            scrollView.addSubview($0)
        }
        
        cameraButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(12)
            $0.width.height.equalTo(80)
        }
        
        divider1.snp.makeConstraints {
            $0.top.equalTo(cameraButton.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(12)
            $0.width.equalTo(UIScreen.main.bounds.width - 24)
            $0.height.equalTo(1)
        }
        
        titleTextField.snp.makeConstraints {
            $0.top.equalTo(divider1.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().offset(12)
            $0.height.equalTo(24)
        }

        divider2.snp.makeConstraints {
            $0.top.equalTo(titleTextField.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(12)
            $0.width.equalTo(UIScreen.main.bounds.width - 24)
            $0.height.equalTo(1)
        }
        
        priceTextField.snp.makeConstraints {
            $0.top.equalTo(divider2.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().offset(12)
            $0.height.equalTo(24)
        }

        divider3.snp.makeConstraints {
            $0.top.equalTo(priceTextField.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(12)
            $0.width.equalTo(UIScreen.main.bounds.width - 24)
            $0.height.equalTo(1)
        }
        
        postingTextView.snp.makeConstraints {
            $0.top.equalTo(divider3.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().offset(12)
            $0.width.equalTo(UIScreen.main.bounds.width - 24)
            $0.height.equalTo(70)
        }
        
        divider4.snp.makeConstraints {
            $0.top.equalTo(postingTextView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(12)
            $0.width.equalTo(UIScreen.main.bounds.width - 24)
            $0.height.equalTo(1)
        }
    }
}

//Previews ===============================================================
struct PostingItemViewController_Previews: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
    }
    
    struct Container: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
            let postingItemViewController = PostingItemViewController()
            return UINavigationController(rootViewController: postingItemViewController)
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
        typealias UIViewControllerType = UIViewController
    }
}
