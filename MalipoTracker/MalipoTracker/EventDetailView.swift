//
//  EventDetailView.swift
//  MalipoTracker
//
//  Created by Cédric Bahirwe on 18/02/2021.
//

import SwiftUI

let size = UIScreen.main.bounds.size
struct EventDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    let event: Event? = nil
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                        .padding(10)
                })
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "gear")
                        .padding(10)
                })
            }
            .foregroundColor(Color.white.opacity(0.75))
            .padding()
            .frame(height: 160, alignment: .top)
            .background(
                ZStack {
                    Color.black
                        .opacity(0.9)
                        .edgesIgnoringSafeArea(.top)
                    
                    HStack {
                        Rectangle()
                            .stroke(Color.gray.opacity(0.2), lineWidth: 30)
                            .offset(CGSize(width: -size.width/5, height: 85.0))
                        Circle()
                            .stroke(Color.gray.opacity(0.2), lineWidth: 30)
                            .offset(CGSize(width: size.width/6, height: -60.0))
                        
                    }
                    .clipped()
                }
            )
            
            Spacer()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView()
    }
}
