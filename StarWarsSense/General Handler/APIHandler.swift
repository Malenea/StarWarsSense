//
//  APIHandler.swift
//  StarWarsSense
//
//  Created by Olivier Conan on 09/01/2021.
//  Copyright © 2021 OlivierConan. All rights reserved.
//

import Foundation

// MARK: Endpoint definitions
public enum Endpoint {
    case people
    case planets
    case vehicles
    case other(String)
}

extension Endpoint {
    /// https://swapi.dev/api/ certificate got deprecated during the test, so had to switch to another url using the same API
    var urlString: String {
        switch self {
            case .people:
//                return "https://swapi.dev/api/people/"
                return "https://swapi.py4e.com/api/people/"
            case .planets:
//                return "https://swapi.dev/api/planets/"
                return "https://swapi.py4e.com/api/planets/"
            case .vehicles:
//                return "https://swapi.dev/api/vehicles/"
                return "https://swapi.py4e.com/api/vehicles/"
            case .other(let urlString):
                return urlString
        }
    }
}

// MARK: - APIResponse struct
struct APIResponse {
    var data: Foundation.Data?
    var response: URLResponse?
    var error: Error?
}

// MARK: - URL session protocol
protocol URLSessionDataTaskProtocol { func resume() }
protocol URLSessionProtocol { typealias DataTaskResult = (Foundation.Data?, URLResponse?, Error?) -> Void

    func dataTask(with request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol

}

extension URLSessionDataTask: URLSessionDataTaskProtocol {}
extension URLSession: URLSessionProtocol {

    func dataTask(with request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol {
        let task: URLSessionDataTask = dataTask(with: request, completionHandler: completionHandler) as URLSessionDataTask
        return task
    }

}

// MARK: - API handler
class APIHandler {

    // MARK: - Singleton
    static let shared = APIHandler(session: URLSession.shared)

    private let session: URLSessionProtocol
    init(session: URLSessionProtocol) {
        self.session = session
    }

    func get(endpoint: Endpoint, completion: ((APIResponse) -> Void)? = nil) {
        guard let url = URL(string: endpoint.urlString) else { return }
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "GET"
        session.dataTask(with: request as URLRequest) { data, response, error in
            completion?(APIResponse(data: data, response: response, error: error))
        }.resume()
    }

}
