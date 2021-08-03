//
//  ModelHelpers.swift
//  MalipoTracker
//
//  Created by Cédric Bahirwe on 02/07/2021.
//

import Foundation


// MARK: - MTNotificationType: Supported type of notifications in MalipoTracker
public enum MTNotificationType: String, CaseIterable, Codable {
    case sms, email, whatsapp
}

// MARK: - MTNotificationType: Supported types of Status for a MTEvent in MalipoTracker
public enum MTEventStatus: String, Codable {
    case completed, pending, extended, canceled
}

// MARK: - MTNotificationType: Supported types of repetition for MTEvent MalipoTracker
public enum MTEventRepetition: String, Codable {
    case daily, weekly, monthly, yearly
}

// MARK: - MTMonth: Supported months MalipoTracker
public enum MTMonth: Int {
    case jan = 1, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec
}
