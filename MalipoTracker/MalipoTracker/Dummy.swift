//
//  Dummy.swift
//  MalipoTracker
//
//  Created by Cédric Bahirwe on 09/06/2021.
//

import SwiftUI
struct CalendarDay: Identifiable {
    let id = UUID()
    var number: String
    var weekday: String
    var isToday: Bool
}

struct Dummy: View {
    @State var days = [CalendarDay]()
    
    var body: some View {
        ZStack{
            VStack {
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 20) {
                  ForEach(days.indices, id: \.self) { i in
                        CalendarView(
                            number: days[i].number,
                            days: days[i].weekday,
                            color: days[i].isToday ? #colorLiteral(red: 0.9060331583, green: 0.2547450066, blue: 0.3359550834, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
                            textcolor: days[i].isToday ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                        )
                            .onTapGesture{
                                print(days[i])
                                // this is just for replacing the current selection
                                for j in days.indices { days[j].isToday = false }
                                days[i].isToday = true
                            }
                    }}
                    .padding(.leading,10)
                    .padding(.bottom, 10)
                    .shadow(radius: 3, x: 3, y: 3)
                }
                
            }
        }
        .onAppear {
            getCurrentWeekdays()
        }
    }
    
    func getCurrentWeekdays() {
        /// from https://stackoverflow.com/a/62355272/14351818
        let dateComponents = Calendar(identifier: .gregorian).dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date())
        let startOfWeek = Calendar(identifier: .gregorian).date(from: dateComponents)!
        let startOfWeekNoon = Calendar(identifier: .gregorian).date(bySettingHour: 12, minute: 0, second: 0, of: startOfWeek)!
        
        days = (0...6).map {
            let calendar = Calendar(identifier: .gregorian)
            let date = calendar.date(byAdding: .day, value: $0, to: startOfWeekNoon)!
            
            let numberDateFormatter = DateFormatter()
            numberDateFormatter.dateFormat = "d"
            let number = numberDateFormatter.string(from: date)
            
            let weekdayDateFormatter = DateFormatter()
            weekdayDateFormatter.dateFormat = "E"
            let weekday = weekdayDateFormatter.string(from: date)
            
            let calendarDay = CalendarDay(
                number: number,
                weekday: weekday,
                isToday: calendar.component(.day, from: Date()) == calendar.component(.day, from: date)
            )
            
            return calendarDay
        }
        
    }
}

struct CalendarView: View {
    var number : String
    var days : String
    var color : UIColor
    var textcolor : UIColor
    
    var body: some View {
        VStack{
            Text(self.number)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundColor(Color(self.textcolor))
            Text(self.days)
                .font(.headline)
                .foregroundColor(Color(self.textcolor))
        }.padding([.top,.bottom], 10)
            .padding([.leading,.trailing],10)
            .background(Color(self.color))
            .cornerRadius(30)
    }
}

struct Dummy_Previews: PreviewProvider {
    static var previews: some View {
        Dummy()
    }
}
