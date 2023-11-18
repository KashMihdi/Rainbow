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
    @Published var questions: [(String, LetterColor)] = .init()
    var correctAnswers: [Int] = .init()
    let timerService = TimerService()
    var cancellable = Set<AnyCancellable>()
    
    init() {
        updateTime()
    }
    
    private func updateTime() {
        timerService.timerTick
            .sink { [unowned self] _ in
                updateQuestions(self.settings.continueTime)
                formatTime(self.settings.continueTime)
                self.settings.continueTime -= 1
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
        data.statistics.append(createStatistics(number: data.statistics.count + 1))
    }
    
    private func formatTime(_ value: Double) {
        let second = Int(value)
        let screenSecond = second % 60
        let screenMinute = (second - screenSecond) / 60
        publishedTime = "\(screenMinute.addZero()):\(screenSecond.addZero())"
    }
    
    private func updateQuestions(_ time: Double) {
        if Int(time) % Int(settings.questionTime) == 0 {
            let newWords = LetterColor.allCases.map(\.rawValue).shuffled().prefix(5)
            let newColor = LetterColor.allCases.shuffled().prefix(5)
            questions = (0..<5).reduce([]) { (result, index) in
                result + [(newWords[index], newColor[index])]
            }
        }
    }
    
    func appendCorrectAnswer(_ isSelected: Bool) {
        isSelected ? correctAnswers.append(1) : correctAnswers.append(-1)
    }
    
    private func createStatistics(number: Int) -> Statistics {
        Statistics(gameNumber: number, speed: settings.questionTime, time: settings.gameTime, correctAnswer: correctAnswers.reduce(0, +), questions: Int(settings.gameTime) / Int(settings.questionTime))
    }
    
    deinit {
        print("Unload")
    }
    
}
