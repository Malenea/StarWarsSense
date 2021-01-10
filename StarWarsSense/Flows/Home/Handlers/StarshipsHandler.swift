//
//  StarshipsHandler.swift
//  StarWarsSense
//
//  Created by Olivier Conan on 10/01/2021.
//  Copyright © 2021 OlivierConan. All rights reserved.
//

import Foundation

/// Formatted to be secondary handler for now, fetching only detail for 1 starship
final class StarshipsHandler {

    // MARK: - Singleton
    static let shared = StarshipsHandler()

    func getStarship(url: String, completion: @escaping (Starship?, Error?) -> Void) {
        APIHandler.shared.get(endpoint: .other(url)) { response in
            if let error = response.error {
                completion(nil, error)
            }
            if let data = response.data, let decodedResponse = try? JSONDecoder().decode(Starship.self, from: data) {
                completion(decodedResponse, nil)
                return
            }
        }
    }

}
