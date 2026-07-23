//
//  DSMTextFieldTests.swift
//  DSM
//
//  Created by Denis Guilherme Ferreira Espanhol on 23/07/26.
//

import XCTest
@testable import DSM

final class DSMTextFieldTests: XCTestCase {

    func testHasErrorIsFalseWhenNoErrorMessage() {
        let viewModel = DSMTextFieldViewModel(placeholder: "Email")
        XCTAssertFalse(viewModel.hasError)
    }

    func testHasErrorIsTrueWhenErrorMessageExists() {
        let viewModel = DSMTextFieldViewModel(
            placeholder: "Email",
            errorMessage: "Email inválido"
        )
        XCTAssertTrue(viewModel.hasError)
    }

    func testErrorMessageCanBeSetDynamically() {
        let viewModel = DSMTextFieldViewModel(placeholder: "Email")
        XCTAssertFalse(viewModel.hasError)

        viewModel.errorMessage = "Campo obrigatório"

        XCTAssertTrue(viewModel.hasError)
        XCTAssertEqual(viewModel.errorMessage, "Campo obrigatório")
    }

    func testErrorMessageCanBeCleared() {
        let viewModel = DSMTextFieldViewModel(
            placeholder: "Email",
            errorMessage: "Email inválido"
        )

        viewModel.errorMessage = nil

        XCTAssertFalse(viewModel.hasError)
    }

    func testTextIsUpdated() {
        let viewModel = DSMTextFieldViewModel(placeholder: "Email")
        viewModel.text = "usuario@email.com"
        XCTAssertEqual(viewModel.text, "usuario@email.com")
    }

    func testIsSecureIsStoredCorrectly() {
        let secureViewModel = DSMTextFieldViewModel(placeholder: "Senha", isSecure: true)
        let normalViewModel = DSMTextFieldViewModel(placeholder: "Email", isSecure: false)

        XCTAssertTrue(secureViewModel.isSecure)
        XCTAssertFalse(normalViewModel.isSecure)
    }
}
