//
//  RecommendedSongView.swift
//  MusicPlayer
//
//  Created by Ajea Smith on 8/16/22.
//

import SwiftUI

struct RecommendedSongView: View {
    var stickyHeaderView: some View {
        
        ZStack(alignment: .leading){
            Color(red: 20/255, green: 0/255, blue: 79/255)
            Text("Recommended")
                .bold()
                .font(.title2)
                .padding(.top)
                .padding(.bottom)
        }
    }
    var body: some View {
        LazyVStack(alignment: .leading, pinnedViews: [.sectionHeaders]){
            Section(header: stickyHeaderView ) {
                ForEach(0 ..< 5) { item in
                    HStack(spacing: 16){
                       Rectangle()
                            .fill(.blue)
                            .frame(width: 75, height: 75)
                            .cornerRadius(20)
                        VStack(alignment: .leading) {
                            Text("Good 4 U")
                                .fontWeight(.bold)
                            Text("Olivia Rodrigo")
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
//            Text("Recommended")
//                .bold()
//                .font(.title2)
//                .padding(.bottom)
        }
    }
}

struct RecommendedSongView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedSongView()
    }
}
