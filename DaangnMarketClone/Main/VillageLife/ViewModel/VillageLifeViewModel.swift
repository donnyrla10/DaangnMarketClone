//
//  VillageLifeViewModel.swift
//  DaangnMarketClone
//
//  Created by min on 2023/03/31.
//

import Foundation

class VillageLifeViewModel {
    
    var items: [VillageLife] = []
    var reloadTableView: (() -> Void)?
    
    init() {
        getItems()
    }
    
    func getItems() {
        
        guard let path = Bundle.main.path(forResource: "VillageLifeDummyData", ofType: "json") else { return }
        guard let jsonString = try? String(contentsOfFile: path) else { return }
        
        print(jsonString)
        
        let decoder = JSONDecoder()
        let data = jsonString.data(using: .utf8)
        guard let data = data,
              let items = try? decoder.decode([VillageLife].self, from: data) else { return }
        
        print(items)
        
        self.items = items
    }
    
    /// 글 저장
    func saveItem(contents: VillageLife) {
        /// 받은 값 저장하기
        items.append(contents)
        
        print("items \(items)")
        
        // TODO: 테이블뷰를 리프레시 시켜주려면 어떻게 해야할까  ..?
        updateDataSource()
    }
    
    func updateDataSource() {
        self.reloadTableView?()
    }
}
