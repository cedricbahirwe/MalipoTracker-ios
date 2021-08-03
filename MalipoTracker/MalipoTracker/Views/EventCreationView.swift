//
//  EventCreationView.swift
//  MalipoTracker
//
//  Created by Cédric Bahirwe on 03/07/2021.
//

import SwiftUI

struct EventCreationView: View {
    @Environment(\.presentationMode)
    private var presentationMode
    
    @State private var event: MTEvent = .default
    
    private var noteCount: Int {
        let note = event.customNote
        return note == nil ? 0 : note!.count
    }
    
    private var titleView: some View {
        HStack {
            TitleBold("Title")
            Spacer()
            TextField("Title", text: $event.title)
                .roundeField()
        }
    }
    private var amountView: some View {
        HStack{
            TitleBold("Amount(CDF)")
            Spacer()
            TextField("Amount", text: $event.amount.toBindable)
                
                .roundeField()
        }
    }
    
    private var descriptionView: some View {
        VStack(alignment: .leading) {
            TitleBold("Description")
            TextEditor(text: Binding(get: { event.customNote ?? "" },
                                     set: { event.customNote = $0}))
                .padding(8)
                .frame(height: 100)
                .background(Color(.systemBackground))
                .cornerRadius(12)
            HStack(spacing: 0) {
                Spacer()
                Text(noteCount.description)
                Text(" / 140")
                    .fontWeight(.medium)
            }
            .foregroundColor(.secondary)
            
        }
    }
    var body: some View {
        VStack(spacing: 0) {
            topheader
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 12) {
                    
//                    titleView
//
//                    amountView
//
//                    descriptionView
                   
                    VStack(alignment: .leading, spacing: 10) {
                        TitleBold("Status")
                        
                        Picker("", selection: $event.status) {
                            ForEach(MTEventStatus.allCases, id:\.self) { status in
                                Text(status.rawValue.capitalized)
                                    .font(.caption)
                                
                            }
                        }
                        .labelsHidden()
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                   
                    
                    VStack(spacing: 15) {
                        DatePicker("Due Date",
                                   selection: $event.dueDate, displayedComponents: .date)
                        DatePicker("Due Time",
                                   selection: $event.dueDate, displayedComponents: .hourAndMinute)
                    }
                    .font(Font.body.weight(.medium))

                    VStack(alignment: .leading, spacing: 10) {
                        TitleBold("Repetition")
                        
                        Picker("", selection: $event.repetition) {
                            ForEach(MTEventRepetition.allCases, id:\.self) { status in
                                Text(status.rawValue.capitalized)
                                    .font(.caption)
                                
                            }
                        }
                        .labelsHidden()
                        .pickerStyle(SegmentedPickerStyle())
                        
                    }
                    
                    VStack(alignment: .leading) {
                        TitleBold("Category")
//                        Pic
//                        Picker("", selection: $event.category) {
//                            ForEach(MTEventCategory.allCases, id:\.self) { status in
//                                Text(status.rawValue.capitalized)
//                                    .font(.caption)
//
//                            }
//                        }
//                        .labelsHidden()
//                        .pickerStyle(SegmentedPickerStyle())
                        
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
                                        }
                                        else {
                                            Capsule()
                                                .fill(Color.primary)
                                        }
                                    }
                                )
                        }
                    }
                    
                    //                VStack(alignment: .leading, spacing: 15) {
                    //                    TitleBold("Repetition")
                    //                    HStack {
                    //                        ForEach([Color.red, .green, .yellow, .purple, .orange],
                    //                                id:\.self) { color in
                    //                            ZStack {
                    //                                color
                    //                                    .frame(width: 30, height: 30)
                    //                                    .clipShape(Circle())
                    //                                if  color == .red  {
                    //                                    Image(systemName: "checkmark")
                    //                                        .imageScale(.small)
                    //                                        .foregroundColor(.white)
                    //                                }
                    //                            }
                    //                        }
                    //                    }
                    //                }
                }
                .padding(12)
            }
        }
        .font(Font.system(.body, design: .rounded))
        .background(
            Color(.secondarySystemBackground)
                .ignoresSafeArea()
        )
        //        .preferredColorScheme(.dark)
    }
    
    @ViewBuilder
    func TitleBold(_ value: String) -> some View {
        Text(value).fontWeight(.medium)
    }
    
    @ViewBuilder
    func field(value: Binding<String>) -> some View {
        TextField(value.wrappedValue, text: value)
            .font(.callout)
            .padding(.leading)
            .frame(height: 45)
            .frame(width: 200)
            .background(Color(.systemBackground))
            .cornerRadius(12)
    }
}


struct EventCreationView_Previews: PreviewProvider {
    static var previews: some View {
        EventCreationView()
    }
}

extension EventCreationView {
    var topheader: some View {
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
                .clipShape(Circle())
        }
        .foregroundColor(.primary)
        .padding(10)
    }
}

extension Double {
    /// Returns a `Binding Boolean` value of an Int value
    var toBindable: String {
        get { String(self) }
        set(value) { self = Double(value) ?? 0 }
    }
}
