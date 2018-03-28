//
//  ViewController.swift
//  ConcentrationGame
//
//  Created by Saivishal Gummadi on 3/28/18.
//  Copyright © 2018 ReverseEngineering. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var flipCountLabel: UILabel!
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    @IBOutlet var cardButton: [UIButton]!
    var emojiChoices = ["👻","🎃","👻","🎃"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if  let cardNumber = cardButton.index(of: sender) {
            flipCard(onEmoji: emojiChoices[cardNumber], on: sender)
        } else {
            print("Choosen card was not there in the card Button")
        }
    }
    
    func flipCard(onEmoji emoji: String, on button: UIButton){
        if  button.currentTitle == emoji {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        }
        
    }
}

