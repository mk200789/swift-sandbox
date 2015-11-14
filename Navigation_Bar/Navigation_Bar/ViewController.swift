//
//  ViewController.swift
//  Navigation_Bar
//
//  Created by Wan Kim Mok on 11/14/15.
//  Copyright (c) 2015 mk200789. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var time = 0
    
    func result(){
        time++
        print("\(time) second has passed")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        var timer = NSTimer()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("result"), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

