//
//  Pokedex.swift
//  Pokemon
//
//  Created by Jonathan Yee on 2/11/23.
//

import Foundation
import SwiftUI

struct Pokedex {
    let cache = [Int: PokemonDetail]()
}

struct PokedexKey: EnvironmentKey {
    static let defaultValue = Pokedex()
}

extension EnvironmentValues {
    var pokedex: Pokedex {
        get { self[PokedexKey.self] }
        set { self[PokedexKey.self] = newValue }
    }
}
