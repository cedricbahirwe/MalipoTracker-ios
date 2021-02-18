//
//  SenderModalView.swift
//  MalipoTracker
//
//  Created by Cédric Bahirwe on 18/02/2021.
//

import SwiftUI

struct SenderModalView: View {
    
    func circleSize(_ index: Int) -> CGFloat {
        size.width/2 + (CGFloat(index) * size.width/2.3)
    }
    
    var body: some View {
        ZStack {
            Color.bgColor
                .ignoresSafeArea(.all, edges: .all)
            VStack {
                Spacer()
                ZStack(alignment: .bottom) {
                    ForEach(0..<4) { i in
                        Circle()
                            .fill(Color(.darkGray).opacity(0.06))
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
                                    .offset(y: -15)
                                    .rotationEffect(.degrees(-Double(i*5)))
                                , alignment: i != 0 ? .top : .center
                            )
                            .rotationEffect(.degrees(Double(i*5)))
                            .scaleEffect(i==0 ? 0.9 : 1)
                            .offset(y: i==0 ? -60 : 0)
                            .offset(y: circleSize(i)/2.5)
                            .zIndex(Double(90-i))
                    }
                }
                .padding(.bottom, 10)
            }
            .background(
                Color.bgColor
            )
        }
    }
}

struct SenderModalView_Previews: PreviewProvider {
    static var previews: some View {
        SenderModalView()
    }
}
