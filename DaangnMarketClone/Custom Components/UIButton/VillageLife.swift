//
//  VillageLife.swift
//  DaangnMarketClone
//
//  Created by min on 2023/03/21.
//

import Foundation

/*
 "title": "타이틀1",
 "image": "",Xz
 "location": "미아동",
 "time": "10분 전",
 "category": "질문",
 "comment": 1,
 "participants": 0,
 "favorite": 5
 */


struct VillageLife: Codable {
    let title: String?
    let image: String?
    let location: String?
    let time: String?
    let category: String?
    let comment: Int?
    let participants: Int?
    let favorite: Int?
    
    enum CodingKeys : String, CodingKey {
        case title
        case image
        case location
        case time
        case category
        case comment
        case participants
        case favorite
    }
}
