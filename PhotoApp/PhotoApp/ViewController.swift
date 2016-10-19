//
//  ViewController.swift
//  PhotoApp
//
//  Created by Wan Kim Mok on 10/18/16.
//  Copyright © 2016 Wan Kim Mok. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func selectPhotoButton(_ sender: AnyObject) {
        let alert = UIAlertController(title: "Select Photo", message: nil, preferredStyle: .actionSheet)
        
        let photolib = UIAlertAction(title: "Photo Library", style: .default) { (action) in
        }
        
        alert.addAction(photolib)
        
        let camera = UIAlertAction(title: "Camera", style: .default) { (action) in
            
        }
        
        alert.addAction(camera)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
        }
        
        alert.addAction(cancel)
        
        self.present(alert, animated: true){
            
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

