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
            TimePicker()
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

//struct CalendarPicker_Previews: PreviewProvider {
//    static var previews: some View {
//        CalendarPicker()
//        //            .environment(\.colorScheme, .dark)
//    }
//}

struct TimePicker: View {
    var body: some View {
        VStack(spacing: -20) {
            TimePicker()
            Color.black.opacity(0.6)
                .ignoresSafeArea(edges: .all)
            
            GridStack(rows: 4, columns: 3) { row, column in
                Text(labelAt(row, column))
                    .font(.system(size: 20))
                    .fontWeight(.light)
                    .frame(maxWidth: .infinity)
                    .frame(height: 35)
                    .overlay(
                        Capsule()
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding(5)
            }
            .background(
                Color.fgColor
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                    .edgesIgnoringSafeArea(.bottom)
            )
        }
        
    }
    private func indexAt(_ row: Int, _ column: Int) -> Int {
        return  row * 3 + column
    }
    
    private func labelAt(_ row: Int, _ column: Int) -> String {
        let first = "\(String(format: "%02d", indexAt(row, column)))"
        let second = "\(String(format: "%02d", (((indexAt(row, column) % 2) != 0) ? 30 : 00)))"
        
        return first + ":" + second
    }
    
}

struct TimePicker_Previews: PreviewProvider {
    static var previews: some View {
        
        TimePicker()
        //            .environment(\.colorScheme, .dark)
    }
}


