//
//  ContentView.swift
//  Pokemon
//
//  Created by Jonathan Yee on 2/9/23.
//

import SwiftUI

struct ContentView: View {
    private let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]

    @Environment(\.pokedex) var pokdex: Pokedex
    private let networkService: NetworkService
    private var viewModel: ContentViewModel

    init() {
        networkService = NetworkService()
        viewModel = ContentViewModel(networkService: networkService)
    }

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(viewModel.listOfPokemon, id: \.self) { pokemon in
                    if let id = pokemon.id {
                        PokemonGridItemView(
                            viewModel: .init(
                                pokedex: pokdex,
                                networkService: networkService,
                                id: id
                            )
                        )
                    }
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
