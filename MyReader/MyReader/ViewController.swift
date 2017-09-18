//
//  ViewController.swift
//  MyReader
//
//  Created by Wan Kim Mok on 9/17/17.
//  Copyright © 2017 Wan Kim Mok. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var content: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(content.text)
    }

    @IBAction func read(_ sender: Any) {
        let speechSynthesizer = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: content.text)
        utterance.voice = AVSpeechSynthesisVoice(language: "zh-HK")
        utterance.rate   = 0.5
        speechSynthesizer.speak(utterance)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

