//
//  StatisticsView.swift
//  Rainbow
//
//  Created by Kasharin Mikhail on 14.11.2023.
//

import SwiftUI

struct StatisticsView: View {
    @EnvironmentObject var vm: DataManager
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        LazyVStack(spacing: 16) {
            ForEach(vm.statistics, content: StatisticsItem.init)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .safeAreaInset(edge: .bottom) {
            Button {
                vm.statistics.removeAll()
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
        .background(Color.background(name: vm.backgroundColor))
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
            .environmentObject(DataManager())
    }
}
