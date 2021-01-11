//
//  StarWarsSenseUITests.swift
//  StarWarsSenseUITests
//
//  Created by Olivier Conan on 10/01/2021.
//  Copyright © 2021 OlivierConan. All rights reserved.
//

import XCTest

class StarWarsSenseUITests: XCTestCase {

    func testSimpleFlow() throws {
        let app = XCUIApplication()
        app.launch()

        let tabBar = XCUIApplication().tabBars["Tab Bar"]
        tabBar.buttons["Planets"].tap()
        tabBar.buttons["Vehicles"].tap()
        tabBar.buttons["Peoples"].tap()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
