//
//  StarWarsSenseTests.swift
//  StarWarsSenseTests
//
//  Created by Olivier Conan on 10/01/2021.
//  Copyright © 2021 OlivierConan. All rights reserved.
//

import XCTest

import XCTest
@testable import StarWarsSense

class MockURLSessionDataTask: URLSessionDataTaskProtocol {

    private (set) var resumeWasCalled = false

    func resume() { resumeWasCalled = true }

}

class MockURLSession: URLSessionProtocol {

    typealias DataTaskResult = (Foundation.Data?, URLResponse?, Error?) -> Void
    var nextDataTask = MockURLSessionDataTask()
    var nextData: Foundation.Data?
    var nextError: Error?
    private (set) var lastURL: URL?
    private var mockResponse: HTTPURLResponse?

    init() {}
    init(mockResponse: HTTPURLResponse) {
        self.mockResponse = mockResponse
    }

    func successHttpURLResponse(request: URLRequest) -> URLResponse {
        return HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)!
    }

    func wrongHttpURLResponse(request: URLRequest, statusCode:Int) -> URLResponse {
        return HTTPURLResponse(url: request.url!, statusCode: statusCode, httpVersion: "HTTP/1.1", headerFields: nil)!
    }

    func dataTask(with request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol {
        lastURL = request.url
        nextDataTask.resume()
        if let mockResponse = mockResponse {
            completionHandler(nextData, mockResponse, nextError)
        } else {
            completionHandler(nextData, successHttpURLResponse(request: request), nextError)
        }
        return nextDataTask
    }

}

class StarWarsSenseTests: XCTestCase {

    func testAPIHandler() throws {
        let dataTask = MockURLSessionDataTask()
        let session = MockURLSession()
        session.nextDataTask = dataTask

        let handler = APIHandler(session: session)
        handler.get(endpoint: .people) { response in
        }

        XCTAssert(dataTask.resumeWasCalled)
    }

    func testPerformanceExample() throws {
        measure {
            let dataTask = MockURLSessionDataTask()
            let session = MockURLSession()
            session.nextDataTask = dataTask

            let handler = APIHandler(session: session)
            handler.get(endpoint: .people) { response in
            }

            XCTAssert(dataTask.resumeWasCalled)
        }
    }

}
