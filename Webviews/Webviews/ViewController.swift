//
//  ViewController.swift
//  Webviews
//
//  Created by Wan Kim Mok on 2/27/16.
//  Copyright (c) 2016 mk200789. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var webview: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
/*
        var url = NSURL(string: "http://www.ecowebhosting.co.uk")!
        
        //make url request
        var request = NSURLRequest(URL: url)
        
        //load request in webview
        webview.loadRequest(request)
*/
        var html = "<html><body><h1>My Page</h1><p>Hello Everyone!</p></body></html>"
        
        webview.loadHTMLString(html, baseURL: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

