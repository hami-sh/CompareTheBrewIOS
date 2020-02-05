//
//  Card.swift
//  iOS Demo
//
//  Created by Hamish Bultitude on 28/1/20.
//  Copyright © 2020 Hamish Bultitude. All rights reserved.
//

import Foundation

// a card in the game
struct Card {
    // value type!
    var isFaceUp = false
    var isMatched = false
    var identifier: Int // need to be init
    // all need to be public to get info
    
    private static var identifierFactory = 0
    
    // dont store emoji, as that is a part of the UI!
    // id is enough to match 2 cards
    
    private static func getUUID() -> Int {
        identifierFactory += 1
        return identifierFactory // dont need card. as we are in a static method!
    }
    
    init() {
        self.identifier = Card.getUUID()
    }
}
