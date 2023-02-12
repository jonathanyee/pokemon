//
//  PokemonGridItemView.swift
//  Pokemon
//
//  Created by Jonathan Yee on 2/11/23.
//

import SwiftUI

struct PokemonGridItemView: View {
    @StateObject private var viewModel: PokemonGridItemViewModel

    init(viewModel: PokemonGridItemViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ZStack {
            if let detail = viewModel.detail {
                RoundedRectangle(cornerRadius: 25)
                    .fill(detail.background().opacity(0.5))
                    .frame(height: 250)
                VStack {
                    AsyncImage(url: URL(string: detail.sprites.frontDefault))
                    Text("ID: \(detail.id)")
                    Text(detail.name)
                    Text(detail.typesForDisplay())
                }
            }
        }.onAppear {
            viewModel.load()
        }
    }
}

