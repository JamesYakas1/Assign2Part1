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
        print("Loaded")
    }
    


    //Function to pause sound when changing tabs
    override func viewWillDisappear(_ animated: Bool) {
        if let viewControllers = self.navigationController?.viewControllers {
            if viewControllers.count > 1 && viewControllers[viewControllers.count-2] == self {
                print("New view controller was pushed")
            }
            else {
                print("View controller was popped")
                audioPlayer?.pause()
                
                //Attempt to fix bug
                let button = self.view.viewWithTag(27) as! UIButton
                button.setTitle("\(labelName) is paused.", for: .normal)
                if (button.titleLabel!.text == "is paused."){
                    button.setTitle("\(labelName) is paused.", for: .normal)
                }
            }
            
        }
    }
    
    @IBAction func soundPressed(_ sender: UIButton) {
        // List of sound file names
        let soundList = ["Sound0", "Sound1", "Sound2", "Sound3", "Sound4", "Sound5", "Sound6","Sound7","Sound8","Sound9","Sound10","Sound11", "Sound12", "Sound13", "Sound14", "Sound15", "Sound16", "Sound17", "Sound18", "Sound19", "Sound20", "Sound21", "Sound22", "Sound23", "Sound24", "Sound25", "Sound26"]
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
                
                //Attempt to fix bug
                let button = self.view.viewWithTag(27) as! UIButton
                if (button.titleLabel!.text == "is paused."){
                    button.setTitle("\(labelName) is paused.", for: .normal)
                }
            }else {//audioPlayer!.isPlaying == false{
                print("Resumed")
                audioPlayer?.play()
                sender.setTitle("\(labelName) is playing.", for: .normal)
            }
            }
        }
        
        //If not tooggle On/Off
        if sender.tag != 27{
            print(sender.titleLabel!.text!)
            labelName = sender.titleLabel!.text!
            let button = self.view.viewWithTag(27) as! UIButton
            button.setTitle("\(labelName) is playing.", for: .normal)
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
}

