//
//  Stat.swift
//  Pokemon
//
//  Created by Jonathan Yee on 2/11/23.
//

import Foundation

struct Stat: Codable {
    let baseStat: Int
    let effort: Int
    let stat: Species

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort
        case stat
    }
}
