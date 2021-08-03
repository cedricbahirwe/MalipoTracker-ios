//
//  MTEventCategory.swift
//  MalipoTracker
//
//  Created by Cédric Bahirwe on 02/07/2021.
//

import Foundation

/// Encoding and Decoding Enums with Associated Values Using Codable
/// https://medium.com/@fruitcoder/codable-enum-with-associated-values-swift-4-e7d75d6f4370

// MARK: - MTEventCategory: A Contact associated with an MTEvent
public enum MTEventCategory: CaseIterable, Equatable {
    case rent , loan , custom(message: String)
    public static var allCases: [MTEventCategory] {
            return [.rent, .loan, .custom(message: "Custom")]
        }
}

extension MTEventCategory: Codable {
    private enum CodingKeys: String, CodingKey {
        case base, customMessage
    }
    
    public enum Base: String, Codable, CaseIterable {
        case  rent , loan , custom
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let base = try container.decode(Base.self, forKey: .base)
        
        switch base {
        case .rent:
            self = .rent
        case .loan:
            self = .loan
        case .custom:
            let customMessage = try container.decode(String.self, forKey: .customMessage)
            self = .custom(message: customMessage)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        switch self {
        case .rent:
            try container.encode(Base.rent, forKey: .base)
        case .loan:
            try container.encode(Base.loan, forKey: .base)
        case .custom(let message):
            try container.encode(Base.custom, forKey: .base)
            try container.encode(message, forKey: .customMessage)
        }
    }
}
