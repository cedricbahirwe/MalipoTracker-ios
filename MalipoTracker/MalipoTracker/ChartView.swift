//
//  ChartView.swift
//  MalipoTracker
//
//  Created by Cédric Bahirwe on 08/07/2021.
//

import SwiftUI

struct ChartView: View {
    var body: some View {
        BarChart(legend: "EUR",
                 barColor: .blue, data: chartDataSet)
            .padding(.horizontal)
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}

struct BarChartCell: View {
    let value: Double
    let barColor: Color
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .fill(barColor)
            .scaleEffect(CGSize(width: 1, height: value), anchor: .bottom)
    }
}

struct ChartData {
    var label: String
    var value: Double
}

let chartDataSet: [ChartData] = [
    .init(label: "January 2021", value: 340.32),
    .init(label: "February 2021", value: 250.00),
    .init(label: "March 2021", value: 430.22),
    .init(label: "April 2021", value: 350.0),
    .init(label: "May 2021", value: 450.00),
    .init(label: "June 2021", value: 380.00),
    .init(label: "July 2021", value: 365.98)
]

struct BarChart: View {
    var legend: String
    var barColor: Color
    var data: [ChartData]
    
    @State private var currentValue = ""
    @State private var currentLabel = ""
    @State private var touchLocation: CGFloat = -1

    var body: some View {
        VStack(alignment: .leading) {
//            Text(title)
//                .font(Font.largeTitle.bold())
//            Text("Current value: \(currentValue)")
//                .font(.headline)
//            Spacer()
            
            GeometryReader { geometry in
                VStack(spacing: 10) {
                    LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue, Color.red]), startPoint: .bottom, endPoint: .top)
                        .mask(
                    HStack {
                        ForEach(0..<data.count, id: \.self) { i in
                            BarChartCell(value: normalizedValue(index: i), barColor: barColor)
                                .opacity(barIsTouched(index: i) ? 1 : 0.7)
                                .scaleEffect(barIsTouched(index: i) ? CGSize(width: 1.05, height: 1) : CGSize(width: 1, height: 1), anchor: .bottom)
                                .animation(.spring())
                                .padding(.top)
                        }
                    }
                    .gesture(DragGesture(minimumDistance: 0)
                        .onChanged({ position in
                            let touchPosition = position.location.x/geometry.frame(in: .local).width
                            touchLocation = touchPosition
                            
                            updateCurrentValue()

                        })
                        .onEnded({ _ in
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                withAnimation(Animation.easeOut(duration: 0.5)) {
                                   resetValues()
                                }
                             }
                        })
                    )
                    
                    
                    )
                    if currentLabel.isEmpty {
                        Text(legend)
                            .bold()
                            .foregroundColor(.black)
                            .padding(5)
                            .background(RoundedRectangle(cornerRadius: 5).foregroundColor(.white).shadow(radius: 3))
                    } else {
                        Text(currentLabel)
                            .bold()
                            .foregroundColor(.black)
                            .padding(5)
                            .background(RoundedRectangle(cornerRadius: 5)
                                            .foregroundColor(.white)
                                            .shadow(radius: 3)
                            )
                            .offset(x: labelOffset(in: geometry.frame(in: .local).width))
                            .animation(.easeIn)
                    }
                }
            }
        }
        
        
    }
    
    func normalizedValue(index: Int) -> Double {
             var allValues: [Double]    {
                 var values = [Double]()
                 for data in data {
                     values.append(data.value)
                 }
                 return values
             }
             guard let max = allValues.max() else {
                 return 1
             }
             if max != 0 {
                 return Double(data[index].value)/Double(max)
             } else {
                 return 1
             }
    }
    
    func barIsTouched(index: Int) -> Bool {
        touchLocation > CGFloat(index)/CGFloat(data.count) && touchLocation < CGFloat(index+1)/CGFloat(data.count)
    }
    
    func updateCurrentValue() {
        let index = Int(touchLocation * CGFloat(data.count))
        guard index < data.count && index >= 0 else {
            currentValue = ""
            currentLabel = ""
            return
        }
        currentValue = "\(data[index].value)"
        currentLabel = data[index].label
    }
    
    func resetValues() {
             touchLocation = -1
             currentValue  =  ""
             currentLabel = ""
    }
    
    func labelOffset(in width: CGFloat) -> CGFloat {
             let currentIndex = Int(touchLocation * CGFloat(data.count))
             guard currentIndex < data.count && currentIndex >= 0 else {
                 return 0
             }
             let cellWidth = width / CGFloat(data.count)
             let actualWidth = width -    cellWidth
             let position = cellWidth * CGFloat(currentIndex) - actualWidth/2
             return position
    }
}
