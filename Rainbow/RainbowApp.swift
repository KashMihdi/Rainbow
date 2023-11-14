//
//  RainbowApp.swift
//  Rainbow
//
//  Created by Kasharin Mikhail on 14.11.2023.
//

import SwiftUI

@main
struct RainbowApp: App {
    @StateObject private var dataProvider = DataManager()
    var body: some Scene {
        WindowGroup {
            MainScreen()
                .environmentObject(dataProvider)
        }
    }
}
