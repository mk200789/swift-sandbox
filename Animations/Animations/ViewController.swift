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
    
    var frame_no = 1
    
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


}

