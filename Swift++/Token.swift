//
//  Token.swift
//  Swift++
//
//  Created by Swapnanil Dhol on 4/5/21.
//

import Foundation

class Token<T: GenericType> {

    let type: TokenType
    let value: T?

    init(type: TokenType, value: T) {
        self.type = type
        self.value = value
    }

    private func representation() -> String {
        if self.value != nil {
            return "\(self.type) : \(String(describing: self.value))"
        }
        return "\(self.type)"
    }
}
