//
//  ContentView.swift
//  Pokemon
//
//  Created by Jonathan Yee on 2/9/23.
//

import SwiftUI

struct ContentView: View {
    let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    let data = (1...100).map { "Item \($0)" }

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(data, id: \.self) { item in
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.yellow)
                            .frame(height: 150)
                        VStack {
                            Image(systemName: "safari")
                            Text(item)
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
