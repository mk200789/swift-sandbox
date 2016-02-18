//
//  ViewController.swift
//  Working_with_audio
//
//  Created by Wan Kim Mok on 2/13/16.
//  Copyright (c) 2016 mk200789. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var slider: UISlider!
    
    @IBAction func volumeSlider(sender: AnyObject) {
        player.volume = slider.value
    }


    @IBAction func playButton(sender: AnyObject) {
        //get audio path
        let audioPath = NSBundle.mainBundle().pathForResource("my_cherie_amour", ofType: "mp3")!
        
        //set audio player with the content of the audio (audioPath)
        /*in Swift 2
        do{
        try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath), error: nil)
        player.play()
        }catch{
        //process error here
        }
        */
        player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath), error: nil)
        
        //run player
        player.play()
    }
    
    @IBAction func pauseButton(sender: AnyObject) {
        player.pause()
    }

    
    //act as a controller for the music which is set to be empty
    var player: AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

