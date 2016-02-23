//
//  ViewController.swift
//  Swipes_and_shakes
//
//  Created by Wan Kim Mok on 2/19/16.
//  Copyright (c) 2016 mk200789. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //this variable will be use to detect left swipe
        var swipeLeft = UISwipeGestureRecognizer(target: self, action: "swiped:")
        //add direction to the the swipeLeft object (which is the direction we're looking for)
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        //add the swipe gesture to the view
        self.view.addGestureRecognizer(swipeLeft)
        
        
        var swipeUp = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeUp.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeUp)
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent){
        //check if motion ended is a shake type
        if event.subtype == UIEventSubtype.MotionShake{
            print("Shaked!")
        }
        
    }
    
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

