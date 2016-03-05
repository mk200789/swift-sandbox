//
//  ViewController.swift
//  firebase_demo
//
//  Created by Wan Kim Mok on 3/4/16.
//  Copyright (c) 2016 mk200789. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a reference to a Firebase location
        var myRootRef = Firebase(url: "https://demo7011.firebaseio.com")

        //write value to firebase
        var q1 = ["questions" : ["how are you?", "are you having fun?"]]
        myRootRef.setValue(q1)
        
        
        //read data
        myRootRef.observeEventType(.Value, withBlock: {
            snapshot in
            print(snapshot.value)
            
        })

        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

