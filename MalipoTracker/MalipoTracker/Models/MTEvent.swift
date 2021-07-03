//
//  MTEvent.swift
//  MalipoTracker
//
//  Created by Cédric Bahirwe on 02/07/2021.
//

import Foundation

public enum MTNotfication: String, CaseIterable, Codable {
    case sms, email, whatsapp
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
    var notificationModes: [MTNotfication]
    
    var formattedCreatedAt: String {
        return createdAt.description
    }
    
    var formattedUpdatedAt: String {
        return updatedAt.description
    }
    
    static let `default`  = MTEvent(montant: 2000,
                                    repetition: .weekly,
                                    category: .rent,
                                    status: .pending,
                                    contact: .default,
                                    customNote: "The is monthly rent for Himbi Apartments", notificationModes: [.sms])
}
