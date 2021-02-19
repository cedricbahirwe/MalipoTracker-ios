//
//  TimerPicker.swift
//  MalipoTracker
//
//  Created by Cédric Bahirwe on 19/02/2021.
//

import SwiftUI

struct TimePicker: View {
    var body: some View {
        VStack(spacing: -20) {
            Color.black.opacity(0.6)
                .ignoresSafeArea(edges: .all)
            
            VStack {
                Capsule()
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 50, height: 5)
                    .padding(.vertical, 5)
                GridStack(rows: 5, columns: 3) { row, column in
                    Text(labelAt(row, column))
                        .font(.system(size: 20))
                        .fontWeight(.light)
                        .foregroundColor(
                            indexAt(row, column) == 7 ?
                                Color.fgColor :
                                Color.bgColor
                        )
                        .frame(maxWidth: .infinity)
                        .frame(height: 35)
                        .background(
                            ZStack {
                                if  indexAt(row, column) == 7  {
                                    Color.blue
                                        .overlay(Color.blue)
                                        .clipShape(Capsule())
                                } else {
                                    Capsule()
                                        .stroke(Color.gray, lineWidth: 0.5)
                                }
                            }
                        )
                        .padding(5)
                }
            }
            .padding()
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
