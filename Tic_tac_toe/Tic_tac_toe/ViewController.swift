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
    
    var winner = false
    
    var gameOver = false
    
    var board = [-1, -1, -1, -1, -1, -1, -1 ,-1, -1]
    
    var tags = [UIButton]()
    
    @IBOutlet var restart: UIButton!
    
    @IBOutlet var winnerLabel: UILabel!
    
    var winningCombination = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2, 5, 8], [0,4,8], [2,4,6]]
    
    @IBAction func restart(sender: AnyObject) {
        
        //reset board grids to -1
        for var i=0; i<board.count; ++i{
            board[i] = -1
        }
        
        //remove images x's and o's
        for var i=0; i<tags.count; ++i{
            tags[i].setImage(UIImage(CGImage: nil), forState: .Normal)
        }
        
        //remove all all items from tags array
        for index in stride(from: tags.count - 1, through: 0, by: -1) {
            tags.removeAtIndex(index)
        }
        
        winner = false
        gameOver = false
        
        winnerLabel.hidden = true
        winnerLabel.center = CGPointMake(winnerLabel.center.x - 500, winnerLabel.center.y)

        restart.hidden = true
        restart.center = CGPointMake(restart.center.x - 500, restart.center.y)
    }
    
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
        
        if winner == false && gameOver == false{
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

                        winnerLabel.hidden = false
                        restart.hidden = false
                        UIView.animateWithDuration(0.5, animations: { ()-> Void in
                            self.winnerLabel.center = CGPointMake(self.winnerLabel.center.x + 500, self.winnerLabel.center.y)
                            self.restart.center = CGPointMake(self.restart.center.x + 500, self.restart.center.y)
                        })
                        


                    }
                }
            }
            
            //check if board is filled
            for grid in board{
                if (grid != -1){
                    gameOver = true
                }
                else{
                    gameOver = false
                    break
                }
            }
        }
        
        if gameOver == true && winner == false{
            winnerLabel.hidden = false
            restart.hidden = false
            winnerLabel.text = "It's a draw!"
            UIView.animateWithDuration(0.5, animations: { ()-> Void in
                self.winnerLabel.center = CGPointMake(self.winnerLabel.center.x + 500, self.winnerLabel.center.y)
                self.restart.center = CGPointMake(self.restart.center.x + 500, self.restart.center.y)
            })
        }

    }
    

    func toggleUser(){
        player = !player
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        winnerLabel.hidden = true
        winnerLabel.backgroundColor = UIColor.purpleColor()
        winnerLabel.center = CGPointMake(winnerLabel.center.x - 500, winnerLabel.center.y)

        restart.hidden = true
        restart.center = CGPointMake(restart.center.x - 500, restart.center.y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

