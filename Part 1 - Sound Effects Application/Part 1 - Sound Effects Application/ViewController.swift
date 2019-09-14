//
//  ViewController.swift
//  Part 1 - Sound Effects Application
//
//  Created by User on 8/9/19.
//  Copyright © 2019 Unitec. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var audioPlayer : AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func soundPressed(_ sender: UIButton) {
        // List of sound file names
        let soundList = ["Sound0", "Sound1", "Sound2"]
        var soundName = ""
        // Checks to ensure the tag number is within the bounds of the array
        if sender.tag < soundList.count && sender.tag >= 0 {
            soundName = soundList[sender.tag]
        }
        
        
        // Gets the sound resource
        if let soundResource = Bundle.main.url(forResource: soundName, withExtension: "wav") {
            do {
                // Think of this as putting CD in a CD player
                audioPlayer = try AVAudioPlayer(contentsOf: soundResource)
                
                // Plays the sound file
                audioPlayer?.play()
            } catch  {
                // Catches any errors that might occur while putting the CD in the CD player
                print(error)
            }
        }
    }
}

