//
//  ViewController.swift
//  Hangman
//
//  Created by Alex Paul on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var hangmanBrain: GameBrain = GameBrain()
    
    
    @IBAction func newGame(_ sender: UIButton) {
      gameOver()
    }
    @IBOutlet weak var hiddenWord: UITextField!
    @IBOutlet weak var inputedWord: UITextField!
    @IBOutlet weak var wordDisplayed: UILabel!
    @IBOutlet weak var mistakes: UILabel!
    @IBOutlet weak var hangmen: UIImageView!
    @IBOutlet weak var displayBlanks: UILabel!
    var hiddenWords = String()
    var blanks = ["_"]
    var secondPlayerLetter = String()
    var mistake = String()
    var count = 0
   
    override func viewDidLoad() {
    super.viewDidLoad()
    hiddenWord.delegate = self
    inputedWord.delegate = self
   mistakes.isHidden = true
        displayBlanks.isHidden = true
wordDisplayed.isHidden = true
        
  }
    func mistakesWithPictures() {
    if count == 1 {
    hangmen.image = UIImage.init(named: "hang1")
    }
    if count == 2 {
    hangmen.image = UIImage.init(named: "hang2")
    }
    if count == 3 {
    hangmen.image = UIImage.init(named: "hang3")
    }
    if count == 4 {
    hangmen.image = UIImage.init(named: "hang4")
    }
    if count == 5 {
    hangmen.image = UIImage.init(named: "hang5")
    }
    if count == 6 {
    hangmen.image = UIImage.init(named: "hang6")
    }
    if count == 7 {
    hangmen.image = UIImage.init(named: "hang7")
    mistakes.text = "Lost! Play Again"
    gameOver()
    }
    }
    
    
    func gameOver() {
        hiddenWord.text = ""
            inputedWord.text = ""

        }
    
    func gameLogic() {
        
        let word = hangmanBrain.setWord(input: hiddenWord.text!)
    
       displayBlanks.text! = "\(word)"
        displayBlanks.isHidden = false 
        if hiddenWord.text!.contains(inputedWord.text!) {
             hiddenWords += inputedWord.text!
            wordDisplayed.isHidden = false
            var arrayOfString = Array(hiddenWords)
           
            wordDisplayed.text! = ("\(arrayOfString)")
            if hiddenWords == hiddenWord.text! {
                wordDisplayed.text! = "Winner!"
                hangmen.image! = UIImage.init(named: "winner")!
                
            }
            
        } else {
            
            mistakes.isHidden = false
            mistake += "✖️"
            mistakes.text = mistake
            count += 1
            mistakesWithPictures()
            }
            
            
       
       
        }
        }
    

    


extension ViewController: UITextFieldDelegate {
    // when the user press enter returns the captures what the user enters
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text?.isEmpty ?? true  {
            return true 
        }
       switch textField {
        case  hiddenWord:
         hiddenWord.resignFirstResponder()
       print("something1")
       case inputedWord:
           secondPlayerLetter = inputedWord.text ?? "Invalid"
            gameLogic()
          
            inputedWord.resignFirstResponder()
       
      default:
        print("something2")
        
        }
    return true
    }
    
    // this is runing everytime a character is typed
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.rangeOfCharacter(from: CharacterSet.letters, options: .caseInsensitive) != nil || (string == "" && range.length > 0) {
             return inputedWord.text!.count < 1
        } else {
            return false
        }
        
       
    }
}



