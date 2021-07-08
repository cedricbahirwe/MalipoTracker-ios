//
//  SummaryView.swift
//  MalipoTracker
//
//  Created by Cédric Bahirwe on 03/07/2021.
//

import SwiftUI

struct SummaryView: View {
    @State private var showFullHistoryView: Bool = false
    @Namespace var animateButton
    var body: some View {
        VStack {
            ZStack(alignment: .trailing) {
                Text("Income")
                    .font(Font.title3.bold())
                    .frame(maxWidth: .infinity)
                
                // To define a filter by title, period or category
                Image(systemName: "line.horizontal.3.decrease")
                    .padding(10)
            }
                
            Divider()
            HStack {
                Text("\(1160)$")
                    .padding(5)
                    .padding(.horizontal, 10)
                    .background(Color.red.contrast(0.6))
                    .foregroundColor(.white)
                    .cornerRadius(3)
                
                Spacer()
                
                Text("\(220)$")
                    .padding(5)
                    .padding(.horizontal, 10)
                    .background(Color.green.contrast(0.6))
                    .foregroundColor(.white)
                    .cornerRadius(3)
                if showFullHistoryView {
                    Spacer()
                    expandButton
                }
            }
            .padding(.horizontal)
            Divider()
            // Graph
            ZStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 0) {
                    GraphAxis(length: 300, alignment: .vertical)
                    GraphAxis(length: 300, alignment: .horizontal)
                    
                }
                .overlay(
                    
                    // To toggle between income and dus
                    VStack(spacing: 0) {
                        Toggle("", isOn: .constant(true))
                            .toggleStyle(SwitchToggleStyle(tint: Color.red.opacity(0.8)))
                        ChartView()
                            .padding(.bottom, -35)
                    }
                    , alignment: .topTrailing
                )
                .opacity(showFullHistoryView ? 0 : 1)

                VStack {
                    Spacer()
                        .frame(height: showFullHistoryView ? 0 : 320)
                    if showFullHistoryView == false {
                        HStack {
                            Spacer()
                            expandButton
                        }
                        .padding(10)
                    }
                    ScrollView {
                        VStack {
                            ForEach([Color.red, .black, .green
                                     , .darkBlue, .accentColor],
                                    id:\.self) { item in
                                HistoryRowView(bgColor: item)
                            }
                        }
                        .padding([.horizontal, .bottom], 10)
                    }
                    
                }
                
            }
        }
    }
    
    private var expandButton: some View {
        Image(systemName: "chevron.right.2")
            .imageScale(.large)
            .rotationEffect(
                .degrees(showFullHistoryView ? 90 : -90)
            )
            .matchedGeometryEffect(id: "expandButton", in: animateButton)
            .onTapGesture {
                withAnimation(.spring()) {
                    showFullHistoryView.toggle()
                }
            }
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
    }
}
