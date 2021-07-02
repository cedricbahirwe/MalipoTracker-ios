//
//  ModelHelpers.swift
//  MalipoTracker
//
//  Created by Cédric Bahirwe on 02/07/2021.
//

import Foundation

enum EventStatus: String, Codable {
    case completed, pending, extended, canceled
}
enum EventRepetition: String, Codable {
    case daily, weekly, monthly, yearly
}
enum Month: Int {
    case jan = 1, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec
}
