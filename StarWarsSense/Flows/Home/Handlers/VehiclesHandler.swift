//
//  VehiclesHandler.swift
//  StarWarsSense
//
//  Created by Olivier Conan on 09/01/2021.
//  Copyright © 2021 OlivierConan. All rights reserved.
//

import Foundation

protocol VehiclesProtocol {

    func getVehicles(completion: @escaping (Vehicles?, Error?) -> Void)
    func getVehicle(url: String, completion: @escaping (Vehicle?, Error?) -> Void)
    func getPage(pageURL: String, completion: @escaping (Vehicles?, Error?) -> Void)

}

class VehiclesHandler: VehiclesProtocol {

    // MARK: - Singleton
    static let shared = VehiclesHandler()

    func getVehicles(completion: @escaping (Vehicles?, Error?) -> Void) {
        APIHandler.shared.get(endpoint: .vehicles) { response in
            if let error = response.error {
                completion(nil, error)
            }
            if let data = response.data, let decodedResponse = try? JSONDecoder().decode(Vehicles.self, from: data) {
                completion(decodedResponse, nil)
                return
            }
        }
    }

    func getVehicle(url: String, completion: @escaping (Vehicle?, Error?) -> Void) {
        APIHandler.shared.get(endpoint: .other(url)) { response in
            if let error = response.error {
                completion(nil, error)
            }
            if let data = response.data, let decodedResponse = try? JSONDecoder().decode(Vehicle.self, from: data) {
                completion(decodedResponse, nil)
                return
            }
        }
    }

    func getPage(pageURL: String, completion: @escaping (Vehicles?, Error?) -> Void) {
        APIHandler.shared.get(endpoint: .other(pageURL)) { response in
            if let error = response.error {
                completion(nil, error)
            }
            if let data = response.data, let decodedResponse = try? JSONDecoder().decode(Vehicles.self, from: data) {
                completion(decodedResponse, nil)
                return
            }
        }
    }

}
