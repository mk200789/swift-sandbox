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
    
    var board = [-1, -1, -1, -1, -1, -1, -1, -1 ,-1]
    
    var winningCombination = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3, 6, 9], [1,5,9], [3,5,7]]

    @IBAction func buttonPressed(sender: AnyObject) {
        //check if this position of board isn't taken
        if board[sender.tag] == -1 {
            
            //set gamestate to player's value
            board[sender.tag] = Int(player)
            
            if player {

                sender.setImage(UIImage(named: "o.png"), forState: .Normal)
            }
            else{

                sender.setImage(UIImage(named: "x.png"), forState: .Normal)
            }

            toggleUser()
        }

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

