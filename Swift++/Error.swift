//
//  Error.swift
//  Swift++
//
//  Created by Swapnanil Dhol on 4/5/21.
//

import Foundation

enum ErrorType {
    case illegalCharacterError

    var details: String {
        switch self {
        case .illegalCharacterError:
            return "Illegal character. Cannot parse"
        }
    }
    
}

class Error {

    let value: Character
    let errorType: ErrorType
    let positionStart: Position
    let positionEnd: Position

    init(errorType: ErrorType, value: Character, positionStart: Position, positionEnd: Position) {
        self.value = value
        self.errorType = errorType
        self.positionStart = positionStart
        self.positionEnd = positionEnd
    }

    func asString() {
        switch errorType {
        case .illegalCharacterError:
            print("Illegal character '\(value)' found.")
            print("In file \(self.positionStart.fileName), line: \(self.positionStart.lineNumber + 1)")
        default:
            break
        }
    }
}
