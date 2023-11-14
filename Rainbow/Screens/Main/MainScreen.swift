//
//  MainScreen.swift
//  Rainbow
//
//  Created by Kasharin Mikhail on 14.11.2023.
//

import SwiftUI

struct MainScreen: View {
    let buttonText = ButtonStates.allCases
    @State private var openSettings = false
    @State private var openRules = false
    @State private var openStatistics = false
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
                ForEach(buttonText, id: \.self) {
                    MainNavigationButton(title: $0) {
                        openStatistics.toggle()
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $openSettings) {
            SettingsView()
        }
        .fullScreenCover(isPresented: $openStatistics) {
            StatisticsView(statistics: [])
        }
        .sheet(isPresented: $openRules){
            RulesView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray.opacity(0.8))
        .safeAreaInset(edge: .bottom) {
            HStack {
                Image(systemName: "gear")
                    .onTapGesture {
                        openSettings.toggle()
                    }
                Spacer()
                Image(systemName: "questionmark")
                    .onTapGesture {
                        openRules.toggle()
                    }
            }
            .foregroundColor(.purple)
            .font(.system(size: 40).bold())
            .padding(.horizontal, 30)
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
