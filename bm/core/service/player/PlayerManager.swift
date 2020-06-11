//
//  PlayerManager.swift
//  bm
//
//  Created by GoFelis on 2020/6/11.
//  Copyright © 2020 gofelis. All rights reserved.
//

import Foundation
import AVFoundation

final class PlayerManager: PlayerManagerInterface {
    
    let player:AVPlayer
    init() {
        let url = Bundle.main.url(forResource: "test", withExtension: "mp3")!
        player = AVPlayer(url:  url)
        player.volume = 1
        setupSession()
    }
    
    private func setupSession(){
    let audioSession = AVAudioSession.sharedInstance()
        do {
            // Set the audio session category, mode, and options.
            try audioSession.setCategory(.playback, mode: .moviePlayback, options: [])
        } catch {
            print("Failed to set audio session category.")
        }
    }
    func play() {
        
        player.play()
    }
    
    func pause() {
        player.pause()
    }
    
    func stop() {
        player.pause()
        player.replaceCurrentItem(with: nil)
    }
    
    weak var delegate: PlayerManagerDelegate?
}
