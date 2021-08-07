//
//  EventStoreManager.swift
//  MalipoTracker
//
//  Created by Cédric Bahirwe on 07/08/2021.
//

import Foundation

class EventStoreManager: ObservableObject {
   @MTStorage(key: "firstEvent") var myFirstEvent: MTEvent?
    
    
    init() {
        printMyEvent()
    }
    
    
    func printMyEvent() {
        print("The event is: \(myFirstEvent)")
    }
    
}
