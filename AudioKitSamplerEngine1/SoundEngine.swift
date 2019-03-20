//
//  SoundEngine.swift
//  AudioKitSamplerEngine1
//
//  Created by Erik on 2019-03-20.
//  Copyright © 2019 Erik. All rights reserved.
//

import Foundation
import AudioKit

open class SoundEngine {
    
    var sampler: AKSampler!
    var mixer: AKMixer!
    
    init() {
        
        sampler = AKSampler()
        
        do {
            let url = Bundle.main.url(forResource: "sound", withExtension: "wav")
            print(url!)
            let file = try AKAudioFile(forReading: url!)
            print(file)
            sampler.loadAKAudioFile(from: AKSampleDescriptor(noteNumber: 1, noteFrequency: Float(AKPolyphonicNode.tuningTable.frequency(forNoteNumber:1)), minimumNoteNumber: -1, maximumNoteNumber: -1, minimumVelocity: -1, maximumVelocity: -1, isLooping: false, loopStartPoint: 0, loopEndPoint: 0, startPoint: 0.0, endPoint: Float(file.length)), file: file)
            sampler.buildSimpleKeyMap()
        }
        catch {
            print(error)
        }
        
        mixer = AKMixer(sampler)
        
        AudioKit.output = mixer
        
        do {
            try AudioKit.start()
        }
        catch {
            print(error)
        }
    }
    
    func playSound() {
        sampler.masterVolume = 1.0
        sampler.play(noteNumber: 1, velocity: 100)
    }
}
