//
//  MyCalendarView.swift
//  MalipoTracker
//
//  Created by Cédric Bahirwe on 03/08/2021.
//

import SwiftUI

// https://gist.github.com/mecid/f8859ea4bdbd02cf5d440d58e936faec
fileprivate extension DateFormatter {
    static var month: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        return formatter
    }
    
    
    static var monthAndYear: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter
    }
}

extension Calendar {
    func generateDates(
        inside interval: DateInterval,
        matching components: DateComponents
    ) -> [Date] {
        var dates: [Date] = []
        dates.append(interval.start)
        
        enumerateDates(
            startingAfter: interval.start,
            matching: components,
            matchingPolicy: .nextTime
        ) { date, _, stop in
            if let date = date {
                if date < interval.end {
                    dates.append(date)
                } else {
                    stop = true
                }
            }
        }
        
        return dates
    }
}

// MARK: - This component should be used only inside a `ScrollView`
struct CalendarView<DateView>: View where DateView: View {
    @Environment(\.calendar) var calendar
    
    let axis: Axis.Set
    let interval: DateInterval
    let showHeaders: Bool // The month to be displayed
    let content: (Date) -> DateView
    
    init(axis: Axis.Set = .vertical,
        interval: DateInterval,
        showHeaders: Bool = true,
        @ViewBuilder content: @escaping (Date) -> DateView
    ) {
        self.axis = axis
        self.interval = interval
        self.showHeaders = showHeaders
        self.content = content
    }
    
    var body: some View {
        VStack {
            ForEach(months, id: \.self) { month in
                MonthView(month: month, content: content)
                    .id(month)
            }
        }
    }
    
    private var months: [Date] {
        calendar.generateDates(
            inside: interval,
            matching: DateComponents(day: 1, hour: 0, minute: 0, second: 0)
        )
    }
    
    private func header(for month: Date) -> some View {
        let component = calendar.component(.month, from: month)
        let formatter = component == 1 ? DateFormatter.monthAndYear : .month
        
        return Group {
            if showHeaders {
                Text(formatter.string(from: month))
                    .font(.title)
                    .padding()
            }
        }
    }
    
    private func days(for month: Date) -> [Date] {
        guard
            let monthInterval = calendar.dateInterval(of: .month, for: month),
            let monthFirstWeek = calendar.dateInterval(of: .weekOfMonth, for: monthInterval.start),
            let monthLastWeek = calendar.dateInterval(of: .weekOfMonth, for: monthInterval.end)
        else { return [] }
        return calendar.generateDates(
            inside: DateInterval(start: monthFirstWeek.start, end: monthLastWeek.end),
            matching: DateComponents(hour: 0, minute: 0, second: 0)
        )
    }
}

struct MonthView<DateView>: View where DateView: View {
    @Environment(\.calendar) var calendar
    
    let month: Date
    let showHeaders: Bool
    let content: (Date) -> DateView
    
    init(
        month: Date,
        showHeaders: Bool  = true,
        @ViewBuilder content: @escaping (Date) -> DateView
    ) {
        self.month = month
        self.showHeaders = showHeaders
        self.content = content
    }
    
    private var weeks: [Date] {
        guard
            let monthInterval = calendar.dateInterval(of: .month, for: month)
        else { return [] }
        return calendar.generateDates(
            inside: monthInterval,
            matching: DateComponents(hour: 0, minute: 0, second: 0, weekday: calendar.firstWeekday)
        )
    }
    var body: some View {
        VStack {
            header(for: month)
            ForEach(weeks, id: \.self) { week in
                WeekView(week: week, content: content)
            }
        }
    }
    private func header(for month: Date) -> some View {
        let component = calendar.component(.month, from: month)
        let formatter = component == 1 ? DateFormatter.monthAndYear : .month
        
        return Group {
            if showHeaders {
                Text(formatter.string(from: month))
                    .font(.title)
                    .padding(.top)
            }
        }
    }
}

struct WeekView<DateView>: View where DateView: View {
    @Environment(\.calendar) var calendar
    
    let week: Date
    let content: (Date) -> DateView
    
    init(
        week: Date,
        @ViewBuilder content: @escaping (Date) -> DateView
    ) {
        self.week = week
        self.content = content
    }
    
    private var days: [Date] {
        guard
            let weekInterval = calendar.dateInterval(of: .weekOfYear, for: week)
        else { return [] }
        return calendar.generateDates(
            inside: weekInterval,
            matching: DateComponents(hour: 0, minute: 0, second: 0)
        )
    }
    
    var body: some View {
        HStack {
            ForEach(days, id: \.self) { date in
                HStack {
                    if calendar.isDate(self.week, equalTo: date, toGranularity: .month) {
                        content(date)
                    } else {
                        content(date).hidden()
                    }
                }
            }
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    @Environment(\.calendar) var calendar
    
    static var previews: some View {
        CalendarView(interval: .init(), showHeaders: true) { date in
            Text(String(Calendar.current.component(.day, from: date)))
                .frame(width: 40, height: 40, alignment: .center)
                .background(Color.blue)
                .clipShape(Circle())
                .padding(.vertical, 4)
        }
    }
}
