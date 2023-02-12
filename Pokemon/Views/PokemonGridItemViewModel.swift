//
//  PokemonGridItemViewModel.swift
//  Pokemon
//
//  Created by Jonathan Yee on 2/11/23.
//

import Foundation
import SwiftUI

class PokemonGridItemViewModel: ObservableObject {
    private let pokedex: Pokedex
    private let networkService: NetworkService
    private let id: Int

    private var task: Task<Void, Never>?

    @Published var detail: PokemonDetail?

    init(pokedex: Pokedex, networkService: NetworkService, id: Int) {
        self.pokedex = pokedex
        self.networkService = networkService
        self.id = id
    }

    func load() {
        if let detail = pokedex.cache[id] {
            self.detail = detail
        } else {
            task = Task {
                let result = await networkService.pokemon(by: id)
                switch result {
                    case .success(let detail):
                        Task { @MainActor [weak self] in
                            self?.detail = detail
                            self?.pokedex.cache[id] = detail
                        }
                    case .failure(let error):
                        print(error)
                }
            }
        }
    }

    func cancel() {
        task?.cancel()
    }
}
