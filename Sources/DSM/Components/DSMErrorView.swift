//
//  DSMErrorView.swift
//  DSM
//
//  Created by Denis Guilherme Ferreira Espanhol on 22/07/26.
//

import SwiftUI

public struct DSMErrorView: View {
    
    @ObservedObject private var viewModel: DSMErrorViewModel
    
    public init(viewModel: DSMErrorViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        VStack(spacing: 16) {
            
            Image(systemName: "wifi.exclamationmark")
                .font(.system(size: 48))
                .foregroundColor(DSMColors.error)
            
            DSMLabel(text: viewModel.message, variant: .body)
                .multilineTextAlignment(.center)
            
            DSMButton(title: "Tentar novamente", isLoading: viewModel.isRetrying, action: viewModel.retry)
                .frame(maxWidth: 200)
        }
        .padding(32)
        .frame(maxWidth: .infinity)
    }
}
