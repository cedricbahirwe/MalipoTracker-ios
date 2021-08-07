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
    @State private var showContactPicker = false
    
    @State private var allContacts: [MTContact] = []
    @State private var selectedContact: MTContact? = .init(givenName: "", lastName: "", phoneNumbers: [])
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
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .keyboardType(.numbersAndPunctuation)
                .roundeField()
        }
    }
    
    private var descriptionView: some View {
        VStack(alignment: .leading) {
            TitleBold("Description")
            TextEditor(text: Binding(get: { event.customNote ?? "" },
                                     set: descriptionHandler))
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
    
    private func descriptionHandler(_ text: String) {
        if text.count <= 140 {
            event.customNote = text
        }
    }
    var body: some View {
        VStack(spacing: 0) {
            topheader
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 12) {
                    
                    titleView

                    amountView

                    descriptionView
                   
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
                            }
                        }
                        .labelsHidden()
                        .pickerStyle(SegmentedPickerStyle())
                        
                    }
                    
                    VStack(alignment: .leading) {
                        TitleBold("Category")
                        Picker("", selection: $event.category) {
                            ForEach(MTEventCategory.Base.allCases, id:\.self) { category in
                                Text(category.rawValue.capitalized)
                                
                            }
                        }
                        .labelsHidden()
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    
                    HStack {
                        TitleBold("Contact")
                        Spacer()
                        Text("Contact")
                            .roundeField()
                            .contentShape(Rectangle())
                            .onTapGesture {
                                allContacts = PhoneContacts.getAllContacts()
                                if allContacts.isEmpty { return }
                                showContactPicker.toggle()
                            }
                            
                    }
                    .sheet(isPresented: $showContactPicker) {
                        ContactsPickerView(contacts: $allContacts,
                                           selection: $selectedContact)
                    }
                    
                }
                .padding(12)
            }
        }
        .font(Font.system(.body, design: .rounded))
        .background(
            Color(.secondarySystemBackground)
                .ignoresSafeArea()
        )
        
//                .preferredColorScheme(.dark)
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
