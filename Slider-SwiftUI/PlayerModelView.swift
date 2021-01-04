//
//  PlayerModelView.swift
//  Slider-SwiftUI
//
//  Created by Юрий Станиславский on 04.01.2021.
//

import SwiftUI
import AVKit

class PlayerViewModel: ObservableObject {
    @Published public var maxDuration = 0.0
    private var player: AVAudioPlayer?
    
    public func play() {
        playTrack(name: "One More Kiss, Dear")
        player?.play()
    }
    
    public func stop() {
        player?.stop()
    }
    
    public func setTime(value: Float) {
        guard let time = TimeInterval(exactly: value) else { return }
        player?.currentTime = time
        player?.play()
    }
    
    private func playTrack(name: String) {
        guard let audioPath = Bundle.main.path(forResource: name, ofType: "m4a") else { return }
        
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            maxDuration = player?.duration ?? 0.0
        } catch {
            print(error.localizedDescription)
        }
    }
}
