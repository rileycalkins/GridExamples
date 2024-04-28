//
//  ViewModifiers.swift
//  GridExamples
//
//  Created by Riley Calkins on 4/27/24.
//

import SwiftUI

struct RoundedRectangleBorderModifier: ViewModifier {
    var cornerRadius: CGFloat
    var borderWidth: CGFloat
    var color: Color
    func body(content: Content) -> some View {
        content.overlay {
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(color, lineWidth: borderWidth)
        }
    }
}

extension View {
    func roundRectBorder(cornerRadius: CGFloat = 10, borderWidth: CGFloat = 1, color: Color = Color.gray.opacity(0.4)) -> some View {
        self.modifier(RoundedRectangleBorderModifier(cornerRadius: cornerRadius, borderWidth: borderWidth, color: color))
    }
}
