//
//  GridItemView.swift
//  GridExamples
//
//  Created by Riley Calkins on 4/27/24.
//

import SwiftUI

struct GridItemView: View {
    let type: GridType
    let color: Color
    var size: CGFloat
    let sound: NamedSFX
    @State var animationValue = 0
    @State var value = 1
    var body: some View {
        Button {
            animationValue += 1
        } label: {
            Group {
                switch type {
                case .vertical:
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: size)
                                        case .horizontal:
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: size)
                }
            }.overlay {
                VStack {
                    Image(systemName: "speaker.wave.3.fill")
                        .symbolEffect(.bounce.byLayer, value: animationValue)
                        .font(.title)
                    Text(sound.name)
                        .font(.caption2)
                        .padding(.horizontal)
                }
                .foregroundStyle(.white)
            }
        }
        .buttonStyle(GridItemButtonStyle(sfx: sound, color: color))
    }
}
