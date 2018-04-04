//
//  Concentration.swift
//  ConcentrationGame
//
//  Created by Saivishal Gummadi on 3/29/18.
//  Copyright © 2018 ReverseEngineering. All rights reserved.
//

import Foundation
class Concentration {
    
    var cards = [Card]()
  
    var indexOfOnlyOneCardFaceUp: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let machedup = indexOfOnlyOneCardFaceUp, machedup != index {
                if cards[machedup].identifier == cards[index].identifier{
                    cards[machedup].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUP = true
                indexOfOnlyOneCardFaceUp = nil
               
            } else {
                for indexFaceDown in cards.indices {
                    cards[indexFaceDown].isFaceUP = false
                }
                cards[index].isFaceUP = true
                indexOfOnlyOneCardFaceUp = index
            }
        }
    }
    
    init(numberOfPairedCards: Int) {
        for _ in 1...numberOfPairedCards {
            let card = Card()
            cards += [card, card]
        }
    }
}
