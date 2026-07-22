//
//  DSMCell.swift
//  DSM
//
//  Created by Denis Guilherme Ferreira Espanhol on 22/07/26.
//

import SwiftUI

public struct DSMCell: View {
    let title: String
    let subtitle: String
    let imageURL: URL?
    
    public init(title: String, subtitle: String, imageURL: URL? = nil) {
        self.title = title
        self.subtitle = subtitle
        self.imageURL = imageURL
    }
    
    public var body: some View {
        HStack(spacing: 12) {
            AsyncImage(url: imageURL) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
            }
            .frame(width: 56, height: 56)
            .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 4) {
                DSMLabel(text: title, variant: .body)
                DSMLabel(text: subtitle, variant: .caption)
            }
            
            Spacer()
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
    }
}
