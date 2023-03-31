//
//  VillageLife.swift
//  DaangnMarketClone
//
//  Created by min on 2023/03/31.
//

import Foundation

/*
 "title": "타이틀1",
 "image": "",
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
    
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        title = (try? values.decode(String.self, forKey: .title)) ?? ""
//        image = (try? values.decode(String.self, forKey: .image)) ?? ""
//        location = (try? values.decode(String.self, forKey: .location)) ?? ""
//        time = (try? values.decode(String.self, forKey: .time)) ?? ""
//        category = (try? values.decode(String.self, forKey: .category)) ?? ""
//        comment = (try? values.decode(Int.self, forKey: .comment)) ?? 0
//        participants = (try? values.decode(Int.self, forKey: .participants)) ?? 0
//        favorite = (try? values.decode(Int.self, forKey: .favorite)) ?? 0
//    }
}
