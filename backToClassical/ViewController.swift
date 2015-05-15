//
//  ViewController.swift
//  backToClassical
//
//  Created by Scott Yoshimura on 5/13/15.
//  Copyright (c) 2015 west coast dev. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var audioPlayer:AVAudioPlayer = AVAudioPlayer()
    var pauseTimer:NSTimeInterval = 0.0
    
    
    @IBOutlet weak var sldrValue: UISlider!

    @IBAction func btnPlay(sender: AnyObject) {
        
    var audioLocation = NSBundle.mainBundle().pathForResource("BrucknerLocusIste", ofType: "mp3")!
    
    var errorMessage:NSError? = nil
        
    audioPlayer = AVAudioPlayer(contentsOfURL: NSURL(string: audioLocation), error: &errorMessage)
        
        if errorMessage == nil {
            audioPlayer.currentTime = pauseTimer
            audioPlayer.play()
        } else {
            println(errorMessage)
        }
    }

    
    @IBAction func btnPause(sender: AnyObject) {
        audioPlayer.pause()
        pauseTimer = audioPlayer.currentTime
    }


    @IBAction func btnStop(sender: AnyObject) {
        audioPlayer.stop()
        pauseTimer = 0.0
    }
    

    @IBAction func actionSlider(sender: AnyObject) {
        audioPlayer.volume = sldrValue.value
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

