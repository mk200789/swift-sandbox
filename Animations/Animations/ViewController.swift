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
    
    @IBAction func updateImage(sender: AnyObject) {
        
        catImage.image = UIImage(named: "frame_\(frame_no).png")
        
        frame_no++
        
        if frame_no == 31{
            frame_no = 1
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
    
    override func viewDidLayoutSubviews(){
        //cat image will be the on the left of the screen
        //catImage.center = CGPointMake(catImage.center.x-400, catImage.center.y)
        
        //set alpha of image to 0,
        //catImage.alpha = 0
        
        //alternate way to hide cat image
        catImage.frame = CGRectMake(100, 20, 0, 0)
        
    }
    
    override func viewDidAppear(animated: Bool){
        UIView.animateWithDuration(1, animations: {() -> Void in
            //bringing back the image from left to its actual position
            //self.catImage.center = CGPointMake(self.catImage.center.x+400, self.catImage.center.y)
            
            //set alpha to 1 so it appears on screen
            //self.catImage.alpha = 1
            
            //make frame bigger, so it will be visible
            self.catImage.frame = CGRectMake(self.catImage.center.x, self.catImage.center.y, 200, 500)
            
        })
        
    }


}

