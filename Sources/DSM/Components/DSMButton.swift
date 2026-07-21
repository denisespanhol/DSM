//
//  DSMButton.swift
//  DSM
//
//  Created by Denis Guilherme Ferreira Espanhol on 21/07/26.
//

import SwiftUI

public enum DSMButtonStyle {
    case primary
    case secondary
}

public struct DSMButton: View {
    let title: String
    let style: DSMButtonStyle
    let isLoading: Bool
    let action: () -> Void
    
    public init(
        title: String,
        style: DSMButtonStyle = .primary,
        isLoading: Bool = false,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.style = style
        self.isLoading = isLoading
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            ZStack {
                if isLoading {
                    ProgressView()
                        .tint(style == .primary ? .white : DSMColors.primary)
                } else {
                    Text(title)
                        .font(DSMTypography.button)
                        .foregroundColor(style == .primary ? .white : DSColors.primary)
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(style == .primary ? DSMColors.primary : Color.clear)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(DSMColors.primary, lineWidth: style == .secondary ? 2 : 0)
            )
            .cornerRadius(8)
        }
        .disabled(isLoading)
    }
    
}
