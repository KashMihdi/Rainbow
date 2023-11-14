//
//  Statistics.swift
//  Rainbow
//
//  Created by Kasharin Mikhail on 14.11.2023.
//

import Foundation

struct Statistics: Identifiable {
    var id = UUID()
    let gameNumber: Int
    let speed: Double
    let time: Double
    let correctAnswer: Int
    let questions: Int
}
