//
//  RecommendedSongView.swift
//  MusicPlayer
//
//  Created by Ajea Smith on 8/16/22.
//

import SwiftUI

struct RecommendedSongView: View {
    var song: Song
    var body: some View {
        HStack(spacing: 15){
            Image(song.albumArt)
                .resizable()
                .scaledToFill()
                .frame(width: 75, height: 75)
                .cornerRadius(20)
            VStack(alignment: .leading) {
                Text(song.name)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                Text(song.artist)
                    .fontWeight(.light)
                    .foregroundColor(Color(red: 255/255, green: 255/255, blue: 255/255, opacity: 0.6))
            }
            Spacer()
            HStack {
                Circle().frame(width: 10, height: 10)
                Circle().frame(width: 10, height: 10)
            }
            
        }
    }
}

struct RecommendedSongView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedSongView(song: Song(name: "", songFile: "", artist: "", albumArt: ""))
    }
}
