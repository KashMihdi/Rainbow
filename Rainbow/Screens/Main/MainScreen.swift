//
//  MainScreen.swift
//  Rainbow
//
//  Created by Kasharin Mikhail on 14.11.2023.
//

import SwiftUI

struct MainScreen: View {
    @StateObject private var vm = MainScreenViewModel()
    let buttonText = ButtonStates.allCases
    
    var body: some View {
        VStack {
            Image(systemName: "heart.fill")
                .font(.system(size: 80))
            VStack {
                Text("НЛП игра")
                    .font(.largeTitle)
                Text("РАДУГА")
                    .font(.system(size: 60))
            }
            
            VStack(spacing: 20) {
                ForEach(buttonText, id: \.self) { state in
                    MainNavigationButton(title: state) {
                        vm.navigate(state)
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $vm.openScreen) {
            navigate(vm.screen)
        }
        .sheet(isPresented: $vm.openRules){
            RulesView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray.opacity(0.8))
        .safeAreaInset(edge: .bottom) {
            HStack {
                Image(systemName: "gear")
                    .onTapGesture {
                        //vm.openSettings.toggle()
                    }
                Spacer()
                Image(systemName: "questionmark")
                    .onTapGesture {
                        vm.openRules.toggle()
                    }
            }
            .foregroundColor(.purple)
            .font(.system(size: 40).bold())
            .padding(.horizontal, 30)
        }
    }
}

private extension MainScreen {
    @ViewBuilder func navigate(_ screen: NavigateMainScreen) -> some View {
        switch screen {
        case .newGame: Text("New Game")
        case .settings: SettingsView()
        case .statistic: StatisticsView()
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
            .environmentObject(DataManager())
    }
}
