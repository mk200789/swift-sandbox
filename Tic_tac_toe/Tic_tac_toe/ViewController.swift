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

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
    @IBOutlet var button5: UIButton!
    @IBOutlet var button6: UIButton!
    @IBOutlet var button7: UIButton!
    @IBOutlet var button8: UIButton!
    @IBOutlet var button9: UIButton!

    
    @IBAction func grid1(sender: AnyObject) {
        if player {
            button1.setImage(UIImage(named: "o.png"), forState: .Normal)
        }
        else{
            button1.setImage(UIImage(named: "x.png"), forState: .Normal)
        }
        
        toggleUser()
    }
    
    @IBAction func grid2(sender: AnyObject) {
        if player {
            button2.setImage(UIImage(named: "o.png"), forState: .Normal)
        }
        else{
            button2.setImage(UIImage(named: "x.png"), forState: .Normal)
        }
        toggleUser()
    }
    
    @IBAction func grid3(sender: AnyObject) {
        if player {
            button3.setImage(UIImage(named: "o.png"), forState: .Normal)
        }
        else{
            button3.setImage(UIImage(named: "x.png"), forState: .Normal)
        }
        toggleUser()
    }
    
    @IBAction func grid4(sender: AnyObject) {
        if player {
            button4.setImage(UIImage(named: "o.png"), forState: .Normal)
        }
        else{
            button4.setImage(UIImage(named: "x.png"), forState: .Normal)
        }
        toggleUser()
    }
    
    @IBAction func grid5(sender: AnyObject) {
        if player {
            button5.setImage(UIImage(named: "o.png"), forState: .Normal)
        }
        else{
            button5.setImage(UIImage(named: "x.png"), forState: .Normal)
        }
        toggleUser()
    }
    
    @IBAction func grid6(sender: AnyObject) {
        if player {
            button6.setImage(UIImage(named: "o.png"), forState: .Normal)
        }
        else{
            button6.setImage(UIImage(named: "x.png"), forState: .Normal)
        }
        toggleUser()
    }
    
    @IBAction func grid7(sender: AnyObject) {
        if player {
            button7.setImage(UIImage(named: "o.png"), forState: .Normal)
        }
        else{
            button7.setImage(UIImage(named: "x.png"), forState: .Normal)
        }
        toggleUser()
    }
    
    @IBAction func grid8(sender: AnyObject) {
        if player {
            button8.setImage(UIImage(named: "o.png"), forState: .Normal)
        }
        else{
            button8.setImage(UIImage(named: "x.png"), forState: .Normal)
        }
        toggleUser()
    }
    
    @IBAction func grid9(sender: AnyObject) {
        if player {
            button9.setImage(UIImage(named: "o.png"), forState: .Normal)
        }
        else{
            button9.setImage(UIImage(named: "x.png"), forState: .Normal)
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

