//
//  CalendarContainerView.swift
//  MalipoTracker
//
//  Created by Cédric Bahirwe on 03/08/2021.
//

import SwiftUI


struct CalendarContainerView: View {
    @Environment(\.calendar) var calendar
    
    private var year: DateInterval {
        calendar.dateInterval(of: .year, for: Date())!
    }
    
    
    private func isToday(_ date: Date) -> Bool {
        calendar.isDateInToday(date)
    }
    
    private var months: [Date] {
        calendar.generateDates(
            inside: year,
            matching: DateComponents(day: 1, hour: 0, minute: 0, second: 0)
        )
    }
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ScrollViewReader { value in
                
                CalendarView(interval: year) { date in
                    Text("30")
                        .hidden()
                        .padding(8)
                        .background(isToday(date) ? Color.primary : Color.clear)
                        .clipShape(Circle())
                        .padding(.vertical, 4)
                        .overlay(
                            Text(String(calendar.component(.day, from: date)))
                                .foregroundColor(isToday(date) ? Color(.systemBackground) : .primary)
                        )
                        .onTapGesture {
                            withAnimation {
                                value.scrollTo(months[7], anchor: .center)
                            }
                        }
                }
            }
        }
    }
}


struct CalendarContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarContainerView()
    }
}
