//
//  ViewController.swift
//  Permanent_storage
//
//  Created by Wan Kim Mok on 12/12/15.
//  Copyright (c) 2015 mk200789. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //NSUserDefaults.standardUserDefaults().setObject("Kim", forKey: "Name")
        
        let username = NSUserDefaults.standardUserDefaults().objectForKey("Name")!
        
        println(username)
        
        var array = [1, 2, 3, 4]
        
        //NSUserDefaults.standardUserDefaults().setObject(array, forKey: "Array")
        
        let returnedArray = NSUserDefaults.standardUserDefaults().objectForKey("Array")!
        
        println(returnedArray)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

