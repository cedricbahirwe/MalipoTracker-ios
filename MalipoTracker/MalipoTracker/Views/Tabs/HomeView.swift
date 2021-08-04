//
//  HomeView.swift
//  MalipoTracker
//
//  Created by Cédric Bahirwe on 17/02/2021.
//

import SwiftUI

public enum MainTab {
    case home , summary, creation
}

/// - Payment Status
/// - Snoozed? (Date and time)
struct HomeView: View {
    @StateObject private var data: DateProvider = DateProvider()
    @State private var goToEventDetails = false
    @State private var currentMonth: MTMonth = .jul
    var body: some View {
        ZStack {
            Group {
                NavigationLink(destination: EventDetailView(), isActive: $goToEventDetails) { }
            }
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Hello, Cédric")
                            .font(.system(size: 16, weight: .semibold))
                        Text("5 New Events For Today")
                            .font(.system(size: 12, weight: .light))
                    }
                    
                    Spacer()
                    HStack {
                        TextField("", text: .constant(""))
                        
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .padding(10)
                            .frame(width: 35, height: 35)
                        
                    }
                    Image(systemName: "square.grid.3x3.fill")
                        .resizable()
                        .padding(8)
                        .frame(width: 35, height: 35)
                    Image("2")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .cornerRadius(10)
                    
                }
                .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(1 ..< data.getNumbersOfMonths(month: currentMonth.rawValue, year: 2021)) { index in
                            VStack {
                                
                                Text(data.getDayName(month: currentMonth.rawValue, day: index))
                                    .font(.system(size: 12, weight: .light))
                                    .foregroundColor(Color(.secondaryLabel))
                                Text("\(index)")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                            }
                            .padding(.horizontal, 5)
                            .frame(minWidth: 50)
                            .frame(height: 60)
                            .background(
                                Color(.secondarySystemBackground)
                                    .opacity(index != 2 ? 0 : 1)
                            )
                            .cornerRadius(15)
                        }
                    }
                }
                .padding(.vertical, 10)
                
                VStack(alignment: .leading, spacing: 05) {
                    Text("Design Tasks Details")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.primary)
                    HStack {
                        Image(systemName: "clock")
                        Text("8:30 - 9:30")
                    }
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.gray)
                    
                    HStack {
                        ForEach(0 ..< 4) { i in
                            Image("\(i+1)")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .cornerRadius(3)
                        }
                    }
                    .padding(.top, 5)
                }
                .padding(10)
                .frame(width: 300, height: 90, alignment: .leading)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
                .contentShape(Rectangle())
                .onTapGesture {
                    goToEventDetails = true
                }
                
                
                Spacer()
                
              
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
        //            .preferredColorScheme(.dark)
    }
}

struct VStacked<Content: View>: View {
    var content: () -> Content
    
    
    var body: some View {
        content()
    }
}
