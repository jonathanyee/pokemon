//
//  NetworkService.swift
//  Pokemon
//
//  Created by Jonathan Yee on 2/11/23.
//

import Foundation

class NetworkService {
    private let jsonDecoder = JSONDecoder()

    //https://pokeapi.co/api/v2/pokemon?offset=20
    private lazy var components: URLComponents = {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "pokeapi.co"
        components.path = "/api/v2/"
        return components
    }()

    func listOfPokemon(limit: Int = 20, offset: Int = 0) async -> Result<Pagination, RequestError> {
        var urlComponents = components
        urlComponents.path.append("pokemon")
        urlComponents.queryItems?.append(URLQueryItem(name: "limit", value: String(limit)))
        urlComponents.queryItems?.append(URLQueryItem(name: "offset", value: String(offset)))

        if let url = urlComponents.url {
            print(url)
            return await request(url: url, model: Pagination.self)
        } else {
            return .failure(.invalidURL)
        }
    }

    private func request<T>(url: URL, model: T.Type) async -> Result<T, RequestError> where T: Decodable {
        let request = URLRequest(url: url)
        do {
            let (data, _) = try await URLSession.shared.data(for: request)

            do {
                let decoded = try jsonDecoder.decode(model, from: data)
                return .success(decoded)
            } catch {
                return .failure(.decode(error))
            }
        } catch {
            return .failure(.unknown(error))
        }
    }
}
