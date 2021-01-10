//
//  PlanetHandler.swift
//  StarWarsSense
//
//  Created by Olivier Conan on 09/01/2021.
//  Copyright © 2021 OlivierConan. All rights reserved.
//

import Foundation

protocol PlanetsProtocol {

    func getPlanets(completion: @escaping (Planets?, Error?) -> Void)
    func getPlanet(url: String, completion: @escaping (Planet?, Error?) -> Void)
    func getPage(pageURL: String, completion: @escaping (Planets?, Error?) -> Void)

}

class PlanetsHandler: PlanetsProtocol {

    // MARK: - Singleton
    static let shared = PlanetsHandler()

    func getPlanets(completion: @escaping (Planets?, Error?) -> Void) {
        APIHandler.shared.get(endpoint: .planets) { response in
            if let error = response.error {
                completion(nil, error)
            }
            if let data = response.data, let decodedResponse = try? JSONDecoder().decode(Planets.self, from: data) {
                completion(decodedResponse, nil)
                return
            }
        }
    }

    func getPlanet(url: String, completion: @escaping (Planet?, Error?) -> Void) {
        APIHandler.shared.get(endpoint: .other(url)) { response in
            if let error = response.error {
                completion(nil, error)
            }
            if let data = response.data, let decodedResponse = try? JSONDecoder().decode(Planet.self, from: data) {
                completion(decodedResponse, nil)
                return
            }
        }
    }

    func getPage(pageURL: String, completion: @escaping (Planets?, Error?) -> Void) {
        APIHandler.shared.get(endpoint: .other(pageURL)) { response in
            if let error = response.error {
                completion(nil, error)
            }
            if let data = response.data, let decodedResponse = try? JSONDecoder().decode(Planets.self, from: data) {
                completion(decodedResponse, nil)
                return
            }
        }
    }

}
