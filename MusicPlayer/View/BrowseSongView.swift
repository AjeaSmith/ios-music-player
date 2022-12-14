//
//  BrowseSongView.swift
//  MusicPlayer
//
//  Created by Ajea Smith on 8/16/22.
//

import SwiftUI

struct BrowseSongView: View {
    var song: Song
    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            Image(song.albumArt)
                .resizable()
                .scaledToFill()
                .frame(width: 122, height: 138)
                .cornerRadius(18)

            VStack(alignment: .leading){
                Text(song.name.replacingOccurrences(of: song.name.dropFirst(10), with: "..."))
                    .bold()
                    .font(.custom("helvetica", size: 16.0))
                    .foregroundColor(.white)
                    
                Text(song.artist)
                    .font(.custom("helvetica", size: 14.0))
                    .foregroundColor(Color(red: 255/255, green: 255/255, blue: 255/255, opacity: 0.6))
            }
            .padding(.horizontal, 10)
        }
    }
}

//struct BrowseSongView_Previews: PreviewProvider {
//    static var previews: some View {
//        BrowseSongView(song: Song(name: "", songFile: "", artist: "", albumArt: ""))
//    }
//}
