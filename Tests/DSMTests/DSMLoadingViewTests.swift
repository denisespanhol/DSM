//
//  DSMLoadingViewTests.swift
//  DSM
//
//  Created by Denis Guilherme Ferreira Espanhol on 23/07/26.
//

import XCTest
@testable import DSM

@MainActor
final class DSMLoadingViewTests: XCTestCase {

    func testCanBeInitialized() {
        let view = DSMLoadingView()
        XCTAssertNotNil(view)
    }
}
