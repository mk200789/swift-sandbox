//
//  ViewController.swift
//  Downloading_an_image
//
//  Created by Wan Kim Mok on 2/26/16.
//  Copyright (c) 2016 mk200789. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
/*
        let url = NSURL(string: "https://upload.wikimedia.org/wikipedia/commons/6/6a/Johann_Sebastian_Bach.jpg")!
            
        //create a session
        let task = NSURLSession.sharedSession().dataTaskWithURL(url){ (data, response, error) -> Void in
                
            if error != nil{
                print(error)
            }
            else{
                
                //this will store the location of the document folder
                var documentsDirectory: String?
                
                //location of the document directory
                var paths: [AnyObject] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
                
                if paths.count > 0 {
                    documentsDirectory = paths[0] as? String
                    
                    //path that the image will be saved
                    let savePath = documentsDirectory! + "/bach.jpg"
                    
                    //save the file
                    NSFileManager.defaultManager().createFileAtPath(savePath, contents: data, attributes: nil)
                    
                    //avoid updating image from background thread, instead update from the main thread
                    dispatch_async(dispatch_get_main_queue(), { ()-> Void in
                        
                        //update imageview to the saved image
                        self.image.image = UIImage(named: savePath)
                    })
                    
                }
                


            }
            
        }
        task.resume()
*/
        
        //this will store the location of the document folder
        var documentsDirectory: String?
        
        //location of the document directory
        var paths: [AnyObject] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        
        if paths.count > 0 {
            documentsDirectory = paths[0] as? String
            
            //path that the image will be saved
            let savePath = documentsDirectory! + "/bach.jpg"
            
            //update imageview to the saved image
            self.image.image = UIImage(named: savePath)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

