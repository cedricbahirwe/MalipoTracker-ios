//
//  GraphAxis.swift
//  MalipoTracker
//
//  Created by Cédric Bahirwe on 03/07/2021.
//

import SwiftUI

struct GraphAxis: View {
    enum GraphAlignment {
        case horizontal, vertical
    }
    let length: CGFloat
    let alignment: GraphAlignment
    var isHorizontal: Bool { alignment == .horizontal }
    var body: some View {
        Rectangle()
            .frame(width: isHorizontal ? length : 2,
                   height: isHorizontal ? 2 : length)
            .overlay(
                Image(systemName: isHorizontal ? "chevron.right" : "chevron.up")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15,
                           height: 15,
                           alignment: isHorizontal ? .trailing: .top)
                    .offset(x: isHorizontal ? 2 : 0,
                            y: isHorizontal ? 0 : -2)
                , alignment: isHorizontal ? .trailing: .top
            )
    }
}
