//
//  ViewController.swift
//  Back_to_mon_cherie
//
//  Created by Wan Kim Mok on 2/18/16.
//  Copyright (c) 2016 mk200789. All rights reserved.
//

import UIKit
import AVFoundation

/*
task:
    - a title
    - play, pause, and stop button
    - an image
    - a volume slider
    - a slider to move along the song
*/

class ViewController: UIViewController {
    
    var player: AVAudioPlayer = AVAudioPlayer()

    @IBOutlet var volumeSlider: UISlider!
    
    @IBAction func play(sender: AnyObject) {
        player.play()
    }
    
    @IBAction func pause(sender: AnyObject) {
        player.pause()
    }
    
    @IBAction func stop(sender: AnyObject) {
        player.stop()
        player.currentTime = 0
    }
    @IBAction func volume(sender: AnyObject) {
        player.volume = volumeSlider.value
    }
    
    @IBAction func scrubSong(sender: AnyObject) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let audioPath = NSBundle.mainBundle().pathForResource("my_cherie_amour", ofType: "mp3")!
        player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath), error: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

