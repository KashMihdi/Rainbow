//
//  DataManager.swift
//  Rainbow
//
//  Created by Kasharin Mikhail on 14.11.2023.
//

import Foundation

final class DataManager<T:Codable> {
    
    private let userDefaults = UserDefaults.standard
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    
    private var key: String {
        switch T.self {
        case is Settings.Type: return "settings"
        default: return ""
        }
    }
    
    public func load() throws -> T {
        guard let data = userDefaults.data(forKey: key) else {
            throw DataError.notFound(key)
        }
        return try decoder.decode(T.self, from: data)
    }
    
    public func save(value: T) {
        guard let data = try? encoder.encode(value) else {
            print("Cant save")
            return
        }
        userDefaults.setValue(data, forKey: key)
    }
    
    public func remove() {
        userDefaults.removeObject(forKey: key)
    }
}

//MARK: - Error
enum DataError: Error {
    case notFound(String)
    case typeMismatch
}
