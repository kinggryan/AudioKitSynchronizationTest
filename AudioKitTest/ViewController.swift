//
//  ViewController.swift
//  AudioKitTest
//
//  Created by Ryan King on 12/15/16.
//  Copyright © 2016 Hello World Engineering. All rights reserved.
//

import UIKit
import AudioKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        // Create two players
        guard let fileURL = Bundle.main.url(forResource: "TestTone", withExtension: "wav") else {
            print("Could not find file in bundle.")
            return
        }
        do {
            let playerOne = try AKAudioPlayer(file: AKAudioFile(forReading: fileURL))
            let playerTwo = try AKAudioPlayer(file: AKAudioFile(forReading: fileURL))
            let mixer = AKMixer()
            mixer.connect(playerOne)
            mixer.connect(playerTwo)
            
            AudioKit.output = mixer
            AudioKit.start()

            playerOne.play(from: 0, to: 0.3, when: 0.5)
            playerTwo.play(from: 0.3, to: 1.0, when: 0.8)
        } catch let e {
            print("ERROR: \(e.localizedDescription)")
        }
    }
}

