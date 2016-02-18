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
    
    //act as a controller for the music which is set to be empty
    var player: AVAudioPlayer = AVAudioPlayer()
    
    @IBAction func volumeSlider(sender: AnyObject) {
        player.volume = slider.value
    }

    @IBAction func playButton(sender: AnyObject) {
        //run player
        player.play()
    }
    
    @IBAction func pauseButton(sender: AnyObject) {
        player.pause()
    }

    @IBAction func stopButton(sender: AnyObject) {
        player.stop()
        //reset the currentTime of the player to the beginning
        player.currentTime = 0
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

