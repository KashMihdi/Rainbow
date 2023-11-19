//
//  GameViewModel.swift
//  Rainbow
//
//  Created by Kasharin Mikhail on 15.11.2023.
//

import Foundation
import Combine

final class GameViewModel: ObservableObject {
    
    //  MARK: - Published properties
    @Published var settings: Settings = .init()
    @Published var publishedTime: String = ""
    @Published var questions: [Question] = .init()
    @Published var isFinished = false
    @Published var isStopped = true
    
    //  MARK: - Helpers properties
    let timerService = TimerService()
    let statistics: Statistics = .init()
    var correctAnswers: [Int] = .init()
    var cancellable = Set<AnyCancellable>()
    
    //  MARK: - init()
    init() {
        updateTime()
    }
    
    //  MARK: - Timer Publisher
    private func updateTime() {
        timerService.timerTick
            .sink { [unowned self] _ in
                updateQuestions(self.settings.continueTime)
                formatTime(self.settings.continueTime)
                if self.settings.continueTime.isZero {
                    timerService.stopTimer()
                    isFinished.toggle()
                    return
                }
                self.settings.continueTime -= 1
            }
            .store(in: &cancellable)
    }
    
    //  MARK: - Create new questions
    private func updateQuestions(_ time: Double) {
        if Int(time) % Int(settings.questionTime) == 0 {
            let newWords = LetterColor.allCases.map(\.rawValue).shuffled().prefix(5)
            let newColors = settings.letterColor.shuffled().prefix(5)
            let positions = WordArrangement.alignment.shuffled()
            questions = (0..<5).reduce([]) { (result, index) in
                result + [Question(colorName: newWords[index], color: newColors[index], position: positions[index])]
            }
        }
    }
    
    //  MARK: - Create Statistic
    private func createStatistics(number: Int) -> Statistics {
        Statistics(
            gameNumber: number,
            speed: settings.questionTime,
            time: settings.gameTime,
            correctAnswer: correctAnswers.reduce(0, +),
            questions: Int(settings.gameTime) / Int(settings.questionTime) * questions.count
        )
    }
    
    //  MARK: - Formatter for timer
    private func formatTime(_ value: Double) {
        let second = Int(value)
        let screenSecond = second % 60
        let screenMinute = (second - screenSecond) / 60
        publishedTime = String(format: "%02d:%02d", screenMinute, screenSecond)
    }
    
    //  MARK: - Public methods
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
        if self.settings.continueTime.isZero {
            data.statistics.append(createStatistics(number: data.statistics.count + 1))
        }
    }
    
    //  MARK: -
    func updateAlignment(_ arrangement: WordArrangement) -> Bool {
        arrangement == .random  ? true : false
    }
    
    //  MARK: - Counter correct answers
    func appendCorrectAnswer(_ isSelected: Bool) {
        isSelected ? correctAnswers.append(1) : correctAnswers.append(-1)
    }
}
