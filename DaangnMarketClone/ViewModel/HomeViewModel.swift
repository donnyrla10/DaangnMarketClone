//
//  HomeViewModel.swift
//  DaangnMarketClone
//
//  Created by 김영선 on 2023/03/23.
//

import Foundation

class HomeViewModel { //NSObject -> init 사용하려고 상속받은 듯?
    //더미리스트
    var itemList : [HomeModel] = []
    
    init() {
        getItem()
    }
    
    //리스트 가져오기
    func getItem() {
        guard let path = Bundle.main.path(forResource: "HomeDummyData", ofType: "json") else { return }
        guard let jsonString = try? String(contentsOfFile: path) else { return }
        let decoder = JSONDecoder()
        let data = jsonString.data(using: .utf8)
        guard let data = data,
              let items = try? decoder.decode([HomeModel].self, from: data) else { return }
        self.itemList = items
    }
}
