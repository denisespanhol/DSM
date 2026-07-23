//
//  DSMErrorViewTests.swift
//  DSM
//
//  Created by Denis Guilherme Ferreira Espanhol on 23/07/26.
//

import XCTest
@testable import DSM

final class DSMErrorViewTests: XCTestCase {
    
    func testMessageIsStoredCorrectly() {
        let viewModel = DSMErrorViewModel(
            message: "Erro de conexão",
            onRetry: {}
        )

        XCTAssertEqual(viewModel.message, "Erro de conexão")
    }
    
    func testIsRetryingIsFalseByDefault() {
        let viewModel = DSMErrorViewModel(message: "Erro", onRetry: {})

        XCTAssertFalse(viewModel.isRetrying)
    }
    
    func testRetryCallsOnRetryAction() {
        var retryCalled = false
        let viewModel = DSMErrorViewModel(
            message: "Erro",
            onRetry: { retryCalled = true }
        )

        viewModel.retry()

        XCTAssertTrue(retryCalled, "onRetry deve ser chamado ao chamar retry()")
    }

    func testRetrySetIsRetryingToTrue() {
        let viewModel = DSMErrorViewModel(message: "Erro", onRetry: {})

        viewModel.retry()

        XCTAssertTrue(viewModel.isRetrying, "isRetrying deve ser true após chamar retry()")
    }

    func testRetryDoesNotCallActionWhenAlreadyRetrying() {
        var callCount = 0
        let viewModel = DSMErrorViewModel(
            message: "Erro",
            onRetry: { callCount += 1 }
        )

        viewModel.retry()
        viewModel.retry() // segundo toque enquanto já está retrying
        viewModel.retry() // terceiro toque

        XCTAssertEqual(callCount, 1, "onRetry deve ser chamado apenas uma vez mesmo com múltiplos toques")
    }
    
    func testResetRetryStateSetsIsRetryingToFalse() {
        let viewModel = DSMErrorViewModel(message: "Erro", onRetry: {})
        viewModel.retry() // coloca em isRetrying = true

        viewModel.resetRetryState()

        XCTAssertFalse(viewModel.isRetrying, "isRetrying deve voltar para false após reset")
    }

    func testRetryCanBeCalledAgainAfterReset() {
        var callCount = 0
        let viewModel = DSMErrorViewModel(
            message: "Erro",
            onRetry: { callCount += 1 }
        )

        viewModel.retry()
        viewModel.resetRetryState()
        viewModel.retry()

        XCTAssertEqual(callCount, 2, "onRetry deve ser chamado novamente após resetRetryState()")
    }
    
}
