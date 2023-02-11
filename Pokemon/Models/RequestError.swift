//
//  RequestError.swift
//  Pokemon
//
//  Created by Jonathan Yee on 2/11/23.
//

import Foundation

enum RequestError: Error {
    case decode(Error)
    case invalidURL
    case unknown(Error)
}
