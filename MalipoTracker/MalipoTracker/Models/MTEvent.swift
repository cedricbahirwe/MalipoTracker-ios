//
//  MTEvent.swift
//  MalipoTracker
//
//  Created by Cédric Bahirwe on 02/07/2021.
//

import Foundation

enum MTCategory {
    case rent ,loan , custom(String)
}

struct MTEvent: Codable, Identifiable {
    var id = UUID()
    var title: String = ""
    var montant: Double
    var repetition: MTEventRepetition
    var category: MTEventCategory
    var status: MTEventStatus
    var contact: MTContact
    
    var customNote: String? = nil
    
    
    private var createdAt: Date = Date()
    var updatedAt: Date = Date()
    var dueDate: Date = Date(timeIntervalSinceNow: 604800) // A week in seconds
    var dueTime: Date = Date() // This will be time only
    
    
    var formattedCreatedAt: String {
        return createdAt.description
    }
    
    var formattedUpdatedAt: String {
        return updatedAt.description
    }
    
    static let `default`  = MTEvent(montant: 2000,
                                    repetition: .weekly,
                                    category: .default,
                                    status: .pending,
                                    contact: .default,
                                    customNote: "The is monthly rent for Himbi Apartments")
}
