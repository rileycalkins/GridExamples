//
//  GridSegmentPicker.swift
//  GridExamples
//
//  Created by Riley Calkins on 4/27/24.
//

import SwiftUI

struct GridSegmentedPicker: View {
    @Binding var selectedItemType: GridItemType
    var body: some View {
        Picker(selection: $selectedItemType) {
            Text(GridItemType.flex.title).tag(GridItemType.flex)
            Text(GridItemType.adaptive.title).tag(GridItemType.adaptive)
            Text(GridItemType.fixed.title).tag(GridItemType.fixed)
        } label: {
            Text("Text")
        }.pickerStyle(.segmented)
            .frame(height: 50)
    }
}
