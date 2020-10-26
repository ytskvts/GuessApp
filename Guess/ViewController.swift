//
//  ViewController.swift
//  Guess
//
//  Created by Dmitry Yatskovets on 10/23/20.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = LogicGame(numberOfPairs: CollectionButton.count / 2)
    
    
    var touches = 0 {
        didSet{
            TouchesLabel.text = "Touches: \(touches)"
        }
    }

    
    var emojiCollectioin = ["🦄", "🐬", "🐝", "🐁", "🐒", "🐘", "🦖", "🐠", "🦕", "🐿", "🦢", "🦥", "🦍", "🐢", "🦉"]
    var emojiDictionary = [Int:String]()
    
    
    func emojiIdentifier(for card: Card) -> String {
        if emojiDictionary[card.identifier] == nil {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiCollectioin.count)))
            emojiDictionary[card.identifier] = emojiCollectioin.remove(at: randomIndex)
        }
        
        return emojiDictionary[card.identifier] ?? "GG, WP"
    }
    
    func updateViewFromLogic() {
        for index in CollectionButton.indices {
            let button = CollectionButton[index]
            let card = game.cards[index]
            if card.isFlipped {
                button.setTitle(emojiIdentifier(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.5685824156, green: 0.5686529875, blue: 0.5685582757, alpha: 1)
            }
        }
    }
    
    
    @IBOutlet var CollectionButton: [UIButton]!
    @IBOutlet weak var TouchesLabel: UILabel!
    @IBAction func ActionButton(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = CollectionButton.firstIndex(of: sender) {
            game.chooseCard(at: buttonIndex)
            updateViewFromLogic()
        } else {
            print("GG, WP")
        }
        
    }
}

