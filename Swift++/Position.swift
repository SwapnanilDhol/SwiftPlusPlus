//
//  Position.swift
//  Swift++
//
//  Created by Swapnanil Dhol on 4/5/21.
//

import Foundation

class Position {

    var index: Int
    var lineNumber: Int
    var columnNumber: Int
    var fileName: String
    var fileText: String

    init(index: Int, lineNumber: Int, columnNumber: Int, fileName: String, fileText: String) {
        self.index = index
        self.lineNumber = lineNumber
        self.columnNumber = columnNumber
        self.fileName = fileName
        self.fileText = fileText
    }

    func advance(currentCharacter: Character?) {
        self.index += 1
        self.columnNumber += 1

        if currentCharacter == "\n" {
            self.lineNumber +=  1
            self.columnNumber = 0
        }
    }

    func copy() -> Position {
        return Position(index: self.index,
                        lineNumber: self.lineNumber,
                        columnNumber: self.columnNumber,
                        fileName: self.fileName,
                        fileText: self.fileText)
    }

}
