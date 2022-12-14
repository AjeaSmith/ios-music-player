//  ContentView.swift
//  ListMusic
//  Created by Ajea Smith on 8/15/22.
//

import SwiftUI
import AVFAudio

struct ListMusicView: View {
    
    @EnvironmentObject var musicModel: MusicViewModel
    var audioPlayer: AVAudioPlayer!
    
    init() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        
        NavigationView {
            ZStack(alignment: .leading){
                
                // MARK: - Background
                Color(red: 20/255, green: 0/255, blue: 79/255)
                    .ignoresSafeArea(.all, edges: .all)
                
                Circle()
                    .fill(Color(red: 147/255, green: 0/255, blue: 132/255))
                    .frame(width: 300, height: 300)
                    .position(x: 20, y: 370)
                    .blur(radius: 100)
                
                // MARK: - Browse
                VStack(alignment: .leading) {
                        
                    ScrollView(.horizontal, showsIndicators: false){
                        LazyHStack(spacing: 15) {
                            ForEach(musicModel.rapSongs, id: \.self) { song in
                                NavigationLink(destination: MusicPlayerView(song: song, currentSongIndex: song.id), label: {
                                    BrowseSongView(song: song)
                                })
                            }
                        }
                        
                    }
                    .navigationTitle("Browse")
                    .padding(.horizontal)
                    .frame(height:195)
                    
                    Text("Recommeded")
                        .bold()
                        .font(.title2)
                        .padding(.top)
                        .padding(.bottom)
                        .padding(.horizontal)
                    
                    // MARK: - Recommeded
                    ScrollView(showsIndicators: false){
                        LazyVStack(alignment: .leading, spacing: 15){
                            ForEach(musicModel.rapSongs, id: \.self) { song in
                                NavigationLink {
                                    MusicPlayerView(song: song, currentSongIndex: song.id)
                                } label: {
                                    RecommendedSongView(song: song)
                                }

                            }
                        }
                    }
                    .padding(.horizontal)
                    .frame(height:350)
                    
                }
                .foregroundColor(.white)

            }

        }
        
        
    }
}
