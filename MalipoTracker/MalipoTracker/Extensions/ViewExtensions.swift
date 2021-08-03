//
//  ViewExtensions.swift
//  MalipoTracker
//
//  Created by Cédric Bahirwe on 03/08/2021.
//

import SwiftUI


struct RoundedField: ViewModifier {
    let radius: CGFloat
    let width: CGFloat
    let height: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.callout)
            .padding(.leading)
            .frame(height: height)
            .frame(width: width)
            .background(Color(.systemBackground))
            .cornerRadius(radius)
    }
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
    // Apply Neumorphism light and dark shadow
    func neumorphismShadow() -> some View {
        self
            .shadow(color: .lightShadow, radius: 8, x: -8, y: -8)
            .shadow(color: .darkShadow, radius: 8, x: 8, y: 8)
    }
    
    func roundeField(radius: CGFloat = 12,
                      width: CGFloat = 200,
                      height: CGFloat = 45) -> some View {
        
        ModifiedContent(content: self,
                        modifier: RoundedField(radius: radius,
                                               width: width,
                                               height: height))
        
    }
}

extension Color {
    static let bgColor = Color(.label)
    
    static let fgColor = Color(.systemBackground)
    
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
//    static let mainColor = Color(red: 41 / 255, green: 19/255, blue: 105 / 255)
//    static let mainBgColor = Color(red: 0.913, green: 0.921, blue: 0.969)
    static let navyBlue = Color(red: 0, green: 0, blue: 128)
    static let darkBlue = Color(red: 0, green: 0, blue: 139)
    static let mediumBlue = Color(red: 0, green: 0, blue: 205)
    
    
    // Neumorphism Colors
    static let background = Color("background")
    static let lightShadow = Color("lightShadow")
    static let darkShadow = Color("darkShadow")
    
    static let mainblue = Color("mainBlue")
    static let darkGray =  Color(.darkGray)
}
