//
//  Card.swift
//  Guess
//
//  Created by Dmitry Yatskovets on 10/23/20.
//

import Foundation

struct Card {
    var isFlipped = false
    var isMatched = false
    var identifier: Int
    
    static var identifierNumber = 0
    
    static func identifierGenerator() -> Int {
        identifierNumber += 1
        return identifierNumber
    }
    init() {
        self.identifier = Card.identifierGenerator()
        
    }
    
}
