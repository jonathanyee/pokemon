//
//  Pagination.swift
//  Pokemon
//
//  Created by Jonathan Yee on 2/11/23.
//

import Foundation

struct Pagination: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Pokemon]
}
