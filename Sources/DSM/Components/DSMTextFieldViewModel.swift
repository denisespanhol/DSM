//
//  DSMTextFieldViewModel.swift
//  DSM
//
//  Created by Denis Guilherme Ferreira Espanhol on 23/07/26.
//

import Foundation
import Combine

public class DSMTextFieldViewModel: ObservableObject {
    public let placeholder: String
    public let isSecure: Bool
    @Published public var text: String
    @Published public var errorMessage: String?
    
    public var hasError: Bool {
        errorMessage != nil
    }
    
    public init(placeholder: String, isSecure: Bool = false, text: String = "", errorMessage: String? = nil) {
        self.placeholder = placeholder
        self.isSecure = isSecure
        self.text = text
        self.errorMessage = errorMessage
    }
}
