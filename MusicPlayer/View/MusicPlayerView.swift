//
//  MusicPlayerView.swift
//  MusicPlayer
//
//  Created by Ajea Smith on 8/22/22.
//

import SwiftUI
import AVFoundation

struct MusicPlayerView: View {
    @EnvironmentObject var musicManager: MusicViewModel
    
    @State var song: Song
    @State var currentSongIndex: Int
    
    @State private var currentTime = 0.0
    @State private var duration = 0.0
    @State private var value = 0.0
    @State private var isEditing = false
    @State private var songs: [String] = ["Rap God.mp3", "Cinderella Man.mp3", "Nasty.mp3", "Look over your shoulder.mp3", "United in grief.mp3"]
    
    let timer = Timer.publish(every: 0.5, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        ZStack {
            // MARK: - Background
            Color(red: 20/255, green: 0/255, blue: 79/255)
                .ignoresSafeArea(.all, edges: .all)
            
            Circle()
                .fill(Color(red: 147/255, green: 0/255, blue: 132/255))
                .frame(width: 300, height: 300)
                .position(x: 20, y: 370)
                .blur(radius: 100)
            
            VStack{
                // MARK: - Album Art
                Image(song.albumArt)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 281, height: 321)
                    .cornerRadius(48)
                
                // MARK: - Song Info
                VStack{
                    Text(song.name)
                        .font(Font.system(size: 16))
                        .bold()
                    Text(song.artist)
                        .font(Font.system(size: 14))
                }
                .padding(.top, 20)
                
                if let player = musicManager.audioPlayer{
                    // MARK: - Slider and Song Time
                    VStack{
                        Slider(
                            value: $value,
                            in: 0...player.duration,
                            onEditingChanged: { editing in
                                
                                if !editing {
                                    player.currentTime = value
                                }
                                isEditing = editing
                            }
                        )
                        .padding(.bottom, 22)
                        
                            
                        HStack{
                            Text(DateComponentsFormatter.positional.string(from: currentTime)?.dropFirst() ?? "0:00")
                            Spacer()
                            Text(DateComponentsFormatter.positional.string(from: duration - currentTime)?.dropFirst() ?? "0:00")
                        }
                        .foregroundColor(Color(red: 217/255, green: 217/255, blue: 217/255, opacity: 0.8))
                    }
                    .padding(.horizontal)
                    
                    // MARK: - Controls
                    Spacer()
                    HStack(spacing: 15){
                        ButtonComponent(labelIcon: "shuffle", action: {
                            musicManager.playAudio()
                        }, size: 17)
                        
                        ButtonComponent(labelIcon: "backward.end.fill", action: {
                            musicManager.playAudio()
                        }, size: 30)
                        .padding(.leading)
                        
                        if !player.isPlaying {
                            ButtonComponent(labelIcon: "play.circle.fill", action: {
                                musicManager.playAudio()
                            }, size: 90)
                        }else{
                            ButtonComponent(labelIcon: "pause.circle.fill", action: {
                                musicManager.pauseAudio()
                            }, size: 90)
                        }
                        
                        ButtonComponent(labelIcon: "forward.end.fill", action: {
                            if songs.count != currentSongIndex  {
                                currentSongIndex += 1
                               
                                self.ChangeSongs()
                            }else{
                                currentSongIndex = 1
                                self.ChangeSongs()
                            }
                        }, size: 30)
                        .padding(.trailing)
                        
                        ButtonComponent(labelIcon: "repeat", action: {
                            musicManager.playAudio()
                        }, size: 17)
                        
                    }
                    Spacer()
                }
            }
            .onReceive(timer) { _ in
                guard let player = musicManager.audioPlayer, !isEditing else { return }
                
                // set current time and duration to time interval
                duration = player.duration
                currentTime = player.currentTime
                value = player.currentTime
            }
            .onAppear {
                // get the url song path
                let soundFile = Bundle.main.path(forResource: song.songFile, ofType: nil)
                
                // set the audio player when view appears
                musicManager.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundFile!))
            }
            
        }
        .foregroundColor(.white)

    }
    func ChangeSongs(){
        
        let url = Bundle.main.path(forResource: songs[currentSongIndex - 1], ofType: nil )
        musicManager.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
        
        // get next apporiate song object by currentIndex
        let nextSong = musicManager.rapSongs.first { song in
            songs[currentSongIndex - 1] == song.songFile
        }
        
        // set the current song to next song for UI update
        song = nextSong ?? Song(id: 1, name: "", songFile: "", artist: "", albumArt: "")
        
        musicManager.audioPlayer.play()

    }
}

