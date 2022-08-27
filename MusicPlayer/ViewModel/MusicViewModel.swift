//
//  MusicViewModel.swift
//  MusicPlayer
//
//  Created by Ajea Smith on 8/15/22.
//

import Foundation
import AVFAudio
import AVFoundation

class MusicViewModel: ObservableObject {
    @Published var audioPlayer: AVAudioPlayer!
    @Published var isShuffled: Bool! = false
    
    init(){
    }
    @Published var songQueue: [String] = ["Rap God.mp3", "Cinderella Man.mp3", "Nasty.mp3", "Look over your shoulder.mp3", "United in grief.mp3"]
    
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
    
    func repeatSong(num: Int) {
        self.audioPlayer.numberOfLoops = num
    }
    func shuffle() {
        self.isShuffled = true
        let shuffle = self.songQueue.shuffled()
        self.songQueue = shuffle
    }
    func notShuffled() {
        self.isShuffled = false
        self.songQueue = ["Rap God.mp3", "Cinderella Man.mp3", "Nasty.mp3", "Look over your shoulder.mp3", "United in grief.mp3"]
    }
}
