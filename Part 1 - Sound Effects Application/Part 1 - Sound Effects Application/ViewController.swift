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
    var labelName:String = ""
    
    @IBAction func landAnimalOn(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func soundPressed(_ sender: UIButton) {
        // List of sound file names
        let soundList = ["Sound0", "Sound1", "Sound2", "Sound3", "Sound4", "Sound5", "Sound6","Sound7","Sound8"]
        var soundName = ""
        // Checks to ensure the tag number is within the bounds of the array
        if sender.tag < soundList.count && sender.tag >= 0 {
            soundName = soundList[sender.tag]
        }
        
        //Toogle sound on/off
        if sender.tag == 27{
//                sender.setTitle("\(labelName) is playing.", for: .normal)
            if audioPlayer != nil{
            if audioPlayer?.isPlaying == true{
                print("Paused")
                //audioPlayer?.isPlaying = false
                audioPlayer?.pause()
                sender.setTitle("\(labelName) is paused.", for: .normal)
                
                //audioPlayer?.stop()
            }else {//audioPlayer!.isPlaying == false{
                print("Resumed")
                audioPlayer?.play()
                sender.setTitle("\(labelName) is playing.", for: .normal) //= "\(labelName) is playing."
            }
            }
        }
        
        if sender.tag != 27{
            print(sender.titleLabel!.text!)
            labelName = sender.titleLabel!.text!
            var button = self.view.viewWithTag(27) as! UIButton
            button.setTitle("\(labelName) is playing.", for: .normal)
        // Gets the sound resource
        if let soundResource = Bundle.main.url(forResource: soundName, withExtension: "wav") {
            do {
                // Think of this as putting CD in a CD player
                audioPlayer = try AVAudioPlayer(contentsOf: soundResource)
                
                // Plays the sound file
                audioPlayer?.play()
                print("Paused2")
                //Toggle pause/resume
//                if sender.tag == 27{
//                    if audioPlayer?.isPlaying == true{
//                        print("Paused")
//                        //audioPlayer?.isPlaying = false
//                        audioPlayer?.pause()
//                        //audioPlayer?.stop()
//                    }else {//audioPlayer!.isPlaying == false{
//                        print("Resumed")
//                        audioPlayer?.play()
//                    }
//
//                }
            } catch  {
                // Catches any errors that might occur while putting the CD in the CD player
                print(error)
            }
        }
        }
    }
}

