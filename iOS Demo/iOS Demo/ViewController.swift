//
//  ViewController.swift
//  iOS Demo
//
//  Created by Hamish Bultitude on 26/1/20.
//  Copyright © 2020 Hamish Bultitude. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairs: (cards.count + 1) / 2) // link controller with a model!
    // dont need init here as all variables are initialised ( see var cards! )
    
    
    var flipCount = 0 {
        didSet {
            flipsLabel.text = "Flips: \(flipCount)"
        }
    }
    
    var emojis = ["🧬", "🍺", "🍺", "🧬"]
    
    @IBOutlet var cards: [UIButton]!
    
    @IBOutlet weak var flipsLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        // function called when clicked by a general button
        if let cardNumber = cards.firstIndex(of: sender) {
            print("touched \(cardNumber)")
            game.chooseCard(at: cardNumber) // talk to model!
            // now the model has changed, update view!
            updateView()
        }
    }
    
    func updateView() {
        for index in cards.indices {
            let button = cards[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.2995683849, green: 0.796302259, blue: 0.3880139887, alpha: 1) // clear if matched
            }
        }
        flipCount += 1
    }
    
    
    var emojiChoices = ["⚽️", "🎾", "💎", "❤️", "🐶", "🐵", "🐷", "🌻", "🌎", "🇦🇺"]
    
    var emoji = [Int:String]() // map int to emoji
    
    func emoji(for card: Card) -> String {
//        if let chosenEmoji = emoji[card.identifier] { // handle optional
//            return chosenEmoji
//        } else {
//            return "?"
//        }
        //
//        if emoji[card.identifier] != nil {
//            return emoji[card.identifier]! // ! as we know it is not nil
//        } else {
//            return "?"
//        }
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count))) // explicitly convert!
                emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            }
        return emoji[card.identifier] ?? "?"
    }
    
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        // function called to flip the button over.
        
//        flipCount += 1
        
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
}

