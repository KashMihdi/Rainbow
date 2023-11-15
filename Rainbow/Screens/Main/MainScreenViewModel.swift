//
//  MainScreenViewModel.swift
//  Rainbow
//
//  Created by Kasharin Mikhail on 14.11.2023.
//

import Foundation
import SwiftUI

final class MainScreenViewModel: ObservableObject {
    
    @Published var openRules = false
    @Published var openScreen = false
    @Published var screen: NavigateMainScreen = .statistic
    
    
    func navigate(_ states: ButtonStates) {
        switch states {
        case .newGame:
            screen = .newGame
        case .continueGame:
            screen = .newGame
        case .statisticGame:
            screen = .statistic
        }
        openScreen.toggle()
    }
}

enum NavigateMainScreen {
    case newGame, statistic, settings
}
