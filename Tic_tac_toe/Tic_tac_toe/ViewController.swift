//
//  ViewController.swift
//  Tic_tac_toe
//
//  Created by Wan Kim Mok on 1/29/16.
//  Copyright (c) 2016 mk200789. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var player = true

    
    @IBAction func buttonPressed(sender: AnyObject) {
        if player {
            sender.setImage(UIImage(named: "o.png"), forState: .Normal)
        }
        else{
            sender.setImage(UIImage(named: "x.png"), forState: .Normal)
        }
        
        toggleUser()
    }

    func toggleUser(){
        if player{
            player = false
        }
        else{
            player = true
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

