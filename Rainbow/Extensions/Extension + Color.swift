//
//  Extension + Color.swift
//  Rainbow
//
//  Created by Kasharin Mikhail on 14.11.2023.
//

import SwiftUI

extension Color {
    
    static func letterColor(name: LetterColor) -> Self {
        switch name {
        case .green:
            return .green
        case .purple:
            return .purple
        case .red:
            return .red
        case .yellow:
            return .yellow
        case .black:
            return .black
        case .brown:
            return .brown
        case .pink:
            return .pink
        case .orange:
            return .orange
        }
    }
    
    static func background(name: BackgroundColor) -> Self {
        switch name {
        case .gray:
            return .gray
        case .white:
            return .white
        case .black:
            return .black
        }
    }
}


