//
//  ViewController.swift
//  Downloading_web_content
//
//  Created by Wan Kim Mok on 1/19/16.
//  Copyright (c) 2016 mk200789. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Hard coded the url that we will be getting data from
        let url = NSURL(string: "http://www.stackoverflow.com")!
        
        //display website without downloading html content first
        webView.loadRequest(NSURLRequest(URL: url))
        
        


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

