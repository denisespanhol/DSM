//
//  DSMLabel.swift
//  DSM
//
//  Created by Denis Guilherme Ferreira Espanhol on 22/07/26.
//

import SwiftUI

public enum DSMLabelVariant {
    case title
    case body
    case caption
}

public struct DSMLabel: View {
    let text: String
    let variant: DSMLabelVariant
    
    public init(text: String, variant: DSMLabelVariant = .body) {
        self.text = text
        self.variant = variant
    }
    
    public var body: some View {
        Text(text)
            .font(font)
            .foregroundColor(DSMColors.textPrimary)
    }
    
    private var font: Font {
        switch variant {
        case .title:
            return DSMTypography.title
        case .body:
            return DSMTypography.body
        case .caption:
            return DSMTypography.caption
        }
    }
}
