//
//  HomeView.swift
//  MalipoTracker
//
//  Created by Cédric Bahirwe on 17/02/2021.
//

import SwiftUI

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
                    
                    Image("2")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .cornerRadius(10)
                    
                }
                .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<10) { i in
                            VStack(spacing: 2) {
                                Text("Wed")
                                    .font(.system(size: 12, weight: .light))
                                    .foregroundColor(Color(.secondaryLabel))
                                Text("\(i*17)")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                            }
                            .padding(.horizontal, 12)
                            .frame(height: 60)
                            .background(Color(.secondarySystemBackground).opacity(i != 2 ? 0 : 1))
                            .cornerRadius(15)
                        }
                    }
                }
                .padding(.vertical, 10)
                
                VStack(alignment: .leading, spacing: 05) {
                    Text("Design Tasks Details")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(Color(.systemBackground))
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
                .background(Color(.label))
                .cornerRadius(10)
                .contentShape(Rectangle())
                .onTapGesture {
                     goToEventDetails = true
                }
                Spacer()
                HStack {
                    Image(systemName: "grid")
                    
                    Spacer()
                    
                    ZStack {
                        Capsule()
                            .fill(Color(.systemBackground).opacity(0.9))
                            .frame(width: 3, height: 13)
                            .rotationEffect(.degrees(90))
                        Capsule()
                            .fill(Color(.systemBackground))
                            .frame(width: 3, height: 13)
                    }
                    .frame(width: 40, height: 40)
                    .background(Color(.label))
                    .clipShape(Circle())
                    
                    Spacer()
                    Image(systemName: "gear")
                        .foregroundColor(.gray)
                    
                }
                .padding()
                .padding(.horizontal, 20)
                .background(Color(.secondarySystemBackground).opacity(0.1))
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environment(\.colorScheme, .dark)
    }
}

struct VStacked<Content: View>: View {
    var content: () -> Content
    
    
    var body: some View {
        content()
    }
}
