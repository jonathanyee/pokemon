//
//  PokemonDetailView.swift
//  Pokemon
//
//  Created by Jonathan Yee on 2/11/23.
//

import SwiftUI

struct PokemonDetailView: View {
    private let pokedex: Pokedex
    private let id: Int

    init(pokedex: Pokedex, id: Int) {
        self.pokedex = pokedex
        self.id = id
    }

    var body: some View {
        ScrollView {
            VStack {
                if let pokemon = pokedex.cache[id] {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(pokemon.background().opacity(0.5))
                        VStack(spacing: 0) {
                            AsyncImage(url: URL(string: pokemon.sprites.frontDefault))
                            Text(pokemon.name.capitalized)
                                .font(.largeTitle)
                                .padding([.top, .bottom], 20)
                        }
                        .frame(alignment: .center)
                    }

                    VStack {
                        HStack {
                            ForEach(pokemon.types, id: \.self) { type in
                                ZStack {
                                    RoundedRectangle(cornerRadius: 25)
                                        .fill(pokemon.color(from: type.type.name))

                                    Text(type.type.name)
                                        .padding()
                                }
                            }
                        }
                    }

                    HStack(spacing: 20) {
                        VStack {
                            Text("\(pokemon.height)m")
                                .font(.title)
                            Text("Height")
                                .font(.title3)
                                .foregroundColor(.gray)
                        }

                        VStack {
                            Text("\(pokemon.weight)kg")
                                .font(.title)
                            Text("Weight")
                                .font(.title3)
                                .foregroundColor(.gray)

                        }
                    }

                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(pokemon.stats, id: \.self) { stat in
                            Text("\(stat.stat.name): \(stat.baseStat)")
                                .frame(maxWidth: .infinity, alignment: .leading)

                        }
                    }
                }
            }
            .padding()
        }
    }
}
