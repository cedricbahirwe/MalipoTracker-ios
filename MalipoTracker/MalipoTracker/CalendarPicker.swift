//
//  CalendarPicker.swift
//  MalipoTracker
//
//  Created by Cédric Bahirwe on 18/02/2021.
//

import SwiftUI

struct GraphicalCalendarView: View {
    @Binding var selection: Date
    var startDate: Date = Date()
    var endDate: Date? = nil
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.opacity(0.6)
                .ignoresSafeArea(edges: .all)
            VStack(spacing: 0) {
                
                Capsule()
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 40, height: 5)
                    .padding(.vertical, 5)
                HStack {
                    Text("Select date🗓")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.vertical, 5)
                
                DatePicker("",
                           selection: $selection,
                           in: startDate...Date(timeIntervalSinceNow: 865000),
                           displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
            }
            .padding()
            .background(
                Color(.secondarySystemBackground)
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                    .ignoresSafeArea(.all, edges: .bottom)
            )
        }
    }
}

struct CalendarPicker_Previews: PreviewProvider {
    static var previews: some View {
        GraphicalCalendarView(selection: .constant(Date()))
//            .environment(\.colorScheme, .dark)
    }
}



