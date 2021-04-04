//
//  main.swift
//  Swift++
//
//  Created by Swapnanil Dhol on 4/5/21.
//

import Foundation

let kDigits = "0123456789"

func run(text: String) -> [String] {
    let lexer = Lexer(text: text)
    let tokens = lexer.makeTokens()
    return tokens
}

while true {
    if let str = readLine() {
        let result = run(text: str)
        print(result)
    }
}

