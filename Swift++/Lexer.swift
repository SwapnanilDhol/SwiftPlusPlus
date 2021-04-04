//
//  Lexer.swift
//  Swift++
//
//  Created by Swapnanil Dhol on 4/5/21.
//

import Foundation

class Lexer {

    let fileName: String
    let text: String
    var position: Position
    var currentCharacter: Character?

    init(fileName: String, text: String) {
        self.fileName = fileName
        self.text = text
        self.position = Position(index: -1, lineNumber: 0, columnNumber: -1, fileName: self.fileName, fileText: self.text)
        self.currentCharacter = nil
        self.advance()
    }

    func advance() {
        self.position.advance(currentCharacter: self.currentCharacter)
        if self.position.index < self.text.count {
            self.currentCharacter = self.text[self.position.index]
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
                tokens.append(TokenType.plus.rawValue)
                self.advance()
            } else if self.currentCharacter == "-" {
                tokens.append(TokenType.minus.rawValue)
                self.advance()
            } else if self.currentCharacter == "*" {
                tokens.append(TokenType.multiply.rawValue)
                self.advance()
            } else if self.currentCharacter == "/" {
                tokens.append(TokenType.divide.rawValue)
                self.advance()
            } else if self.currentCharacter == ")" {
                tokens.append(TokenType.rightParen.rawValue)
                self.advance()
            } else if self.currentCharacter == "(" {
                tokens.append(TokenType.leftParen.rawValue)
                self.advance()
            } else {
                let positionStart = self.position.copy()
                let character = self.currentCharacter
                self.advance()
                Error(errorType: .illegalCharacterError,
                      value: character!,
                      positionStart: positionStart,
                      positionEnd: self.position).asString()
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
            return Token(type: .int, value: String(numberString))
        } else {
            return Token(type: .float, value: String(numberString))
        }
    }
}
