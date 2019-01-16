//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Tanvi Roy on 12/21/18.
//  Copyright © 2018 Tanvi Roy. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!

    var recordedAudioURL: URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    

    
    enum ButtonType: Int {
        case Slow = 0, Fast, Chipmunk, Vader, Echo, Reverb
    }
    
    @IBAction func playSoundForButton(_ sender: UIButton){
        switch(ButtonType(rawValue: sender.tag)!) {
        case .Slow:
            playSound(rate: 0.5)
        case .Fast:
            playSound(rate: 1.5)
        case .Chipmunk:
            playSound(pitch: 1000)
        case .Vader:
            playSound(pitch: -1000)
        case .Echo:
            playSound(echo: true)
        case .Reverb:
            playSound(reverb: true)
        }
        configureUI(.playing)
    }
    
    @IBAction func stopSoundForButton(_ sender: AnyObject){
        stopAudio()
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
        let arrayOfButtons = [snailButton, chipmunkButton, rabbitButton, vaderButton, echoButton, reverbButton, stopButton]
        for button in arrayOfButtons {
            button?.imageView?.contentMode = .scaleAspectFit
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
}
