//
//  main.swift
//  Swift++
//
//  Created by Swapnanil Dhol on 4/5/21.
//

import Foundation

let kDigits = "0123456789"

func run(fileName: String, text: String) -> [String] {
    let lexer = Lexer(fileName: fileName, text: text)
    let tokens = lexer.makeTokens()
    return tokens
}

while true {
    if let str = readLine() {
        let result = run(fileName: "<stdin>", text: str)
        print(result)
    }
}

