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
            
            VStack(spacing: 0) {
                
                Capsule()
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 50, height: 5)
                    .padding(.vertical, 5)
                HStack {
                    Text("Select date🗓")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.vertical, 5)
                DatePicker("", selection: $selectedDate, in: Date()..., displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .zIndex(3)
            }
            .padding()

            .background(
//                Color.fgColor
                Color(red: 0.816, green: 0.884, blue: 0.909)
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



