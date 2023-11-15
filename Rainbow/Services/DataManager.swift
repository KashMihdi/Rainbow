//
//  DataManager.swift
//  Rainbow
//
//  Created by Kasharin Mikhail on 14.11.2023.
//

import Foundation
import Combine

@dynamicMemberLookup
final class DataManager: ObservableObject {
    //MARK: - Keys
    private struct Keys {
        static let settings = "settings"
        static let statistics = "statistics"
    }
    
    @Published var settings: Settings = .init()
    @Published var statistics: [Statistics] = .init()
    
    private let userDefaults = UserDefaults.standard
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    private var cancelable = Set<AnyCancellable>()
    
    init() {
        do {
            settings = try load(for: Keys.settings)
            statistics = try load(for: Keys.statistics)
        } catch {
            print(error.localizedDescription)
        }
        
        save(for: settings, with: Keys.settings)
        save(for: statistics, with: Keys.statistics)
        
        $settings
            .sink { [unowned self] value in
                self.save(for: value, with: Keys.settings)
            }
            .store(in: &cancelable)
        
        $statistics
            .sink { [unowned self] value in
                self.save(for: value, with: Keys.statistics)
            }
            .store(in: &cancelable)
    }
    
    private func load<T: Decodable>(for key: String) throws -> T {
        guard let data = userDefaults.data(forKey: key) else {
            throw DataError.notFound(key)
        }
        return try decoder.decode(T.self, from: data)
    }
    
    private func save<T: Encodable>(for value: T, with key: String) {
        guard let data = try? encoder.encode(value) else {
            return
        }
        userDefaults.setValue(data, forKey: key)
    }
    
    private func remove(for key: String) {
        userDefaults.removeObject(forKey: key)
    }
    
    subscript<T>(dynamicMember keyPath: WritableKeyPath<Settings, T>) -> T {
        get { settings[keyPath: keyPath] }
        set { settings[keyPath: keyPath] = newValue }
    }
}

//MARK: - Error
enum DataError: Error {
    case notFound(String)
    case typeMismatch
}
