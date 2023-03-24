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
        textfield.font = UIFont.systemFont(ofSize: 20)
        return textfield
    }()
    
    var priceTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "₩ 가격 (선택사항)"
        textfield.font = UIFont.systemFont(ofSize: 20)
        return textfield
    }()
    
    var postingTextView: UITextView = {
        let textview = UITextView()
        textview.text = "신림동에 올릴 게시글 내용을 작성해주세요.\n(판매 금지 물품은 게시가 제한될 수 있어요.)"
        textview.font = UIFont.systemFont(ofSize: 20)
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
        [cameraButton, titleTextField, priceTextField, postingTextView].forEach {
            self.view.addSubview($0)
        }
        
        cameraButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(90)
            $0.leading.equalToSuperview().offset(24)
            $0.width.height.equalTo(80)
        }
        
        titleTextField.snp.makeConstraints {
            $0.top.equalTo(cameraButton.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().offset(24)
            $0.height.equalTo(24)
        }
        
        priceTextField.snp.makeConstraints {
            $0.top.equalTo(titleTextField.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().offset(24)
            $0.height.equalTo(24)
        }
        
        postingTextView.snp.makeConstraints {
            $0.top.equalTo(priceTextField.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().offset(24)
            $0.height.equalTo(100)
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
