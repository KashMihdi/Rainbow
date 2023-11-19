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
    @Namespace var play
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
        .opacity(vm.isStopped ? 0 : 1)
        .onAppear { vm.updateSettings(dataManager.settings, isNewGame: isNewGame) }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: vm.isStopped ? 0 : .infinity)
        .safeAreaInset(edge: .top) {
            if vm.isStopped {
                HStack {
                    Image(systemName: "play.fill")
                        .font(.system(size: 100))
                        .onTapGesture {
                            vm.isStopped.toggle()
                            vm.timerService.startTimer()
                        }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .matchedGeometryEffect(id: "play", in: play)
            } else {
                HStack {
                    Image(systemName: "arrow.left")
                        .onTapGesture {
                            vm.saveSettings(dataManager)
                            dismiss()
                        }
                    Spacer()
                    Text(vm.publishedTime)
                    Spacer()
                    Image(systemName: "pause.fill")
                        .onTapGesture {
                            vm.timerService.stopTimer()
                            vm.isStopped.toggle()
                        }
                }
                .matchedGeometryEffect(id: "play", in: play)
                .padding(.horizontal)
                .font(.largeTitle)
            }
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
        .animation(.interactiveSpring(response: 0.7, dampingFraction: 0.8, blendDuration: 0.7), value: vm.isStopped)
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
