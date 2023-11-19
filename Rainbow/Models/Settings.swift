//
//  Settings.swift
//  Rainbow
//
//  Created by Kasharin Mikhail on 14.11.2023.
//

import Foundation

struct Settings: Codable {
    var isContinue: Bool
    var gameTime: Double
    var questionTime: Double
    var taskCheck: Bool
    var letterColor: [LetterColor]
    var letterSize: LetterSize
    var lettersBacking: Bool
    var backgroundColor: BackgroundColor
    var wordArrangement: WordArrangement
    var continueTime: Double
    
    init(
        isContinue: Bool = false,
        gameTime: Double = 120,
        questionTime: Double = 2,
        taskCheck: Bool = false,
        letterColor: [LetterColor] = LetterColor.allCases,
        letterSize: LetterSize = .large,
        lettersBacking: Bool = false,
        backgroundColor: BackgroundColor = .white,
        wordArrangement: WordArrangement = .center,
        continueTime: Double = 0
    ) {
        self.isContinue = isContinue
        self.gameTime = gameTime
        self.questionTime = questionTime
        self.taskCheck = taskCheck
        self.letterColor = letterColor
        self.letterSize = letterSize
        self.lettersBacking = lettersBacking
        self.backgroundColor = backgroundColor
        self.wordArrangement = wordArrangement
        self.continueTime = continueTime
    }
}

enum LetterColor: String, Codable, CaseIterable, Equatable {
    case green = "зеленый"
    case purple = "фиолетовый"
    case red = "красный"
    case yellow = "желтый"
    case black = "черный"
    case brown = "коричневый"
    case pink = "розовый"
    case orange = "оранжевый"
    
    static func hash() -> String {
        UUID().uuidString
    }
}
enum LetterSize: Int, Codable {
    case small, medium, large
    
    mutating func next() {
        switch self {
        case .large: self = .small
        case .medium: self = .large
        case .small: self = .medium
        }
    }
    
    mutating func previos() {
        switch self {
        case .large: self = .medium
        case .medium: self = .small
        case .small: self = .large
        }
    }
}
enum BackgroundColor: String, Codable, CaseIterable {
    case gray = "Серый"
    case white = "Белый"
    case black = "Черный"
}
enum WordArrangement: String, Codable, CaseIterable {
    case random = "Случайное"
    case center = "По центру"
    
    static let alignment: [String] = [
        "center", "top", "bottom", "trailing", "leading"
    ]
}
