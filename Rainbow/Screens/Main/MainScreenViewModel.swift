//
//  MainScreenViewModel.swift
//  Rainbow
//
//  Created by Kasharin Mikhail on 14.11.2023.
//

import Foundation

final class MainScreenViewModel: ObservableObject {
    @Published var openScreen = false
    @Published var screen: NavigateMainScreen = .main
}

enum NavigateMainScreen: String {
    case newGame = "Новая Игра"
    case continueGame = "Продолжить"
    case statistic = "Статистика"
    case settings = "gear"
    case rules = "questionmark"
    case main
    
    static var mainButton: [Self] {
        [.newGame, .continueGame, .statistic]
    }
}
