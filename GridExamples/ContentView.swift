//
//  ContentView.swift
//  GridExamples
//
//  Created by Riley Calkins on 4/26/24.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab = 1
    var body: some View {
        TabView(selection: $selectedTab) {
            LazyGridView()
                .tabItem { HStack {
                    Image(systemName: "circle")
                    Text("Lazy")
                }}.tag(1)
            StaticGridView()
                .tabItem { HStack {
                    Image(systemName: "square")
                    Text("Static")
                } }.tag(2)
        }
    }
}

#Preview {
    ContentView()
}
