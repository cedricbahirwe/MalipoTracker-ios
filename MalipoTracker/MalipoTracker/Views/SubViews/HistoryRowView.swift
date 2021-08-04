//
//  HistoryRowView.swift
//  MalipoTracker
//
//  Created by Cédric Bahirwe on 03/07/2021.
//

import SwiftUI

struct HistoryRowView: View {
    let bgColor: Color
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            
            Text("Loyer Himbi")
                .font(Font.title3.bold())
            
            Text("10$")
                .font(Font.headline.bold())
            Toggle("7/15/2021", isOn: .constant(true))
                .opacity(0.6)
                .font(Font.callout)
        }
        .foregroundColor(.white)
        .overlay(
            Circle()
                .fill(Color.green)
                .frame(width: 20, height: 20)
            , alignment: .topTrailing
        )
        .padding(8)
        .background(bgColor.contrast(0.6))
        .cornerRadius(10)
    }
}


struct HistoryRowView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryRowView(bgColor: .black)
            .padding(10)
            .previewLayout(.fixed(width: 400, height: 130))
    }
}
