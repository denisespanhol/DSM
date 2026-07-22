//
//  DSMTextField.swift
//  DSM
//
//  Created by Denis Guilherme Ferreira Espanhol on 21/07/26.
//

import SwiftUI

public struct DSMTextField: View {
    let placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    var errorMessage: String? = nil

    public init(
        placeholder: String,
        text: Binding<String>,
        isSecure: Bool = false,
        errorMessage: String? = nil
    ) {
        self.placeholder = placeholder
        self._text = text
        self.isSecure = isSecure
        self.errorMessage = errorMessage
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            if isSecure {
                SecureField(placeholder, text: $text)
            } else {
                TextField(placeholder, text: $text)
            }
            
            if let error = errorMessage {
                Text(error)
                    .font(DSMTypography.caption)
                    .foregroundColor(DSMColors.error)
            }
        }
    }
}
