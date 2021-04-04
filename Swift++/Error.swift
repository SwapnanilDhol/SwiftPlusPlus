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

    init(errorType: ErrorType, value: Character) {
        self.value = value
        self.errorType = errorType
    }

    func asString() {
        switch errorType {
        case .illegalCharacterError:
            print("Illegal character '\(value)' found.")
        default:
            break
        }
    }
}
