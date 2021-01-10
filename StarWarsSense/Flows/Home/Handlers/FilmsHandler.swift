//
//  FilmsHandler.swift
//  StarWarsSense
//
//  Created by Olivier Conan on 10/01/2021.
//  Copyright © 2021 OlivierConan. All rights reserved.
//

import Foundation

/// Formatted to be secondary handler for now, fetching only detail for 1 film
final class FilmsHandler {

    // MARK: - Singleton
    static let shared = FilmsHandler()

    func getFilm(url: String, completion: @escaping (Film?, Error?) -> Void) {
        APIHandler.shared.get(endpoint: .other(url)) { response in
            if let error = response.error {
                completion(nil, error)
            }
            if let data = response.data, let decodedResponse = try? JSONDecoder().decode(Film.self, from: data) {
                completion(decodedResponse, nil)
                return
            }
        }
    }

}
