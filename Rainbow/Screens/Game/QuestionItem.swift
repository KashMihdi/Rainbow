//
//  QuestionItem.swift
//  Rainbow
//
//  Created by Kasharin Mikhail on 15.11.2023.
//

import SwiftUI

struct QuestionItem: View {
    @State private var isCorrect = false
    let colors: (String, LetterColor)
    let setting: Settings
    let completion: (Bool) -> ()
    
    var body: some View {
        HStack(spacing: 20) {
            Text(colors.0)
                .foregroundColor(
                    setting.lettersBacking
                    ? Color.white
                    : Color.letterColor(name: colors.1)
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
            ? Color.letterColor(name: colors.1)
            : Color.clear
        )
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct QuestionItem_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            QuestionItem(colors: ("розовый", .brown), setting: dev.settingFirstOption) { _ in }
            QuestionItem(colors: ("синий", .green), setting: dev.settingSecondOption) { _ in }
        }
    }
}
