//
//  MainScreen.swift
//  Rainbow
//
//  Created by Kasharin Mikhail on 14.11.2023.
//

import SwiftUI

struct MainScreen: View {
    @StateObject private var vm = MainScreenViewModel()
    
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
                ForEach(NavigateMainScreen.mainButton, id: \.self) { state in
                    MainNavigationButton(title: state) {
                        vm.screen = state
                    }
                }
            }
        }
        .onChange(of: vm.screen) { _ in
            vm.openScreen.toggle()
        }
        .fullScreenCover(isPresented: $vm.openScreen) {
            navigate(vm.screen)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray.opacity(0.8))
        .safeAreaInset(edge: .bottom) {
            HStack {
                Image(systemName: "gear")
                    .onTapGesture {
                        vm.screen = .settings
                    }
                Spacer()
                Image(systemName: "questionmark")
                    .onTapGesture {
                        vm.screen = .rules
                    }
            }
            .foregroundColor(.mainScreenButtonColor(.settings))
            .font(.system(size: 40).bold())
            .padding(.horizontal, 30)
        }
    }
}

private extension MainScreen {
    @ViewBuilder func navigate(_ screen: NavigateMainScreen) -> some View {
        switch screen {
        case .newGame: GameView()
        case .settings: SettingsView()
        case .statistic: StatisticsView()
        case .rules: RulesView()
        case .main: EmptyView()
        case .continueGame: EmptyView()
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
            .environmentObject(DataManager())
    }
}
