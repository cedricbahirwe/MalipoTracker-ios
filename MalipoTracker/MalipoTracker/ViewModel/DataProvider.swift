//
//  DataProvider.swift
//  MalipoTracker
//
//  Created by Cédric Bahirwe on 02/07/2021.
//

import Foundation

struct DateType {
    var day: String = ""
    var date: String = ""
    var year: String = ""
    var month: String = ""
    
    var firstDDMY: String {
        day + " " + date + " " + month + " " + year
    }
}


class DateProvider: ObservableObject {
    
    @Published var months: [String] = []
    @Published var dateData: DateType = DateType.init()
    
    init() {
        months = getMonths()
        dateData = getCurrentDate()
    }
    
    func getDayName(month: Int, day: Int, year: Int = 2021) -> String {
        // Specify date components
        let dateComponents = DateComponents(year: year, month: month, day: day)
        
        let userCalendar = Calendar(identifier: .gregorian) // since the components above (like year 2021) are for Gregorian
        // Create date from components
        let someDateTime = userCalendar.date(from: dateComponents)
        if let foundDate = someDateTime {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "E" // This refers to `day of week`
            let dateString = dateFormatter.string(from: foundDate)
            let formattedString = dateString
            return formattedString
        }
        
        // This should normally not occur
        return "UnKnown"
    }
    
    func getCurrentDate() -> DateType {
        let date = Date()
        var currentDate = Calendar.current
        currentDate.locale = NSLocale(localeIdentifier: "en_EN") as Locale
        let dateString = currentDate.component(.day, from: date)
        let monthNo = currentDate.component(.month, from: date)
        let month = currentDate.monthSymbols[monthNo - 1]
        let year = currentDate.component(.year, from: date)
        let weekNo = currentDate.component(.weekday, from: date)
        let day = currentDate.weekdaySymbols[weekNo - 1]
        return DateType(day: "\(day)", date: "\(dateString)", year: "\(year)", month: "\(month)")
    }
    
    func getDayName(from date: Int) -> DateType {
        let date = Date()
        var currentDate = Calendar.current
        currentDate.locale = NSLocale(localeIdentifier: "en_EN") as Locale
        let dateString = currentDate.component(.day, from: date)
        let monthNo = currentDate.component(.month, from: date)
        let month = currentDate.monthSymbols[monthNo - 1]
        let year = currentDate.component(.year, from: date)
        let weekNo = currentDate.component(.weekday, from: date)
        let day = currentDate.weekdaySymbols[weekNo - 1]
        return DateType(day: "\(day)", date: "\(dateString)", year: "\(year)", month: "\(month)")
    }
    
    func getMonths() -> [String] {
        let formatter = DateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "en_EN") as Locale
        let monthComponents = formatter.shortMonthSymbols ?? []
        return monthComponents
    }
    
    func getNumbersOfMonths(month: Int, year: Int) -> Int {
        let dateComponents = DateComponents(year: year, month: month)
        let calendar = Calendar.current
        let date = calendar.date(from: dateComponents)!
        let range = calendar.range(of: .day, in: .month, for: date)!
        let numDays = range.count
        return numDays + 1
    }
}
