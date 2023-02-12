//
//  Pokemon.swift
//  Pokemon
//
//  Created by Jonathan Yee on 2/11/23.
//

import Foundation

struct Pokemon: Codable, Hashable {
    let name: String
    let url: String

    var id: Int? {
        if let url = URL(string: url) {
            return Int(url.lastPathComponent)
        } else {
            return nil
        }
    }
}
