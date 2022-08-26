//
//  Song.swift
//  MusicPlayer
//
//  Created by Ajea Smith on 8/22/22.
//

import Foundation

struct Song: Hashable {
    var id: Int
    var name: String
    var songFile: String
    var artist: String
    var albumArt: String
}
