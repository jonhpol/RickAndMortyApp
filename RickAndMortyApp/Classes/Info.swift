//
//  Info.swift
//  RickAndMortyApp
//
//  Created by João Paulo de Oliveira Sabino on 18/10/18.
//  Copyright © 2018 João Paulo de Oliveira Sabino. All rights reserved.
//

import Foundation

struct Info : Codable {
    
    let count : Int?
    let next : String?
    let pages : Int?
    let prev : String?
    
    enum CodingKeys: String, CodingKey {
        case count = "count"
        case next = "next"
        case pages = "pages"
        case prev = "prev"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        count = try values.decodeIfPresent(Int.self, forKey: .count)
        next = try values.decodeIfPresent(String.self, forKey: .next)
        pages = try values.decodeIfPresent(Int.self, forKey: .pages)
        prev = try values.decodeIfPresent(String.self, forKey: .prev)
    }
    
}

