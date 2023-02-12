//
//  PokemonDetail.swift
//  Pokemon
//
//  Created by Jonathan Yee on 2/11/23.
//

import Foundation
import SwiftUI

struct PokemonDetail: Codable {
    let height: Int
    let id: Int
    let name: String
    let species: Species
    let sprites: Sprites
    let stats: [Stat]
    let types: [TypeElement]
    let weight: Int

    enum CodingKeys: String, CodingKey {
        case height
        case id
        case name
        case species
        case sprites
        case stats
        case types
        case weight
    }

    func background() -> Color {
        if let type = types.first {
            switch type.type.name {
                case "grass":
                    return .green
                case "fire":
                    return .red
                case "water":
                    return .blue
                case "electric":
                    return .yellow
                case "poison":
                    return .purple
                default:
                    return .gray
            }
        }
        return .gray
    }

    func typesForDisplay() -> String {
        var result = [String]()
        for type in types {
            result.append(type.type.name)
        }
        return result.joined(separator: ",")
    }
}
