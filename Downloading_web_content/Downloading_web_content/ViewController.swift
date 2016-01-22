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
        
        //create a session to obtain the content from the url
        let task = NSURLSession.sharedSession().dataTaskWithURL(url){ (data, response, error) -> Void in
            
            //Execute this once task is completed
            if let urlContent = data{
                //If data exist then data is assigned to urlContent
                
                //convert the content to nsutf8
                let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
                
                //print the content of the url
                print(webContent)
                
                //force queue to come to a close when data is obtained and display webcontent
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    
                    // in swift 2:
                    // self.webView.loadHTMLString(String(webContent!), baseURL: nil)
                    
                    self.webView.loadHTMLString(webContent, baseURL: nil)
                })
                
            }
            else{
                //If no data, show an error message
            }
        }
        
        //run the task
        task.resume()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

