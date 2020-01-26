//
//  ViewController.swift
//  iOS Demo
//
//  Created by Hamish Bultitude on 26/1/20.
//  Copyright © 2020 Hamish Bultitude. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
            print(cardNumber)
            flipCard(withEmoji: emojis[cardNumber], on: sender)
        }
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        // function called to flip the button over.
        
        flipCount += 1
        
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
}

