//
//  Extension + PreviewProvider.swift
//  Rainbow
//
//  Created by Kasharin Mikhail on 14.11.2023.
//

import SwiftUI

extension PreviewProvider {
    
    static var dev: PersonalPreview {
        PersonalPreview.instance
    }
    
}

final class PersonalPreview {
    
    static let instance = PersonalPreview()
    private init() {}
    
    let settingFirstOption = Settings(
        gameTime: 120,
        questionTime: 2,
        taskCheck: false,
        letterColor: LetterColor.allCases,
        letterSize: .large,
        lettersBacking: false,
        backgroundColor: .white,
        wordArrangement: .center
    )
    
    let settingSecondOption = Settings(
        gameTime: 120,
        questionTime: 2,
        taskCheck: true,
        letterColor: LetterColor.allCases,
        letterSize: .large,
        lettersBacking: true,
        backgroundColor: .white,
        wordArrangement: .random
    )
    
    let statistic = Statistics(
        gameNumber: 2,
        speed: 2,
        time: 11,
        correctAnswer: 11,
        questions: 20
    )
    
    var statistics: [Statistics] {
        [
            Statistics(gameNumber: 1, speed: 2, time: 12, correctAnswer: 11, questions: 13),
            Statistics(gameNumber: 2, speed: 1, time: 11, correctAnswer: 1, questions: 5),
            Statistics(gameNumber: 3, speed: 4, time: 10, correctAnswer: 12, questions: 15),
        ]
    }
    
}
