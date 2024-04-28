//
//  DebuggingModifiers.swift
//  GridExamples
//
//  Created by Riley Calkins on 4/27/24.
//

import SwiftUI

struct DebuggingSizeOverlayModifier: ViewModifier {
    var color: Color
    func body(content: Content) -> some View {
        content.overlay {
            GeometryReader { proxy in
                let widthDesc = proxy.size.width.description
                let heightDesc = proxy.size.height.description
                Text(widthDesc + "X" + heightDesc)
                    .font(.caption2)
                    .foregroundStyle(.white)
                    .padding(5)
                    .background(color.opacity(0.4))
                    .clipShape(.rect(cornerRadius: 5))
                    .fixedSize()
                    .frame(width: proxy.size.width, height: proxy.size.height)
            }
        }
    }
}

struct AutoBorderModifier: ViewModifier {
    var color: Color
    func body(content: Content) -> some View {
        content.border(color, width: 1)
    }
}

struct UnderlineTextModifier: ViewModifier {
    var color: Color
    func body(content: Content) -> some View {
        content.overlay(alignment: .centerFirstTextBaseline) {
            color.frame(height: 1)
        }
    }
}

extension View {
    func debugSizeOverlay(color: Color = Color.indigo) -> some View {
        self.modifier(DebuggingSizeOverlayModifier(color: color))
    }
    
    func autoBorder(color: Color = Color.indigo) -> some View {
        self.modifier(AutoBorderModifier(color: color))
    }
    
    func underlineText(color: Color = Color.indigo) -> some View {
        self.modifier(UnderlineTextModifier(color: color))
    }
}
