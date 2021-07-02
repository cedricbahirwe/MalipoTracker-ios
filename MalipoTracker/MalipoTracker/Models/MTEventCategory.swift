//
//  MTEventCategory.swift
//  MalipoTracker
//
//  Created by Cédric Bahirwe on 02/07/2021.
//

import Foundation

struct MTEventCategory: Codable, Identifiable {
    var id = UUID()
    var name: String
    var description: String? = nil
    
    static let `default`  = MTEventCategory(name: "Rent",
                                            description: nil)
}
