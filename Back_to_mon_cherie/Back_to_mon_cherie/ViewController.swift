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
    
    var timer: NSTimer!

    @IBOutlet var volumeSlider: UISlider!
    
    @IBOutlet var timeSlider: UISlider!
    
    @IBOutlet var playTime: UILabel!
    
    @IBAction func play(sender: AnyObject) {
        player.play()
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateTime", userInfo: nil, repeats: true)
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
        var moveTo = Float(player.duration) * Float(timeSlider.value)

        player.currentTime = NSTimeInterval(moveTo)
    }
    
    
    func updateTime() {

        
        timeSlider.value = Float(player.currentTime)/Float(player.duration)
        
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

