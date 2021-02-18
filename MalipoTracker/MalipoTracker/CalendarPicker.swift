//
//  CalendarPicker.swift
//  MalipoTracker
//
//  Created by Cédric Bahirwe on 18/02/2021.
//

import SwiftUI

struct CalendarPicker: View {
    @State private var selectedDate = Date()
    var body: some View {
        VStack(spacing: -20) {
            Color.black.opacity(0.6)
                .ignoresSafeArea(edges: .all)
            
            VStack {
                
                Capsule()
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 50, height: 5)
                    .padding(.vertical, 5)
                DatePicker("", selection: $selectedDate, in: Date()..., displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .padding()
                    .zIndex(3)
            }
            .background(
                Color.fgColor
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                    .edgesIgnoringSafeArea(.bottom)
            )
        }
    }
}

struct CalendarPicker_Previews: PreviewProvider {
    static var previews: some View {
        CalendarPicker()
        //            .environment(\.colorScheme, .dark)
    }
}
