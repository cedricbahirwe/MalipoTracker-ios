//
//  MTEvent.swift
//  MalipoTracker
//
//  Created by Cédric Bahirwe on 02/07/2021.
//

import Foundation

// MARK: - MTEvent: An internal MalipoTracker event.
public struct MTEvent: Codable, Identifiable {
    public var id = UUID()
    var title: String = ""
    var amount: Double
    var repetition: MTEventRepetition
    var category: MTEventCategory
    var status: MTEventStatus
    var contact: MTContact
    var customNote: String? = nil
    
    private var createdAt: Date = Date()
    var updatedAt: Date = Date()
    var dueDate: Date = Date(timeIntervalSinceNow: 604800) // A week in seconds
    var dueTime: Date = Date() // This will be time format only
    var notificationTypes: [MTNotificationType]
    
    var formattedCreatedAt: String {
        return createdAt.description
    }
    
    var formattedUpdatedAt: String {
        return updatedAt.description
    }
    
    static let `default`  = MTEvent(amount: 2000,
                                    repetition: .weekly,
                                    category: .rent,
                                    status: .pending,
                                    contact: .default,
                                    customNote: "The is monthly rent for Himbi Apartments",
                                    notificationTypes: [.sms])
}
