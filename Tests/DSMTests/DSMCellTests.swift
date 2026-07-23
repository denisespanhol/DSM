//
//  DSMCellTests.swift
//  DSM
//
//  Created by Denis Guilherme Ferreira Espanhol on 23/07/26.
//

import XCTest
@testable import DSM

@MainActor
final class DSMCellTests: XCTestCase {

    func testTitleIsStoredCorrectly() {
        let cell = DSMCell(title: "Rick Sanchez", subtitle: "Alive")
        XCTAssertEqual(cell.title, "Rick Sanchez")
    }

    func testSubtitleIsStoredCorrectly() {
        let cell = DSMCell(title: "Rick Sanchez", subtitle: "Alive")
        XCTAssertEqual(cell.subtitle, "Alive")
    }

    func testImageURLIsNilByDefault() {
        let cell = DSMCell(title: "Rick Sanchez", subtitle: "Alive")
        XCTAssertNil(cell.imageURL)
    }

    func testImageURLIsStoredCorrectly() {
        let url = URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")
        let cell = DSMCell(title: "Rick Sanchez", subtitle: "Alive", imageURL: url)
        XCTAssertEqual(cell.imageURL, url)
    }

    func testImageURLWithInvalidURLRemainsNil() {
        let url = URL(string: "")
        let cell = DSMCell(title: "Rick Sanchez", subtitle: "Alive", imageURL: url)
        XCTAssertNil(cell.imageURL)
    }
}
