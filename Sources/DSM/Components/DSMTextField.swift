//
//  DSMTextField.swift
//  DSM
//
//  Created by Denis Guilherme Ferreira Espanhol on 21/07/26.
//

import SwiftUI

public struct DSMTextField: View {
    
    @ObservedObject private var viewModel: DSMTextFieldViewModel

    public init(viewModel: DSMTextFieldViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            if viewModel.isSecure {
                SecureField(viewModel.placeholder, text: $viewModel.text)
            } else {
                TextField(viewModel.placeholder, text: $viewModel.text)
            }
            
            if viewModel.hasError {
                Text(viewModel.errorMessage ?? "")
                    .font(DSMTypography.caption)
                    .foregroundColor(DSMColors.error)
            }
        }
    }
}
