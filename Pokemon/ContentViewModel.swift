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

    @Published var listOfPokemon = [Pokemon]()

    init(networkService: NetworkService) {
        self.networkService = networkService

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
}
