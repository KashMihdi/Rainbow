//
//  StatisticsItem.swift
//  Rainbow
//
//  Created by Kasharin Mikhail on 14.11.2023.
//

import SwiftUI

struct StatisticsItem: View {
    let statistics: Statistics
    var body: some View {
        VStack {
            HStack(alignment: .firstTextBaseline, spacing: 16) {
                Text("Игра № \(statistics.gameNumber)")
                    .font(.title2.bold())
                    .foregroundColor(.pink)
                Spacer()
                Text("Время \(statistics.time.formatted()) сек.")
                    .font(.headline)
            }

            HStack(alignment: .lastTextBaseline) {
                Text("Скорость х\(statistics.speed.formatted())")
                    .font(.title3.bold())
                Spacer()
                Text("Угадано \(statistics.correctAnswer) / \(statistics.questions)")
                    .font(.title2.bold())
                    .foregroundColor(.green)
            }
        }
        .padding([.horizontal, .vertical])
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black, radius: 10, x: 0, y: 5)
    }
}

struct StatisticsItem_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsItem(statistics: dev.statistic)
    }
}
