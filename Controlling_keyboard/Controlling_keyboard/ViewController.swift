//
//  ViewController.swift
//  Controlling_keyboard
//
//  Created by Wan Kim Mok on 12/12/15.
//  Copyright (c) 2015 mk200789. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var outputTextField: UILabel!
    @IBOutlet var inputTextField: UITextField!
    
    @IBAction func EnterButton(sender: AnyObject) {
        outputTextField.text = inputTextField.text
        inputTextField.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //saying there's a delegate responsible for the inputTextField
        self.inputTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        //close keyboard
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        //allow user to press return button to close the keyboard 
        //also include UITextFieldDelegate
        textField.resignFirstResponder()
        
        return true
    }

}

