//
//  GridItemButtonModifier.swift
//  GridExamples
//
//  Created by Riley Calkins on 4/27/24.
//

import SwiftUI

struct GridItemButtonStyle: ButtonStyle {
    let sfx: NamedSFX
    var color: Color
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(color.gradient)
            .opacity(configuration.isPressed ? 1 : 0.7)
            .scaleEffect(configuration.isPressed ? 0.8 : 1)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(color, lineWidth: 4)
                    .animation(.spring(), value: configuration.isPressed)
                    .opacity(configuration.isPressed ? 1 : 0.7)
                    .scaleEffect(configuration.isPressed ? 0.8 : 1)
                    .playSound(isPressed: configuration.isPressed, sound: sfx)
            }
    }
}
