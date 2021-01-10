//
//  SpeciesHandler.swift
//  StarWarsSense
//
//  Created by Olivier Conan on 10/01/2021.
//  Copyright © 2021 OlivierConan. All rights reserved.
//

import Foundation

/// Formatted to be secondary handler for now, fetching only detail for 1 specie
final class SpeciesHandler {

    // MARK: - Singleton
    static let shared = SpeciesHandler()

    func getSpecie(url: String, completion: @escaping (Specie?, Error?) -> Void) {
        APIHandler.shared.get(endpoint: .other(url)) { response in
            if let error = response.error {
                completion(nil, error)
            }
            if let data = response.data, let decodedResponse = try? JSONDecoder().decode(Specie.self, from: data) {
                completion(decodedResponse, nil)
                return
            }
        }
    }

}
