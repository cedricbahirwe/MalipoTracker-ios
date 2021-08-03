//
//  MTEvent.swift
//  MalipoTracker
//
//  Created by Cédric Bahirwe on 02/07/2021.
//

import Foundation

// MARK: - MTEvent: An internal MalipoTracker event.
// Field are ordered based on high level importance
public struct MTEvent: Codable, Identifiable {
    public var id = UUID()
    var title: String
    var amount: Double
    var status: MTEventStatus
    var customNote: String? = nil
    
    var dueDate: Date = Date(timeIntervalSinceNow: 604800) // A week in seconds
    var dueTime: Date = Date() // This will be time format only
    
    var repetition: MTEventRepetition
    var category: MTEventCategory
    var contact: MTContact
    var updatedAt: Date = Date()
    
    private var createdAt: Date = Date()
    
    var notificationTypes: [MTNotificationType]
    
    var formattedCreatedAt: String { createdAt.description }
    var formattedUpdatedAt: String { updatedAt.description }
    
    static let `default`  = MTEvent(title: "",
                                    amount: 2000,
                                    status: .pending,
                                    repetition: .weekly,
                                    category: .rent,
                                    contact: .default,
                                    notificationTypes: [.sms])
}
