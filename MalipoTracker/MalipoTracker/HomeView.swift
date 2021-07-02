//
//  HomeView.swift
//  MalipoTracker
//
//  Created by Cédric Bahirwe on 17/02/2021.
//

import SwiftUI

enum Month: Int {
    case jan = 1, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec
}

struct Event: Codable, Identifiable {
    var id = UUID()
    var name: String = ""
    var createdAt = ""
    var updatedAt = ""
    
    var formattedCreatedAt: String {
        return createdAt
    }
    
    var formattedUpdatedAt: String {
        return updatedAt
    }
}
struct HomeView: View {
    @State private var goToEventDetails = false
    @StateObject var dateProvider: DateProvider = DateProvider()
    @State private var currentMonth: Month = .jul
    var body: some View {
        ZStack {
            Group {
                NavigationLink(destination: EventDetailView(), isActive: $goToEventDetails) { }
            }
            VStack {
                HStack {
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
                    Image("2")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .cornerRadius(10)
                    
                }
                .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(1 ..< dateProvider.getNumbersOfMonths(month: currentMonth.rawValue, year: 2021)) { index in
                            VStack {
                                
                                Text(dateProvider.getDayName(month: currentMonth.rawValue, day: index))
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
                
                HStack {
                    Image(systemName: "house.fill")
                        .imageScale(.large)
                    
                    Spacer()
                    
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                    
                    Spacer()
                    Image(systemName: "chart.bar.xaxis")
                        .imageScale(.large)
                    
                }
                .padding()
                .padding(.horizontal, 20)
                .background(Color(.secondarySystemGroupedBackground))
                .clipShape(Capsule())
                .padding(10)
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
