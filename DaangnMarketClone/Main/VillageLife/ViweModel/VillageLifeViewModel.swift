//
//  VillageLifeViewModel.swift
//  DaangnMarketClone
//
//  Created by min on 2023/03/26.
//

import Foundation

class VillageLifeViewModel {
    
    var items: [VillageLife] = []
    
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
}
