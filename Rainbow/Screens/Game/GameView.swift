//
//  GameView.swift
//  Rainbow
//
//  Created by Kasharin Mikhail on 15.11.2023.
//

import SwiftUI

struct GameView: View {
    @StateObject private var viewModel = GameViewModel()
    @EnvironmentObject var vm: DataManager
    @Environment(\.dismiss) var dismiss
    let isNewGame: Bool
    let alignment: [Alignment] = [.bottom, .center, .leading, .top, .trailing]
    
    var body: some View {
        VStack {
            ForEach(viewModel.questions, id: \.0) { question in
                ZStack {
                    QuestionItem(colors: question, setting: viewModel.settings) {
                        viewModel.appendCorrectAnswer($0)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: vm.settings.wordArrangement == .random ? alignment.randomElement()! : .center)
            }
        }
        .onAppear { viewModel.updateSettings(vm.settings, isNewGame: isNewGame) }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .safeAreaInset(edge: .top) {
            HStack {
                Image(systemName: "arrow.left")
                    .onTapGesture {
                        viewModel.saveSettings(vm)
                        dismiss()
                    }
                Spacer()
                Text(viewModel.publishedTime)
                    .onTapGesture { viewModel.timerService.stopTimer()}
                Spacer()
                Image(systemName: "play.fill")
                    .onTapGesture {
                        viewModel.timerService.startTimer()
                    }
            }
            .padding(.horizontal)
            .font(.largeTitle)
        }
        .safeAreaInset(edge: .bottom) {
            Text("x2")
                .font(.largeTitle)
                .padding()
                .background(.yellow)
                .clipShape(Circle())
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing)
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(isNewGame: true)
            .environmentObject(DataManager())
    }
}
