//  ContentView.swift
//  MusicPlayer
//  Created by Ajea Smith on 8/15/22.
//

import SwiftUI
import AVFoundation

struct MusicPlayerView: View {
    init() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    @StateObject var musicModel = MusicViewModel()
    @State private var currentTime = 0.0
    @State private var duration = 0.0
    @State private var value = 50.0
    @State private var isEditing = false
    
    let timer = Timer.publish(every: 0.5, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        
        NavigationView {
            ZStack(alignment:.leading){
                
                // MARK: - Background
                Color(red: 20/255, green: 0/255, blue: 79/255)
                    .ignoresSafeArea(.all, edges: .all)
                
                Circle()
                    .fill(Color(red: 147/255, green: 0/255, blue: 132/255))
                    .frame(width: 200, height: 200)
                    .position(x: 0, y: 570)
                    .blur(radius: 100)
                
                // MARK: - Browse
                VStack {
                    ScrollView(.horizontal, showsIndicators: false){
                        BrowseSongView()
                    }
                    .frame(height:195)
                    
                    Spacer()
                    
                    // MARK: - Recommeded
                    ScrollView(showsIndicators: false){
                        RecommendedSongView()
                    }.frame(height:415)
                }
                .foregroundColor(.white)
                .padding()

            }
            
            .navigationTitle("Browse")

        }
//        VStack {
//            Button {
//                musicModel.playAudio()
//            } label: {
//                Text("Play Sound")
//            }
//            .padding()
//            .background(.blue)
//            .foregroundColor(.white).cornerRadius(10)
//
//            Button {
//                // pause the sound
//                musicModel.pauseAudio()
//            } label: {
//                Text("Pause Sound")
//            }
//            .padding()
//            .background(.red)
//            .foregroundColor(.white).cornerRadius(10)
//
//            Slider(
//                value: $value,
//                in: 0...100,
//                onEditingChanged: { editing in
//                    isEditing = editing
//                }
//            )
//            Text("\(value)")
//                .foregroundColor(isEditing ? .red : .blue)
//
//            HStack{
//                // remove leading zeros from time
//                Text(DateComponentsFormatter.positional.string(from: currentTime)?.dropFirst() ?? "0:00")
//
//                Text(DateComponentsFormatter.positional.string(from: duration - currentTime)?.dropFirst() ?? "0:00")
//            }
//            .padding()
//
//        }.onReceive(timer) { _ in
//            // set current time and duration to time interval
//            duration = musicModel.audioPlayer.duration
//            currentTime = musicModel.audioPlayer.currentTime
//        }
        
        
    }
}

struct MusicPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        MusicPlayerView()
    }
}
