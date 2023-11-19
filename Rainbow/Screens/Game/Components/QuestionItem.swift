//
//  QuestionItem.swift
//  Rainbow
//
//  Created by Kasharin Mikhail on 15.11.2023.
//

import SwiftUI

struct QuestionItem: View {
    @State private var isCorrect = false
    let colors: Question
    let setting: Settings
    let completion: (Bool) -> ()
    
    var body: some View {
        HStack(spacing: 20) {
            Text(colors.colorName)
                .foregroundColor(
                    setting.lettersBacking
                    ? Color.white
                    : Color.letterColor(name: colors.color)
                )
            if setting.taskCheck {
                Image(systemName: isCorrect ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.white)
                    .onTapGesture {
                        isCorrect.toggle()
                        completion(isCorrect)
                    }
            }
        }
        .font(Font.letterSize(setting.letterSize))
        .frame(width: 250)
        .padding(.vertical, 10)
        .background(
            setting.lettersBacking
            ? Color.letterColor(name: colors.color)
            : Color.clear
        )
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct QuestionItem_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            QuestionItem(colors: dev.question, setting: dev.settingFirstOption) { _ in }
            QuestionItem(colors: dev.question, setting: dev.settingSecondOption) { _ in }
        }
    }
}
