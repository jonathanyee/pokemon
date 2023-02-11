//
//  PokemonDetail.swift
//  Pokemon
//
//  Created by Jonathan Yee on 2/11/23.
//

import Foundation

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
}
