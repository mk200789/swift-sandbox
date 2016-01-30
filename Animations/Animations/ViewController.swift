//
//  ViewController.swift
//  Animations
//
//  Created by Wan Kim Mok on 1/27/16.
//  Copyright (c) 2016 mk200789. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var catImage: UIImageView!
    
    var frame_no = 2
    
    var timer = NSTimer()
    
    var isAnimating = true
    
    @IBAction func stopGo(sender: AnyObject) {
        
        if isAnimating == true {
            timer.invalidate()
            isAnimating = false
        }
        else{
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("doAnimation"), userInfo: nil, repeats: true)
            isAnimating = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //set timer to trigger the selector doAnimation for changing the animation frame
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("doAnimation"), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func doAnimation(){
        //handles the display the animation frame and update to its next frame
        
        catImage.image = UIImage(named: "frame_\(frame_no).png")
        if frame_no == 30{
            frame_no = 1
        }
        else{
            frame_no++
        }
    }
 

    override func viewDidLayoutSubviews(){
        //set alpha of image to 0,
        catImage.alpha = 0
        
    }
    
    override func viewDidAppear(animated: Bool){
        UIView.animateWithDuration(1, animations: {() -> Void in
            //set alpha to 1 so it appears on screen
            self.catImage.alpha = 1
            
        })
        
    }


}

