//
//  MusicViewModel.swift
//  MusicPlayer
//
//  Created by Ajea Smith on 8/15/22.
//

import Foundation
import AVFAudio

class MusicViewModel: ObservableObject {
    @Published var audioPlayer = AVAudioPlayer()
    @Published var duration = 0
    
    init(){
        let soundFile = Bundle.main.path(forResource: "Eminem.mp3", ofType: nil)!
        
        let soundFileUrl = URL(fileURLWithPath: soundFile)
        
        do{
            // set audio player instance
            self.audioPlayer = try AVAudioPlayer(contentsOf: soundFileUrl)
        }catch{
            print("Audio file not found", error)
        }
    }
    
    func playAudio() {
        self.audioPlayer.play()
    }
    func pauseAudio() {
        self.audioPlayer.pause()
    }
}
