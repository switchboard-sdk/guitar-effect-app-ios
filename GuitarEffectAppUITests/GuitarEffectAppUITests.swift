//
//  GuitarEffectAppUITests.swift
//  GuitarEffectAppUITests
//
//  Created by Balazs Kiss on 26/02/2024.
//

import XCTest

final class GuitarEffectAppUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func testAppLaunch() throws {
        let app = XCUIApplication()
        app.launch()
    }
}
