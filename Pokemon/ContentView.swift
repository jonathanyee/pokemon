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

    private let pokedex: Pokedex
    private let networkService: NetworkService
    private var viewModel: ContentViewModel

    init() {
        pokedex = Pokedex()
        networkService = NetworkService()
        viewModel = ContentViewModel(networkService: networkService)
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(viewModel.listOfPokemon, id: \.self) { pokemon in
                        if let id = pokemon.id {
                            NavigationLink(destination: {
                                PokemonDetailView(pokedex: pokedex, id: id)
                            }, label: {
                                PokemonGridItemView(
                                    viewModel: .init(
                                        pokedex: pokedex,
                                        networkService: networkService,
                                        id: id
                                    )
                                )
                            })
                        }
                    }
                }
                .padding()
            }
//            .navigationDestination(for: PokemonDetail.self) { detail in
//                PokemonDetailView(pokemon: detail)
//            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
