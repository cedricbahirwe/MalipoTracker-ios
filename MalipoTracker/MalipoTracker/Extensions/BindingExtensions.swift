//
//  BindingExtensions.swift
//  MalipoTracker
//
//  Created by Cédric Bahirwe on 07/08/2021.
//

import SwiftUI

extension Binding {
    public func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        Binding(
            get: { wrappedValue },
            set: { newValue in
                wrappedValue = newValue
                handler(newValue )
            }
        )
    }
}
