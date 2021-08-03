//
//  MainView.swift
//  MalipoTracker
//
//  Created by Cédric Bahirwe on 03/08/2021.
//

import SwiftUI

struct MainView: View {
    @State private var selectedtab: MainTab = .home
    @State private var showEditSheet: Bool = false
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                if selectedtab == .home {
                    HomeView()
                } else if selectedtab == .summary {
                    SummaryView()
                }
            }
            .transition(AnyTransition.move(edge: .trailing))
            .animation(.default)
            HStack {
                Image(systemName: "house.fill")
                    .imageScale(.large)
                    .onTapGesture {
                        selectedtab = .home
                    }
                Spacer()
                
                
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: selectedtab == .home ? 40 : 30,
                           height: selectedtab == .home ? 40 : 30)
                    .onTapGesture {
                        selectedtab = .creation
                    }
                
                Spacer()
                Image(systemName: "chart.bar.xaxis")
                    .imageScale(.large)
                    .onTapGesture {
                        selectedtab = .summary
                    }
                
            }
            .padding()
            .padding(.horizontal, 20)
            .background(Color(.secondarySystemGroupedBackground))
            .clipShape(Capsule())
            .animation(.spring())
            .padding(10)
        }
        .onChange(of: selectedtab) {
            showEditSheet = $0 == .creation
        }
        .sheet(isPresented: $showEditSheet){
            EventCreationView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
