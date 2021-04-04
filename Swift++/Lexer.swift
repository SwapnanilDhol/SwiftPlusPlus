//
//  Lexer.swift
//  Swift++
//
//  Created by Swapnanil Dhol on 4/5/21.
//

import Foundation

class Lexer {

    let text: String
    var position: Int
    var currentCharacter: Character?

    init(text: String) {
        self.text = text
        self.position = -1
        self.currentCharacter = nil
        self.advance()
    }

    func advance() {
        self.position += 1
        if self.position < self.text.count {
            self.currentCharacter = self.text[self.position]
        } else {
            self.currentCharacter = nil
        }
    }

    func makeTokens() -> [String] {
        var tokens: [String] = []

        while self.currentCharacter != nil {
            if (" \t").contains(self.currentCharacter!) {
                self.advance()
            } else if kDigits.contains(self.currentCharacter!) {
                tokens.append(self.makeGenericNumbers().value!)
            } else if self.currentCharacter == "+" {
                tokens.append(TokenType.TT_PLUS.rawValue)
                self.advance()
            } else if self.currentCharacter == "-" {
                tokens.append(TokenType.TT_MINUS.rawValue)
                self.advance()
            } else if self.currentCharacter == "*" {
                tokens.append(TokenType.TT_MUL.rawValue)
                self.advance()
            } else if self.currentCharacter == "/" {
                tokens.append(TokenType.TT_DIV.rawValue)
                self.advance()
            } else if self.currentCharacter == ")" {
                tokens.append(TokenType.TT_RPAREN.rawValue)
                self.advance()
            } else if self.currentCharacter == "(" {
                tokens.append(TokenType.TT_LPAREN.rawValue)
                self.advance()
            } else {
                let character = self.currentCharacter
                self.advance()
                Error(errorType: .illegalCharacterError, value: character!).asString()
                return []
            }
        }
        return tokens
    }

    private func makeGenericNumbers() -> Token<String> {
        var numberString = ""
        var dotCount = 0

        while self.currentCharacter != nil && (kDigits.contains(self.currentCharacter!) || self.currentCharacter == ".") {
            if self.currentCharacter == "." {
                if dotCount == 1 {
                    break
                }
                dotCount += 1
                numberString += "."
            } else {
                numberString.append(self.currentCharacter!)
            }
            self.advance()
        }
        if dotCount == 0 {
            return Token(type: .TT_INT, value: String(numberString))
        } else {
            return Token(type: .TT_FLOAT, value: String(numberString))
        }
    }
}
