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
    
    lazy var game = Concentration(numberOfPairedCards: (cardButton.count + 1) / 2)
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    @IBOutlet var cardButton: [UIButton]!
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if  let cardNumber = cardButton.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Choosen card was not there in the card Button")
        }
    }
    func updateViewFromModel() {
        for index in cardButton.indices {
            let button = cardButton[index]
            let card = game.cards[index]
            if  card.isFaceUP == true {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0): #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
            
        }
    }
    var emojiChoices = ["🐶", "🐈", "👻", "🐒", "🐝", "🐙", "🦆", "🦅", "🦉", "🦀", "🐸", "🐓", "🦃", "🐏", "🎃", "🦑", "🐫"]
    var emoj = [Int:String]()
    func emoji(for card: Card) -> String {
        if emoj[card.identifier] == nil, emojiChoices.count > 0  {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoj[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoj[card.identifier] ?? "?"
    }
    
}

