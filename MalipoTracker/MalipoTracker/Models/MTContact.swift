//
//  MTContact.swift
//  MalipoTracker
//
//  Created by Cédric Bahirwe on 02/07/2021.
//

import Foundation

// MARK: - MTContact: A Contact associated with an MTEvent
struct MTContact: Identifiable, Codable, Equatable {
    var id = UUID()
    let givenName: String
    let lastName: String
    var names: String {
        givenName + " " + lastName
    }
    var phoneNumbers: [String]
    static let example: [MTContact] = [
        MTContact(givenName: "", lastName: "", phoneNumbers: ["1800MYAPPLE"]),
        MTContact(givenName: "Cédric", lastName: "Bahirwe", phoneNumbers: ["+250782628511"]),
        MTContact(givenName: "Andrew", lastName: "", phoneNumbers: ["0788227786"]),
        MTContact(givenName: "Christelle", lastName: "Kirumugabo", phoneNumbers: ["+16822482003", "+16822482003", "+243970505826"]),
        MTContact(givenName: "Fath\'ma", lastName: "Shabani", phoneNumbers: ["+243998737576", "+250785603485"])
    ]
    static let `default` = MTContact(givenName: "Cédric", lastName: "Bahirwe", phoneNumbers: ["+250782628511"])
}
