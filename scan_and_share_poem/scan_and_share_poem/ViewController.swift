//
//  ViewController.swift
//  scan_and_share_poem
//
//  Created by Wan Kim Mok on 5/1/17.
//  Copyright © 2017 Wan Kim Mok. All rights reserved.
//

import UIKit
import TesseractOCR

class ViewController: UIViewController {

    
    @IBOutlet var textView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textView.isEditable = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func UploadPhoto(_ sender: Any) {
        textView.text = "Clicked!"
    }

}


