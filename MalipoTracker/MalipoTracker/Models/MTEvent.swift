//
//  MTEvent.swift
//  MalipoTracker
//
//  Created by Cédric Bahirwe on 02/07/2021.
//

import Foundation

struct MTEvent: Codable, Identifiable {
    var id = UUID()
    var title: String = ""
    var montant: Double
    
    private var createdAt: Date = Date()
    var updatedAt: Date = Date()
    var dueDate: Date = Date(timeIntervalSinceNow: 604800) // A week in seconds
    var dueTime: Date = Date() // This will be time only
    var repetition: EventRepetition
    var category: EventCategory
    var status: EventStatus
    var contact: MTContact
    var formattedCreatedAt: String {
        return createdAt.description
    }
    
    var formattedUpdatedAt: String {
        return updatedAt.description
    }
    
    static let `default`  = Event(montant: 2000, repetition: .weekly, category: .default, status: .pending)
}
