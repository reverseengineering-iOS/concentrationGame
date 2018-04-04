//
//  Cards.swift
//  ConcentrationGame
//
//  Created by Saivishal Gummadi on 3/29/18.
//  Copyright © 2018 ReverseEngineering. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUP = false
    var isMatched = false
    var identifier: Int
    static var identifierFactor = 0
    static func uniqueIdentifier() -> Int {
        identifierFactor += 1
        return identifierFactor
    }
    init() {
        self.identifier = Card.uniqueIdentifier()
    }
}
