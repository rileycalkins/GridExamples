//
//  GridParameterView.swift
//  GridExamples
//
//  Created by Riley Calkins on 4/27/24.
//

import SwiftUI


struct GridParameterView: View {
    let type: GridParameterType
    @Binding var enabled: Bool
    var text: String
    @Binding var value: CGFloat
    var gridLayout: GridType
    var body: some View {
        VStack {
            HStack {
                
                if type == .count {
                    Text(gridLayout == .vertical ? "Column" : "Row") + Text(" " + type.label)
                    Toggle("", isOn: $enabled)
                        .disabled(true)
                } else {
                    Text(type.label + " " + gridLayout.parameter)
                    Toggle("", isOn: $enabled)
                }
            }
            Spacer().frame(height: 20)
            HStack {
                Text("\(text)")
                Stepper("", value: $value)
            }
        }.padding()
        .background(RoundedRectangle(cornerRadius: 10).stroke(.quaternary, lineWidth: 1))
    }
}
