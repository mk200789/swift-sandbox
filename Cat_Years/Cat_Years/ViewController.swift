//
//  ViewController.swift
//  Cat_Years
//
//  Created by Wan Kim Mok on 9/27/15.
//  Copyright (c) 2015 mk200789. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    
    @IBOutlet var label: UILabel!
    
    @IBAction func submit(sender: AnyObject) {
        print("Button pressed!")
        label.text = "The entered age " + textField.text
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

