//
//  DSMErrorView.swift
//  DSM
//
//  Created by Denis Guilherme Ferreira Espanhol on 22/07/26.
//

import SwiftUI

public struct DSMErrorView: View {
    let message: String
    
    let onRetry: () -> Void
    
    public init(message: String, onRetry: @escaping () -> Void) {
        self.message = message
        self.onRetry = onRetry
    }
    
    public var body: some View {
        VStack(spacing: 16) {
            
            Image(systemName: "wifi.exclamationmark")
                .font(.system(size: 48))
                .foregroundColor(DSMColors.error)
            
            DSMLabel(text: message, variant: .body)
                .multilineTextAlignment(.center)
            
            DSMButton(title: "Tentar novamente", action: onRetry)
                .frame(maxWidth: 200)
        }
        .padding(32)
        .frame(maxWidth: .infinity)
    }
}
