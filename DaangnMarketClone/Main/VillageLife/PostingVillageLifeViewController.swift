//
//  PostingVillageLifeViewController.swift
//  DaangnMarketClone
//
//  Created by milli on 2023/03/31.
//

import UIKit

class PostingVillageLifeViewController: BaseUIViewController {

    private lazy var navigationBar: UINavigationBar = {
        let navigationBar = UINavigationBar()
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.barTintColor = .white
        return navigationBar
    }()
    
    private let titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "제목"
        textField.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return textField
    }()
    
    private let contentTextView: TextView = {
        let textView = TextView()
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.placeholder(text: "미아동 관련된 질문이나 이야기를 해보세요.")
        return textView
    }()
    
    @objc func tapCancelButton() {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    @objc func tapDoneButton() {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    @objc func selectSummaryButton() {
        openSummaryBottomSheet()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "동네생활 글쓰기"
        setNavigationBar()
        setUI()
        
        /// 딜레이를 좀 준 뒤 주제 선택 바텀시트 띄우기
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
            openSummaryBottomSheet()
        }
    }
    
    private func openSummaryBottomSheet() {
        let postingSummaryListView = PostingSummaryListView()
        let bottomSheetView = BottomSheetView(contentView: postingSummaryListView, viewHeight: UIScreen.height - 300)
        bottomSheetView.presentBottomSheetView()
    }
    
    private func setNavigationBar() {
        self.view.addSubview(navigationBar)
        navigationBar.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        let navigationItem = UINavigationItem(title: "동네생활 글쓰기")
        let cancelButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(tapCancelButton))
        let doneButton = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(tapDoneButton))
        cancelButton.tintColor = .black
        doneButton.tintColor = .orange
        navigationItem.leftBarButtonItem = cancelButton
        navigationItem.rightBarButtonItem = doneButton
        navigationBar.setItems([navigationItem], animated: true)
    }
    
    private func setUI() {
        let summaryButton = UIButton()
        self.view.addSubview(summaryButton)
        summaryButton.addTarget(self, action: #selector(selectSummaryButton), for: .touchUpInside)
        summaryButton.snp.makeConstraints {
            $0.height.equalTo(48)
            $0.top.equalTo(navigationBar.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        
        let summaryTitle = UILabel()
        summaryTitle.text = "게시글의 주제를 선택해 주세요."
        summaryTitle.font = UIFont.systemFont(ofSize: 15)
        summaryButton.addSubview(summaryTitle)
        summaryTitle.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
        }
        
        let divideView = UIView()
        divideView.backgroundColor = .systemGray5
        self.view.addSubview(divideView)
        divideView.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.top.equalTo(summaryButton.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        self.view.addSubview(titleTextField)
        self.view.addSubview(contentTextView)
        
        titleTextField.snp.makeConstraints {
            $0.top.equalTo(divideView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        contentTextView.snp.makeConstraints {
            $0.top.equalTo(titleTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview()
        }
    }

}
