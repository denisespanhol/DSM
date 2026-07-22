//
//  DSMLoadingView.swift
//  DSM
//
//  Created by Denis Guilherme Ferreira Espanhol on 22/07/26.
//

import SwiftUI

public struct DSMLoadingView: View {
    
    public init() {}
    
    public var body: some View {
        ZStack {
            
            Color.black.opacity(0.1).ignoresSafeArea()
            
            ProgressView()
                .progressViewStyle(.circular)
                .scaleEffect(3)
                .tint(DSMColors.primary)
        }
    }
}
