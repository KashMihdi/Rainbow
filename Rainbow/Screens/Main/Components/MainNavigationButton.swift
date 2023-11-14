//
//  MainNavigationButton.swift
//  Rainbow
//
//  Created by Kasharin Mikhail on 14.11.2023.
//

import SwiftUI

struct MainNavigationButton: View {
    let title: ButtonStates
    let completion: () -> ()
    
    var body: some View {
        Text(title.rawValue)
            .font(.largeTitle.bold())
            .foregroundColor(.white)
            .frame(width: 250, height: 80)
            .background(correctColor(title))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .onTapGesture {
                completion()
            }
    }
    
    private func correctColor(_ state: ButtonStates) -> Color {
        switch state {
        case .newGame: return .red
        case .continueGame: return .blue
        case .statisticGame: return .green
        }
    }
}

struct MainNavigationButton_Previews: PreviewProvider {
    static var previews: some View {
        MainNavigationButton(title: .statisticGame) { }
    }
}

enum ButtonStates: String, CaseIterable {
    case newGame = "Новая Игра"
    case continueGame = "Продолжить"
    case statisticGame = "Статистика"
}
