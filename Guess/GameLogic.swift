//
//  GameLogic.swift
//  Guess
//
//  Created by Dmitry Yatskovets on 10/23/20.
//

import Foundation


class LogicGame {
    var cards = [Card]()
    var indexOfFirstFlippedCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if  let matchingIndex = indexOfFirstFlippedCard, matchingIndex != index {
                if cards[matchingIndex].identifier == cards[index].identifier {
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFlipped = true
                indexOfFirstFlippedCard = nil
            } else {
                for flipDown in cards.indices {
                    cards[flipDown].isFlipped = false
                }
                cards[index].isFlipped = true
                indexOfFirstFlippedCard = index
                
            }
        }
        
    }
    init(numberOfPairs: Int) {
        for _ in 1...numberOfPairs {
            let card = Card()
            cards.append(card)
            cards.append(card)
        }
        
    }
    
}
