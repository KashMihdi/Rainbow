//
//  SettingsViewModel.swift
//  Rainbow
//
//  Created by Kasharin Mikhail on 14.11.2023.
//

import Foundation

//@dynamicMemberLookup
//final class SettingsViewModel: ObservableObject {
//    @Published var settings: Settings
//    let dataManager = DataManager<Settings>()
//    
//    init() {
//        do {
//            settings = try dataManager.load()
//        } catch {
//            settings = Settings.init()
//        }
//    }
//    
//    func save() {
//        dataManager.save(value: settings)
//    }
//    
//    subscript<T>(dynamicMember keyPath: WritableKeyPath<Settings, T>) -> T {
//        get { settings[keyPath: keyPath] }
//        set { settings[keyPath: keyPath] = newValue }
//    }
//}
