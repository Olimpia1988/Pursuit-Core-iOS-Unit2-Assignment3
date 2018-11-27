//
//  Model.swift
//  Hangman
//
//  Created by Olimpia on 11/23/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class GameBrain {
    func setWord(input: String) -> String {
        let hiddenWord = input.map{_ in return " - "}
        return hiddenWord.reduce("", +)
    }
    
   
    
}





