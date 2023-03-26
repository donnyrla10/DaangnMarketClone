//
//  HomeModel.swift
//  DaangnMarketClone
//
//  Created by 녕이 on 2023/03/23.
//

import Foundation

struct HomeModel: Codable {
    let title: String?
    let image: String?
    let location: String?
    let time: String?
    let price: Int?
    let favorite: Int?
    let chat: Int?
    
    enum CodingKeys: String, CodingKey {
        case title
        case image
        case location
        case time
        case price
        case favorite
        case chat
    }
}
