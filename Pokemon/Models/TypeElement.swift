//
//  TypeElement.swift
//  Pokemon
//
//  Created by Jonathan Yee on 2/11/23.
//

import Foundation

struct TypeElement: Codable, Hashable, Equatable {
    static func == (lhs: TypeElement, rhs: TypeElement) -> Bool {
        lhs.slot == rhs.slot &&
        lhs.type == rhs.type
    }

    let slot: Int
    let type: Species

    func hash(into hasher: inout Hasher) {
        hasher.combine(type)
    }
}
