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
        
        let url = NSURL(string: "https://upload.wikimedia.org/wikipedia/commons/6/6a/Johann_Sebastian_Bach.jpg")!
            
        //create a session
        let task = NSURLSession.sharedSession().dataTaskWithURL(url){ (data, response, error) -> Void in
                
            if error != nil{
                print(error)
            }
            else{
                //create uiimage
                if let bach = UIImage(data: data!){
                    //update imageview to the downloaded image
                    self.image.image = bach
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

