//
//  SenderModalView.swift
//  MalipoTracker
//
//  Created by Cédric Bahirwe on 18/02/2021.
//

import SwiftUI

struct SenderModalView: View {
    
    func circleSize(_ index: Int) -> CGFloat {
        size.width/2 + (CGFloat(index) * size.width/3.7)
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                HStack {
                    Image(systemName: "plus")
                        .foregroundColor(.black)
                        .padding()
                        .font(.title)
                        .rotationEffect(.radians(.pi/4))
                        .frame(height: 150, alignment: .top)
                    
                    Spacer()
                }
                Spacer()
            }
            .frame(height: size.height)
            VStack(spacing: 0) {
                VStack(spacing: 8) {
                    Text("$250.00")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("Lend to...")
                        .font(.caption)
                }
                .foregroundColor(.white)
                .padding(.vertical, 25)
                Spacer()
                ZStack(alignment: .bottom) {
                    ForEach(0..<4) { i in
                        Circle()
                            .fill(Color(.white).opacity(0.04))
                            .frame(
                                width: circleSize(i),
                                height: circleSize(i),
                                alignment: .top
                            )
                            .overlay(
                                Image("\(i+1)")
                                    .resizable()
                                    .frame(width: i == 0 ? 45 : 30, height: i == 0 ? 45 : 30)
                                    .clipShape(Circle())
                                    .overlay(Circle().strokeBorder(Color.black, lineWidth:1))
                                    .scaleEffect(i%2 == 0 ? 1.3 : 1)
                                    .offset(y: -15)
                                    .rotationEffect(.degrees(-Double(i*10)))
                                , alignment: i != 0 ? .top : .center
                            )
                            .rotationEffect(.degrees(Double(i*10)))
                            .scaleEffect(i==0 ? 0.75 : 1)
                            .offset(y: i==0 ? -50 : -20)
                            .offset(y: circleSize(i)/4)
                            .zIndex(Double(90-i))
                    }
                }
                .frame(width: size.width-10)
                .clipped()
            }
            .background(
                Color.black
                    .frame(width: size.width-10)
                    .cornerRadius(60, corners: [.topLeft, .topRight])
            )
            .padding(.top, 70)
        }
        .frame(height: size.height)
        .frame(width: size.width)
        .clipped()
    }
}

struct SenderModalView_Previews: PreviewProvider {
    static var previews: some View {
        SenderModalView()
    }
}
