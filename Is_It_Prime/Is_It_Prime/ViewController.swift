//
//  ViewController.swift
//  Is_It_Prime
//
//  Created by Wan Kim Mok on 9/30/15.
//  Copyright (c) 2015 mk200789. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var userInput: UITextField!
    
    @IBOutlet var result: UILabel!
    
    @IBAction func checkPrime(sender: AnyObject) {
        var isPrime = true
        
        if (userInput.text.toInt() != nil){
        
            if (userInput.text.toInt() == 1){
                isPrime = false
            }
            else if (userInput.text.toInt() >= 2){
                var n = 2
                while(n < userInput.text.toInt()){
                    if (userInput.text.toInt()!%n == 0){
                        isPrime = false
                    }
                    n++
                }
            }
        
            if (isPrime){
                result.text = "\(userInput.text) is Prime"
            }
            else{
                result.text = "\(userInput.text) is not Prime"
            }
        }
        else{
            result.text = "\(userInput.text) is not a whole number."
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

