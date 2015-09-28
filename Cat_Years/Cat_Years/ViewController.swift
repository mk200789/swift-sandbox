//
//  ViewController.swift
//  Cat_Years
//
//  Created by Wan Kim Mok on 9/27/15.
//  Copyright (c) 2015 mk200789. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var inputAge: UITextField!
    
    @IBOutlet var result: UILabel!
    
    @IBAction func findCatYear(sender: AnyObject) {
        var catAge = (inputAge.text).toInt()!
        
        catAge = catAge * 7
        
        result.text = "Your cat is \(inputAge.text) in cat years."
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

