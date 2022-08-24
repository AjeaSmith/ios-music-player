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
        Song(name: "Rap God", songFile: "Rap God.mp3", artist: "Eminem", albumArt: "rap_god"),
        Song(name: "Cinderalla Man", songFile: "Cinderella Man.mp3", artist: "Eminem",albumArt: "cinderella_man"),
        Song(name: "Nasty", songFile: "Nasty.mp3", artist: "Logic", albumArt: "nasty"),
        Song(name: "Look over your shoulders", songFile: "Look Over Your Shoulders.mp3", artist: "Busta Rhymes", albumArt: "look_over_your_shoulders"),
        Song(name: "United in grief", songFile: "United In Grief.mp3", artist: "Kendrick Lamar", albumArt: "united_in_grief")
    ]
//    var popSongs = [
//        Song(name: "Rap God", songFile: "", artist: "Eminem"),
//        Song(name: "Cinderalla Man", songFile: "", artist: "Eninem"),
//        Song(name: "Nasty", songFile: "", artist: "Logic"),
//        Song(name: "Look over your shoulders", songFile: "", artist: "Busta Rhymes"),
//        Song(name: "United in grief", songFile: "", artist: "Kendrick Lamar")
//    ]
    
    func playAudio() {
        self.audioPlayer.prepareToPlay()
        self.audioPlayer.play()
    }
    func pauseAudio() {
        self.audioPlayer?.pause()
    }
}
