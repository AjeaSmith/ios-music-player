//
//  MusicViewModel.swift
//  MusicPlayer
//
//  Created by Ajea Smith on 8/15/22.
//

import Foundation
import AVFAudio

class MusicViewModel: ObservableObject {
    @Published var audioPlayer: AVAudioPlayer!
    
    init(){
    }
    var rapSongs = [
        Song(id: 1, name: "Rap God", songFile: "Rap God.mp3", artist: "Eminem", albumArt: "rap_god"),
        Song(id: 2, name: "Cinderalla Man", songFile: "Cinderella Man.mp3", artist: "Eminem",albumArt: "cinderella_man"),
        Song(id: 3, name: "Nasty", songFile: "Nasty.mp3", artist: "Logic", albumArt: "nasty"),
        Song(id: 4, name: "Look over your shoulder", songFile: "Look over your shoulder.mp3", artist: "Busta Rhymes", albumArt: "look_over_your_shoulders"),
        Song(id: 5, name: "United in grief", songFile: "United in grief.mp3", artist: "Kendrick Lamar", albumArt: "united_in_grief")
    ]
    
    func play() {
        self.audioPlayer.prepareToPlay()
        self.audioPlayer.play()
    }
    func pause() {
        self.audioPlayer?.pause()
    }
    func repeatSong() {
        if audioPlayer.numberOfLoops == -1 {
            audioPlayer.numberOfLoops = 0
        }else {
            audioPlayer.numberOfLoops = -1
        }
    }
}
