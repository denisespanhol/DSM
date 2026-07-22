//
//  DSMButtonTests.swift
//  DSM
//
//  Created by Denis Guilherme Ferreira Espanhol on 22/07/26.
//

import XCTest
@testable import DSM

final class DSMButtonTests: XCTestCase {
    
    func testInitStoresTitle() {
        let viewModel = DSMButtonViewModel(title: "Entrar", action: {})
        XCTAssertEqual(viewModel.title, "Entrar")
    }
    
    func testDefaultStyleIsPrimary() {
        let viewModel = DSMButtonViewModel(title: "Entrar", action: {})
        XCTAssertEqual(viewModel.style, .primary)
    }

    func testDefaultIsLoadingIsFalse() {
        let viewModel = DSMButtonViewModel(title: "Entrar", action: {})
        XCTAssertFalse(viewModel.isLoading)
    }

    func testSecondaryStyleIsStored() {
        let viewModel = DSMButtonViewModel(title: "Cancelar", style: .secondary, action: {})
        XCTAssertEqual(viewModel.style, .secondary)
    }
    
    func testActionIsCalledWhenNotLoading() {
        var actionCalled = false
        let viewModel = DSMButtonViewModel(title: "Entrar", isLoading: false, action: {
            actionCalled = true
        })
        
        viewModel.handleTap()
        
        XCTAssertTrue(actionCalled, "A action deve ser chamada quando isLoading é false")
    }
    
    func testActionIsNotCalledWhenLoading() {
        var actionCalled = false
        let viewModel = DSMButtonViewModel(title: "Entrar", isLoading: true, action: {
            actionCalled = true
        })

        viewModel.handleTap()

        XCTAssertFalse(actionCalled, "A action não deve ser chamada quando isLoading é true")
    }

    func testHandleTapCanBeCalledMultipleTimes() {
        var callCount = 0
        let viewModel = DSMButtonViewModel(title: "Entrar", isLoading: false, action: {
            callCount += 1
        })

        viewModel.handleTap()
        viewModel.handleTap()
        viewModel.handleTap()

        XCTAssertEqual(callCount, 3, "A action deve ser chamada a cada toque quando não está em loading")
    }

    func testLoadingBlocksAllSubsequentTaps() {
        var callCount = 0
        let viewModel = DSMButtonViewModel(title: "Entrar", isLoading: true, action: {
            callCount += 1
        })

        viewModel.handleTap()
        viewModel.handleTap()

        XCTAssertEqual(callCount, 0, "Nenhum toque deve passar enquanto isLoading é true")
    }
}
