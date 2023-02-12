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
    @ObservedObject var viewModel: ContentViewModel

    init() {
        pokedex = Pokedex()
        networkService = NetworkService()
        viewModel = ContentViewModel(networkService: networkService, pokedex: pokedex)
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    if viewModel.text.isEmpty == false {
                        ForEach(viewModel.searchResults, id: \.self) { pokemon in
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
                                    .onAppear {
                                        viewModel.loadNextPage(id: id)
                                    }
                                })
                            }
                        }
                    } else {
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
                                    .onAppear {
                                        viewModel.loadNextPage(id: id)
                                    }
                                })
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .searchable(text: $viewModel.text, placement: .navigationBarDrawer(displayMode: .always), prompt: "Filter by type")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
