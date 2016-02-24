//
//  ViewController.swift
//  Swipes_and_shakes
//
//  Created by Wan Kim Mok on 2/19/16.
//  Copyright (c) 2016 mk200789. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //list of song titles
    var songs = ["red_beans", "my_cherie_amour", "cello_suite_1_prelude"]
    
    var player: AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /*
        //this variable will be use to detect left swipe
        var swipeLeft = UISwipeGestureRecognizer(target: self, action: "swiped:")
        //add direction to the the swipeLeft object (which is the direction we're looking for)
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        //add the swipe gesture to the view
        self.view.addGestureRecognizer(swipeLeft)
        
        
        var swipeUp = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeUp.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeUp)
        */
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent){

        //check if motion ended is a shake type
        if event.subtype == UIEventSubtype.MotionShake{
            //select random number
            var random_num = Int(arc4random_uniform(UInt32(songs.count)))
            var songPath = NSBundle.mainBundle().pathForResource(songs[random_num], ofType: "mp3")!
            player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: songPath), error: nil)
            player.play()
            

        }
        
    }
/*
    func swiped(gesture: UIGestureRecognizer){

        //if there's a gesture assign it to swipeGesture variable
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            //checking if gesture matches any of the direction of the following:
            switch swipeGesture.direction{
                case UISwipeGestureRecognizerDirection.Left:
                    print("Swiped Left!")
                case UISwipeGestureRecognizerDirection.Up:
                    print("Swiped Up!")
                default:
                    break
            }
        }
        
    }
*/
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

