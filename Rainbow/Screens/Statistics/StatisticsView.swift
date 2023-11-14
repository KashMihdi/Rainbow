//
//  StatisticsView.swift
//  Rainbow
//
//  Created by Kasharin Mikhail on 14.11.2023.
//

import SwiftUI

struct StatisticsView: View {
    @Environment(\.dismiss) var dismiss
    let statistics: [Statistics]
    
    var body: some View {
        LazyVStack(spacing: 16) {
            ForEach(statistics, content: StatisticsItem.init)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .safeAreaInset(edge: .bottom) {
            Button {
                //
            } label: {
                Text("Очистить статистику")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 20)
                    .background(.red)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }

        }
        .safeAreaInset(edge: .top) {
            HStack {
                Image(systemName: "arrow.left")
                    .onTapGesture {
                        dismiss()
                    }
                Text("Статистика")
            }
            .font(.title.bold())
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal)
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView(statistics: dev.statistics)
    }
}
