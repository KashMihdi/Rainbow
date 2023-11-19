//
//  Question.swift
//  Rainbow
//
//  Created by Kasharin Mikhail on 19.11.2023.
//

import Foundation

struct Question: Identifiable {
    var id = UUID()
    let colorName: String
    let color: LetterColor
    let position: String
}
