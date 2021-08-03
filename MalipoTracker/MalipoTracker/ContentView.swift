//
//  ContentView.swift
//  MalipoTracker
//
//  Created by Cédric Bahirwe on 17/02/2021.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.calendar) var calendar
    
    private var year: DateInterval {
        calendar.dateInterval(of: .year, for: Date())!
    }
    var body: some View {
        CalendarContainerView()
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
