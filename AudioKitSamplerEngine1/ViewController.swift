//
//  ViewController.swift
//  AudioKitSamplerEngine1
//
//  Created by Erik on 2019-03-20.
//  Copyright © 2019 Erik. All rights reserved.
//

import UIKit

var soundEngine: SoundEngine!

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        soundEngine = SoundEngine()
    }

    @IBAction func button(_ sender: Any) {
        soundEngine.playSound()
        print("play sound")
    }
}

