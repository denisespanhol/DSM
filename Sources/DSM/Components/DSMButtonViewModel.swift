//
//  DSMButtonViewModel.swift
//  DSM
//
//  Created by Denis Guilherme Ferreira Espanhol on 22/07/26.
//

import Foundation
public class DSMButtonViewModel: ObservableObject {
    public let title: String
    public let style: DSMButtonStyle
    @Published public var isLoading: Bool
    private let action: () -> Void
    
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
    
    public func handleTap() {
        guard !isLoading else { return }
        action()
    }
}
