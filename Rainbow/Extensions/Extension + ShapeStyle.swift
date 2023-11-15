//
//  Extension + ShapeStyle.swift
//  Rainbow
//
//  Created by Kasharin Mikhail on 15.11.2023.
//

import SwiftUI

extension ShapeStyle where Self == Color {
    
    static func mainScreenButtonColor(_ state: NavigateMainScreen) -> Color {
        switch state {
        case .newGame: return .red
        case .continueGame: return .blue
        case .statistic: return .green
        case .settings, .rules: return .purple
        case .main: return .clear
        }
    }
}
