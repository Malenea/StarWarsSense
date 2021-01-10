//
//  PeopleHandler.swift
//  StarWarsSense
//
//  Created by Olivier Conan on 09/01/2021.
//  Copyright © 2021 OlivierConan. All rights reserved.
//

import Foundation

protocol PeopleProtocol {

    func getPeople(completion: @escaping (People?, Error?) -> Void)
    func getCharacter(url: String, completion: @escaping (Character?, Error?) -> Void)
    func getPage(pageURL: String, completion: @escaping (People?, Error?) -> Void)

}

class PeopleHandler: PeopleProtocol {

    // MARK: - Singleton
    static let shared = PeopleHandler()

    func getPeople(completion: @escaping (People?, Error?) -> Void) {
        APIHandler.shared.get(endpoint: .people) { response in
            if let error = response.error {
                completion(nil, error)
            }
            if let data = response.data, let decodedResponse = try? JSONDecoder().decode(People.self, from: data) {
                completion(decodedResponse, nil)
                return
            }
        }
    }

    func getCharacter(url: String, completion: @escaping (Character?, Error?) -> Void) {
        APIHandler.shared.get(endpoint: .other(url)) { response in
            if let error = response.error {
                completion(nil, error)
            }
            if let data = response.data, let decodedResponse = try? JSONDecoder().decode(Character.self, from: data) {
                completion(decodedResponse, nil)
                return
            }
        }
    }

    func getPage(pageURL: String, completion: @escaping (People?, Error?) -> Void) {
        APIHandler.shared.get(endpoint: .other(pageURL)) { response in
            if let error = response.error {
                completion(nil, error)
            }
            if let data = response.data, let decodedResponse = try? JSONDecoder().decode(People.self, from: data) {
                completion(decodedResponse, nil)
                return
            }
        }
    }

}
