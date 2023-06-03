//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        // start button animation
        sender.backgroundColor?.withAlphaComponent(0.7)
        sender.alpha = 0.7
        // play note
        playSound(soundName: sender.currentTitle!)
        Thread.sleep(forTimeInterval: 0.2)
        // finish button animation
        sender.backgroundColor?.withAlphaComponent(1.0)
        sender.alpha = 1.0
    }
    
    func playSound(soundName: String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            // required for iOS 11.
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            
            guard let player = player else { return }
            
            player.play()
        } catch let error {
            print(error)
        }
    }
}

