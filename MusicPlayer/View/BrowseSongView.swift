//
//  BrowseSongView.swift
//  MusicPlayer
//
//  Created by Ajea Smith on 8/16/22.
//

import SwiftUI

struct BrowseSongView: View {
    var body: some View {
        LazyHStack(spacing: 15) {
            ForEach(0..<7){_ in
                VStack(alignment: .leading, spacing: 15){
                    Rectangle()
                        .fill(.blue)
                        .frame(width: 122, height: 138)
                        .cornerRadius(18)
                    VStack(alignment: .leading){
                        Text("Clear mind")
                            .bold()
                            .font(.custom("helvetica", size: 16.0))
                            .foregroundColor(.white)
                        Text("instrumental")
                            .font(.custom("helvetica", size: 14.0))
                            .foregroundColor(Color(red: 255/255, green: 255/255, blue: 255/255, opacity: 0.6))
                    }
                    .padding(.horizontal, 10)
                }
            }
        }
       
    }
}

struct BrowseSongView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseSongView()
    }
}
