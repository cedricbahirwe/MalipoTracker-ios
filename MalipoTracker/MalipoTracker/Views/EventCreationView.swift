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
                    TitleBold("Enter Event name")
                    TextField("Title here", text: $event.title)
                    Divider()
                }
                
                VStack(alignment: .leading) {
                    TitleBold("Category")
                    HStack {
                        Text("12:11 AM, Jul 3, 2021")
                            .font(Font.callout.weight(.medium))
                        Spacer()
                        Image(systemName: "calendar.circle.fill")
                            .imageScale(.large)
                    }
                    .foregroundColor(.primary)
                    .padding(.vertical,2)
                    Divider()
                }
                
                VStack(alignment: .leading, spacing: 15) {
                    TitleBold("Category")
                    HStack(spacing: 15) {
                        ForEach(MTEventCategory.Base.allCases,
                                id: \.self) { category in
                            Text(category.rawValue.capitalized)
                                .font(.callout)
                                .padding(.vertical, 5)
                                .foregroundColor(category == .loan ? Color(.systemBackground) : .primary)
                                .frame(maxWidth: .infinity)
                                .background(
                                    ZStack {
                                        if category != .loan {
                                            Capsule()
                                                .stroke(Color.primary)
                                        } else {
                                            Capsule()
                                                .fill(Color.primary)
                                        }
                                    }
                                )
                        }
                    }
                }
                
                
                VStack(alignment: .leading, spacing: 15) {
                    TitleBold("Repetition")
                    HStack {
                        ForEach([Color.red, .green, .yellow, .purple, .orange],
                                id:\.self) { color in
                            ZStack {
                                color
                                    .frame(width: 30, height: 30)
                                    .clipShape(Circle())
                                if  color == .red  {
                                    Image(systemName: "checkmark")
                                        .imageScale(.small)
                                        .foregroundColor(.white)
                                }
                            }
                            
                        }
                    }
                }
                
            }
            .foregroundColor(.secondary)
            .padding(10)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
        }
//        .preferredColorScheme(.dark)
    }
    
    @ViewBuilder
    func TitleBold(_ value: String) -> some View {
        Text(value).fontWeight(.medium)
    }
}

struct EventCreationView_Previews: PreviewProvider {
    static var previews: some View {
        EventCreationView()
    }
}
