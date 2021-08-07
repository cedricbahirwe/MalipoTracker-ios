//
//  ModelHelpers.swift
//  MalipoTracker
//
//  Created by Cédric Bahirwe on 02/07/2021.
//

import Foundation

/// Represents a type that  conforms to both `Codable` and `CaseIterable` Protocol
private typealias CodableEnum = Codable & CaseIterable

// MARK: - MTNotificationType: Supported type of notifications in MalipoTracker
public enum MTNotificationType: String, CodableEnum {
    case  email, whatsapp, sms
}

// MARK: - MTNotificationType: Supported types of Status for a MTEvent in MalipoTracker
public enum MTEventStatus: String, CodableEnum {
    case pending, completed, extended, canceled
}

// MARK: - MTNotificationType: Supported types of repetition for MTEvent MalipoTracker
public enum MTEventRepetition: String, CodableEnum {
    case daily, weekly, monthly, yearly
}

// MARK: - MTMonth: Supported months MalipoTracker
public enum MTMonth: Int, CodableEnum {
    case jan = 1, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec
}
