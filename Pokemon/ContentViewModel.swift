//
//  ContentViewModel.swift
//  Pokemon
//
//  Created by Jonathan Yee on 2/11/23.
//

import Foundation
import SwiftUI

class ContentViewModel: ObservableObject {
    private let networkService: NetworkService

    private var listOfPokemon = [Pokemon]()
    private let pokedex: Pokedex
    @Published var text = ""

    init(networkService: NetworkService, pokedex: Pokedex) {
        self.networkService = networkService
        self.pokedex = pokedex

        Task { [weak self] in
            guard let self = self else { return }

            let result = await self.networkService.listOfPokemon()
            switch result {
                case .success(let pagination):
                    self.listOfPokemon = pagination.results
                case .failure(let error):
                    print(error)
            }
        }
    }

    var searchResults: [Pokemon] {
        if text.isEmpty {
            return listOfPokemon
        } else {
            let result = listOfPokemon.filter {
                if let id = $0.id,
                   let detail = pokedex.cache[id] {
                    return detail.types.contains(where: { type in
                        type.type.name.contains(text.lowercased())
                    })
                } else {
                    return false
                }
            }
            return result
        }
    }
}
