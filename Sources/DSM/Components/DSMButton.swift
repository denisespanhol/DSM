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
    @ObservedObject private var viewModel: DSMButtonViewModel
    
    public init(
        title: String,
        style: DSMButtonStyle = .primary,
        isLoading: Bool = false,
        action: @escaping () -> Void
    ) {
        self.viewModel = DSMButtonViewModel(
            title: title,
            style: style,
            isLoading: isLoading,
            action: action
        )
    }
    
    public var body: some View {
        Button(action: viewModel.handleTap) {
            ZStack {
                if viewModel.isLoading {
                    ProgressView()
                        .tint(viewModel.style == .primary ? .white : DSMColors.primary)
                } else {
                    Text(viewModel.title)
                        .font(DSMTypography.button)
                        .foregroundColor(viewModel.style == .primary ? .white : DSMColors.primary)
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(viewModel.style == .primary ? DSMColors.primary : Color.clear)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(DSMColors.primary, lineWidth: viewModel.style == .secondary ? 2 : 0)
            )
            .cornerRadius(8)
        }
        .disabled(viewModel.isLoading)
    }
    
}
