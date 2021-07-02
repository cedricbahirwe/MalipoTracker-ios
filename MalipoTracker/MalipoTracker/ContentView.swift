//
//  ContentView.swift
//  MalipoTracker
//
//  Created by Cédric Bahirwe on 17/02/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedMonth: Month = .jul
    private let width = UIScreen.main.bounds.size.width

//    @State var data: DateType = DateType.init()
    @ObservedObject var dateProvider: DateProvider = DateProvider()
    @State private var offsetX: CGFloat = .zero
    
    var body: some View {
        VStack {
            Text(dateProvider.dateData.firstDDMY).bold()
            HStack {
                ForEach(days(), id:\.self) { day in
                    Text(day)
                        .font(.caption)
                        .frame(maxWidth: .infinity)
                }
            }
            
            ScrollView {
                VStack {

                    VStack {
                        Text(dateProvider.dateData.day)
                        Text(dateProvider.dateData.date)
                        Text(dateProvider.dateData.month)
                        Text(dateProvider.dateData.year)
                            
                        VStack {
                            ForEach(dateProvider.months.indices, id: \.self) { index in
                                Text("\(dateProvider.months[index])")
                                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 10) {
                                    ForEach(1 ..< dateProvider.getNumbersOfMonths(month: index + 1, year: 2021)) { item in
                                        VStack {
                                            Text("\(item)")
                                            Text(dateProvider.getDayName(month: index+1, day: item))
                                                .foregroundColor(.red)
                                        }
                                    }
                                }
                                .padding(.vertical)
                            }
                        }
                    }
                    
                }
            }
//            GeometryReader { geo in
//                HStack(spacing: 0) {
//                    
//                    ForEach(dateProvider.months.indices, id: \.self) { index in
//                        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 10) {
//                            ForEach(1 ..< dateProvider.getNumbersOfMonths(month: index + 1, year: 2021)) { item in
//                                ZStack {
//                                    Circle()
//                                        .stroke(Color.primary)
//                                    Text("\(item)")
//                                        .padding(5)
//                                }
//                            }
//                        }
//                        .padding(.vertical)
////
//                    }
//                    .frame(width: geo.frame(in: .global).width)
//                    .background(Color.red)
//                }
//                .offset(x: offsetX)
//                .highPriorityGesture(
//                    DragGesture()
//                        .onEnded(updateTabs)
//                )
//            }
            .animation(.default)
        }
        .onChange(of: selectedMonth, perform: updateLayout)
    }
    
    func days() -> [String] {
        let symbols = DateFormatter().shortWeekdaySymbols!
        return Array(symbols[1..<symbols.count]) + symbols[0..<1]
    }
    
    public func updateTabs(with swipeValue: DragGesture.Value) {
            print("Saping")
        if (-swipeValue.translation.width > 50)  {
            
            if let newMonth = Month(rawValue: selectedMonth.rawValue+1) {
                selectedMonth = newMonth
            }
        }

        if (swipeValue.translation.width > 50) {
            if let newMonth = Month(rawValue: selectedMonth.rawValue-1) {
                selectedMonth = newMonth
            }
        }
    }
    private func updateLayout(tab: Month) {
        offsetX = -(width*CGFloat(tab.rawValue-1))
//        switch tab {
//        case .foryou:
//            offsetX = - (width*tab.rawValue-1)
//        case .notification:
//            offsetX = -width
//        case .topics:
//            offsetX = -width*2
//        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
