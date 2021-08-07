//
//  LocalStorePropertWapper.swift
//  MalipoTracker
//
//  Created by Cédric Bahirwe on 07/08/2021.
//

import Foundation

@propertyWrapper
struct MTStorage<T: Codable> {
    private let userDefaults: UserDefaults = .standard
    private let key: String
    private let defaultValue: T
    
    init(wrappedValue defaultValue: T, key: String) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get {
            guard let personInfo = userDefaults.object(forKey: key) as? Data else {
                return defaultValue
            }
            return try! JSONDecoder().decode(T.self, from: personInfo)
        }
        set {
            if let data = try? JSONEncoder().encode(newValue){
                userDefaults.set(data, forKey: key)
            } else {
                userDefaults.removeObject(forKey: key)
                preconditionFailure("Can not encode the data")
            }
        }
    }
}
extension MTStorage where T: ExpressibleByNilLiteral {
    init(key: String) {
        self.init(wrappedValue: nil, key: key)
    }
}
