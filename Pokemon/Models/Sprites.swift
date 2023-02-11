//
//  Sprites.swift
//  Pokemon
//
//  Created by Jonathan Yee on 2/11/23.
//

import Foundation

class Sprites: Codable {
    let backDefault: String
    let frontDefault: String

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case frontDefault = "front_default"
    }
}
