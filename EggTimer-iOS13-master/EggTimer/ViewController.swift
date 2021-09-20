//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    var player: AVAudioPlayer!
    @IBOutlet weak var timerProgressbar: UIProgressView!
    @IBOutlet weak var titleLable: UILabel!
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard":7]
    var totalTime = 0
    var secondTimePass = 0
    var timer = Timer()
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timerProgressbar.progress = 0.0
        secondTimePass = 0
        timer.invalidate()
        let hardeness = sender.currentTitle!
        titleLable.text = hardeness
//        switch hardeness {
//        case "Soft":
//            print(eggTimes["Soft"]!)
//        case "Medium":
//            print(eggTimes["Medium"]!)
//        case "Hard":
//            print(eggTimes["HardTime"]!)
//        default: break
//        }
        totalTime = eggTimes[hardeness]!
        
       timer =  Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)

      
    }
    
    @objc func updateCounter() {
        if secondTimePass < totalTime {
            secondTimePass += 1
            timerProgressbar.progress = Float(secondTimePass) / Float(totalTime)
           
    } else {
            timer.invalidate()
            titleLable.text = "Done"
            playSound()
        }
    }
    
    func playSound() {
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
                    
        }
}
