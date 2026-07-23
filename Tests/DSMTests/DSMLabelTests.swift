//
//  DSMLabelTests.swift
//  DSM
//
//  Created by Denis Guilherme Ferreira Espanhol on 23/07/26.
//

import XCTest
@testable import DSM

@MainActor
final class DSMLabelTests: XCTestCase {
    
    func testTextIsStoredCorrectly() {
        let label = DSMLabel(text: "Olá, mundo!")
        XCTAssertEqual(label.text, "Olá, mundo!")
    }
    
    func testDefaultVariantIsBody() {
        let label = DSMLabel(text: "Texto")
        XCTAssertEqual(label.variant, .body)
    }

    func testTitleVariantIsStored() {
        let label = DSMLabel(text: "Título", variant: .title)
        XCTAssertEqual(label.variant, .title)
    }

    func testBodyVariantIsStored() {
        let label = DSMLabel(text: "Corpo", variant: .body)
        XCTAssertEqual(label.variant, .body)
    }

    func testCaptionVariantIsStored() {
        let label = DSMLabel(text: "Legenda", variant: .caption)
        XCTAssertEqual(label.variant, .caption)
    }
    
    func testAllVariantsAreDifferent() {
        XCTAssertNotEqual(DSMLabelVariant.title, DSMLabelVariant.body)
        XCTAssertNotEqual(DSMLabelVariant.body, DSMLabelVariant.caption)
        XCTAssertNotEqual(DSMLabelVariant.title, DSMLabelVariant.caption)
    }
}
