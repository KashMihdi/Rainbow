//
//  GameViewModel.swift
//  Rainbow
//
//  Created by Kasharin Mikhail on 15.11.2023.
//

import Foundation


final class GameViewModel: ObservableObject {
    @Published var settings: Settings = .init()
    let dataManager = DataManager()
    
    init() {
        dataManager.settings = settings
    }
}
