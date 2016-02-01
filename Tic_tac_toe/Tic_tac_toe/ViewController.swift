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
    
    var board = [-1, -1, -1, -1, -1, -1, -1 ,-1, -1]
    
    var tags = [UIButton]()
    
    @IBOutlet var restart: UIButton!

    @IBAction func restart(sender: AnyObject) {

        //reset board grids to -1
        for var i=0; i<board.count; ++i{
            board[i] = -1
        }
        
        //remove images x's and o's
        for var i=0; i<tags.count; ++i{
            print(tags[i].tag)
            tags[i].setImage(UIImage(CGImage: nil), forState: .Normal)
        }
        
        for index in stride(from: tags.count - 1, through: 0, by: -1) {
            tags.removeAtIndex(index)
        }
        
        winner = false
        restart.alpha = 0
        winnerLabel.alpha = 0
    }
    
    @IBOutlet var winnerLabel: UILabel!
    
    var winningCombination = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2, 5, 8], [0,4,8], [2,4,6]]
    
    var winner = false

    @IBAction func buttonPressed(sender: AnyObject) {
        //check if this position of board isn't taken

        if board[sender.tag] == -1 {
            
            if winner == false{
                //enables to set board if there isn't any winners
                
                //set gamestate to player's value
                board[sender.tag] = Int(player)
                
                tags.append(sender as UIButton)
            
                if player {

                    sender.setImage(UIImage(named: "x.png"), forState: .Normal)
                }
                else{

                    sender.setImage(UIImage(named: "o.png"), forState: .Normal)
                }

                toggleUser()
                checkWin()
            }
        }

    }
    
    func checkWin(){
        
        if winner == false {
            //check winning combinations if there is no winner
            
            for combination in winningCombination{
                if (board[combination[0]] != -1){
                    if (board[combination[0]] == board[combination[1]] && board[combination[0]] == board[combination[2]]){
                    
                        if board[combination[0]] == 1{
                            print("x wins!")
                            winnerLabel.text =  "X Wins!"
                        }
                        else{
                            print("o wins!")
                            winnerLabel.text =  "O Wins!"
                        }
                        winner = true
                        
                        
                        winnerLabel.backgroundColor = UIColor.purpleColor()
                        winnerLabel.alpha = 1
                        restart.alpha = 1

                    }
                }
            }
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
        winnerLabel.alpha = 0
        restart.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

