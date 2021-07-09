//
//  Fonts_Extensions.swift
//  MalipoTracker
//
//  Created by Cédric Bahirwe on 09/07/2021.
//

import SwiftUI

enum CustomFont: String {
    case regular = "Italiana-Regular"
}

extension Font {
    static func italiana(_ name: CustomFont = .regular, _ size: CGFloat) -> Font {
        Font.custom(name.rawValue, size: size)
    }
    
    static func italiana(_ name: CustomFont = .regular, _ size: CGFloat, relativeTo: TextStyle) -> Font {
        Font.custom(name.rawValue, size: size, relativeTo: relativeTo)
    }
}
