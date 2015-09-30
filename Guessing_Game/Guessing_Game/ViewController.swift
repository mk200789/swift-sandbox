//
//  ViewController.swift
//  Guessing_Game
//
//  Created by Wan Kim Mok on 9/30/15.
//  Copyright (c) 2015 mk200789. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var userGuess: UITextField!
    
    @IBOutlet var result: UILabel!
    
    @IBAction func submitGuess(sender: AnyObject) {
        let diceRoll = Int(arc4random_uniform(6))
        
        print(userGuess.text)
        if (userGuess.text.toInt() == nil){
            result.text = "Please enter a number."
        }
        else if (userGuess.text.toInt() > 5){
            result.text = "Your guess should be between 1 and 0."
        }
        else{
            if(userGuess.text == String(diceRoll)){
                result.text = "You guessed right! It was \(userGuess.text)"
            }else{
                result.text = "Try again :("
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

