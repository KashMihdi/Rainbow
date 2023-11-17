//
//  GameViewModel.swift
//  Rainbow
//
//  Created by Kasharin Mikhail on 15.11.2023.
//

import Foundation
import Combine

final class GameViewModel: ObservableObject {
    
    @Published var settings: Settings = .init()
    @Published var publishedTime: String = ""
    let timerService = TimerService()
    var cancellable = Set<AnyCancellable>()
    
    init() {
        updateTime()
    }
    
    private func updateTime() {
        timerService.timerTick
            .sink { [unowned self] _ in
                self.settings.continueTime -= 1
                formatTime(self.settings.continueTime)
            }
            .store(in: &cancellable)
    }
    
    func updateSettings(_ settings: Settings, isNewGame: Bool) {
        self.settings = settings
        if isNewGame {
            self.settings.continueTime = settings.gameTime
        }
        formatTime(self.settings.continueTime)
    }
    
    func saveSettings(_ data: DataManager) {
        timerService.stopTimer()
        if self.settings.continueTime == settings.gameTime {
            self.settings.continueTime = 0
        }
        data.settings = self.settings
    }
    
    private func formatTime(_ value: Double) {
        let second = Int(value)
        let screenSecond = second % 60
        let screenMinute = (second - screenSecond) / 60
        publishedTime = "\(screenMinute.addZero()):\(screenSecond.addZero())"
    }
    
    private func updateQuestions(_ time: Double) {
        if Int(time) % Int(settings.questionTime) == 0 {
            let newWords = LetterColor.allCases.map(\.rawValue).shuffled().suffix(5)
            let newColor = LetterColor.allCases.shuffled().suffix(5)
            let newQuestions = zip(newWords, newColor)
        }
    }
    
    deinit {
        print("Unload")
    }
    
}
