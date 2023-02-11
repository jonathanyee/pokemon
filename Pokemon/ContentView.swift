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

    private var viewModel = ContentViewModel(networkService: NetworkService())

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(viewModel.listOfPokemon, id: \.self) { pokemon in
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.yellow)
                            .frame(height: 150)
                        VStack {
                            Image(systemName: "safari")
                            Text(pokemon.name)
                        }
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
