//
//  ViewController.swift
//  JSON_example
//
//  Created by Wan Kim Mok on 2/27/16.
//  Copyright (c) 2016 mk200789. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = NSURL(string: "http://freegeoip.net/json")!
        
        //create a session
        let task = NSURLSession.sharedSession().dataTaskWithURL(url){ (data, response, error) -> Void in
            
            
            if let urlContent = data{
                
                //processing json and store in jsonResult
                /* Swift 2
                do{
                    try let jsonResult = NSJSONSerialization.JSONObjectWithData(urlContent, options: NSJSONReadingOptions.MutableContainers)
                }catch{
                    print("error")
                }
                
                */
                if (response as NSHTTPURLResponse).statusCode == 200{
                    let jsonResult = NSJSONSerialization.JSONObjectWithData(urlContent, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
                    print(jsonResult["city"])
                    
                }
                else{
                    print("Service unavailable")
                }
            }
            
        }
        task.resume()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

