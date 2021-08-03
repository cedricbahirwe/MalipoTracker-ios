//
//  MTContact.swift
//  MalipoTracker
//
//  Created by Cédric Bahirwe on 02/07/2021.
//

import Foundation

// MARK: - MTContact: A Contact associated with an MTEvent
struct MTContact: Identifiable, Codable {
    var id = UUID()
    let name: String
    let phoneNumbers: [String] // Can be email also
    
    static let `default` = MTContact(name: "John Doe",
                                     phoneNumbers: ["+243976003001"])
}
