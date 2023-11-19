//
//  GameView.swift
//  Rainbow
//
//  Created by Kasharin Mikhail on 15.11.2023.
//

import SwiftUI

struct GameView: View {
    @StateObject private var vm = GameViewModel()
    @EnvironmentObject var dataManager: DataManager
    @Environment(\.dismiss) var dismiss
    let isNewGame: Bool
    
    var body: some View {
        VStack {
            ForEach(vm.questions) { question in
                ZStack {
                    QuestionItem(
                        colors: question,
                        setting: vm.settings
                    ) {
                        vm.appendCorrectAnswer($0)
                    }
                }
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: vm.updateAlignment(dataManager.wordArrangement)
                        ? .getAlignment(question.position)
                        : .center
                )
            }
        }
        .onAppear { vm.updateSettings(dataManager.settings, isNewGame: isNewGame) }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .safeAreaInset(edge: .top) {
            HStack {
                Image(systemName: "arrow.left")
                    .onTapGesture {
                        vm.saveSettings(dataManager)
                        dismiss()
                    }
                Spacer()
                Text(vm.publishedTime)
                    .onTapGesture { vm.timerService.stopTimer()}
                Spacer()
                Image(systemName: "play.fill")
                    .onTapGesture {
                        vm.timerService.startTimer()
                    }
            }
            .padding(.horizontal)
            .font(.largeTitle)
        }
        .safeAreaInset(edge: .bottom) {
            Text("x\(vm.settings.questionTime.formatted())")
                .font(.largeTitle)
                .padding()
                .background(.yellow)
                .clipShape(Circle())
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing)
        }
        .alert("GAME OVER", isPresented: $vm.isFinished) {
            Button("REPEAT", action: { vm.updateSettings(dataManager.settings, isNewGame: true) })
            Button("BACK") {
                vm.saveSettings(dataManager)
                dismiss()
            }
           
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(isNewGame: true)
            .environmentObject(DataManager())
    }
}
