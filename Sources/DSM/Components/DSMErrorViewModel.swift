//
//  DSMErrorViewModel.swift
//  DSM
//
//  Created by Denis Guilherme Ferreira Espanhol on 23/07/26.
//

import Foundation

public class DSMErrorViewModel: ObservableObject {
    public let message: String
    private let onRetry: () -> Void
    @Published public var isRetrying: Bool = false
    
    public init(message: String, onRetry: @escaping () -> Void) {
        self.message = message
        self.onRetry = onRetry
    }
    
    public func retry() {
        guard !isRetrying else { return }
        isRetrying = true
        onRetry()
    }
    
    public func resetRetryState() {
        isRetrying = false
    }
}
