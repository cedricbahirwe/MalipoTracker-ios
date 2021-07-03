//
//  EventCreationView.swift
//  MalipoTracker
//
//  Created by Cédric Bahirwe on 03/07/2021.
//

import SwiftUI

struct EventCreationView: View {
    @Environment(\.presentationMode) var presentationMode

    @State private var event: MTEvent = .default
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .padding([.vertical, .trailing], 10)
                })
                Spacer()
                Text("New Event")
                    .bold()
                Spacer()
                Image("1")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .cornerRadius(5)
            }
            .foregroundColor(.primary)
            .padding(10)
            
            VStack(alignment: .leading) {
                
                VStack(alignment: .leading) {
                    Text("Enter Event name")
                        .fontWeight(.medium)
                    TextField("title here", text: $event.title)
                }
                
                VStack(alignment: .leading) {
                    Text("T Event name")
                        .fontWeight(.medium)
                    TextField("title here", text: $event.title)
                }
                
            }
            .foregroundColor(.secondary)
            .padding(10)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
        }
    }
}

struct EventCreationView_Previews: PreviewProvider {
    static var previews: some View {
        EventCreationView()
    }
}
