//
//  Concentration.swift
//  iOS Demo
//
//  Created by Hamish Bultitude on 28/1/20.
//  Copyright © 2020 Hamish Bultitude. All rights reserved.
//

import Foundation // not a UI file, its a model!


// models are made with classes.
struct Concentration {
    
    // must be public so we can see the cards, but set does not need to be enabled.
    private(set) var cards = Array<Card>() // instantiate! could put args within there (init method)
    private var indexOfXOROneFaceUp: Int? // doesnt necessarily exist! else nil
    
    mutating func chooseCard(at index: Int) { // need mutating here so we can change values of the struct. 
        assert(cards.indices.contains(index), "Concentration:ChooseCard(at: \(index)) ; chosen index not in the cards")
        // choose a card by an index -- occurs when touchCard
//        if cards[index].isFaceUp {
//            cards[index].isFaceUp = false
//        } else {
//            cards[index].isFaceUp = true
//        }
        if !cards[index].isMatched {
            if let matchIndex = indexOfXOROneFaceUp, matchIndex != index {
                // 3. one card face up (now we need to match)
                if cards[index].identifier == cards[matchIndex].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfXOROneFaceUp = nil // no more face up
            } else {
                // 2. two cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfXOROneFaceUp = index
            }
        }
    }
    
    init(numberOfPairs: Int) {
        assert(numberOfPairs > 0, "invalid pairs")
        for _ in 1...numberOfPairs { // sequence in swift! go from 0 to numberPairs-1 (use _ so that we ignore it!)
            let card = Card()
            cards.append(card)
            cards.append(card) // we want two here so that pairs can be found! eg both have same identifier.
                               // remember structs are copied therefore different instance.
        }
        
        // TODO: Shuffle the cards up instead of being in order!
        cards.shuffle()
    }
}
