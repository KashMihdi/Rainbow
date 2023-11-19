//
//  Statistics.swift
//  Rainbow
//
//  Created by Kasharin Mikhail on 14.11.2023.
//

import Foundation

struct Statistics: Identifiable, Codable {
    var id = UUID()
    let gameNumber: Int
    let speed: Double
    let time: Double
    let correctAnswer: Int
    let questions: Int
    
    init(
        id: UUID = UUID(),
        gameNumber: Int = 0,
        speed: Double = 0,
        time: Double = 0,
        correctAnswer: Int = 0,
        questions: Int = 0
    ) {
        self.id = id
        self.gameNumber = gameNumber
        self.speed = speed
        self.time = time
        self.correctAnswer = correctAnswer
        self.questions = questions
    }
}
