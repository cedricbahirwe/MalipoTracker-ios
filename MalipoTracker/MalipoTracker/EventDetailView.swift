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
        VStack(spacing: 0) {
            VStack(alignment: .leading) {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.left")
                            .imageScale(.large)
                            .padding([.vertical, .trailing], 10)
                    })
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "gear")
                            .imageScale(.large)
                            .padding([.vertical, .leading], 10)
                    })
                }
                .padding(.horizontal)

                Text("Rememeber to pay rent for December ")
                    .font(.system(size: 23, weight: .bold))
                    .padding(.horizontal)

            }
            .foregroundColor(Color.white.opacity(0.65))
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
            
            
            VStack {
                HStack {
                    Image("1")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .cornerRadius(5)
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Cédric Bahirwe")
                            .font(.system(size: 13, weight: .medium))
                        Text("5 hours ago")
                            .font(.system(size: 12, weight: .light))
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    
                    Text("Urgent")
                        .font(.system(size: 10, weight: .medium))
                        .foregroundColor(Color(.systemBackground))
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(Color(.label))
                        .cornerRadius(8)
                }
                .padding()
                VStack(spacing: 0) {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("21 October, 2021")
                                .font(.system(size: 13, weight: .medium))
                            Text("Date")
                                .font(.system(size: 12, weight: .light))
                                .foregroundColor(.gray)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        Divider()
                            .frame(height: 45)
                            .padding(.trailing)
                        VStack(alignment: .leading, spacing: 5) {
                            Text("11:30 - 13:00")
                                .font(.system(size: 13, weight: .medium))
                            Text("Time")
                                .font(.system(size: 12, weight: .light))
                                .foregroundColor(.gray)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    .padding(.top)
                    Divider()
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Description")
                            .font(.system(size: 13, weight: .medium))
                        Text("It looks a little like Latin, but the words are all weird and meaningless. It's a classic that has been around since at least the 1960s. But there's a problem. It's boring. It's a classic that has been around since at least the end.")
                            .font(.system(size: 16, weight: .light))
                            .foregroundColor(.gray)
                            .lineSpacing(5)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Assigned to:")
                            .font(.system(size: 13, weight: .medium))
                        HStack {
                            ForEach(0 ..< 5) { i in
                                Image("\(i+1)")
                                    .resizable()
                                    .frame(width: 35, height: 35)
                                    .cornerRadius(5)
                            }
                        }
                        .padding(.top, 5)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                }
                .padding()
                .background(Color(.systemBackground).ignoresSafeArea(.all))
                .cornerRadius(12)
            }
            .background(Color(.secondarySystemBackground).ignoresSafeArea(.all))
            .cornerRadius(12)
        }
        .background(Color.black.ignoresSafeArea(.all))
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView()
    }
}
