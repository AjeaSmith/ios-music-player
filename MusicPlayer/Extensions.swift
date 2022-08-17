//
//  Extensions.swift
//  MusicPlayer
//
//  Created by Ajea Smith on 8/15/22.
//

import Foundation

extension DateComponentsFormatter {
    static let positional: DateComponentsFormatter = {
        
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [.minute, .second]
        formatter.zeroFormattingBehavior = .pad
        
        return formatter
    }()
}
