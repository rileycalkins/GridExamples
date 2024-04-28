//
//  StaticGridView.swift
//  GridExamples
//
//  Created by Riley Calkins on 4/26/24.
//

import SwiftUI



struct StaticGridView: View {
    @State var isOn = false
    @State var documentIsOn = false
    @State var cellColumnsCount: Int = 3
    @State var leftHorizontalAlignment: HorizontalAlignmentType = .horizontalCenter
    @State var centerHorizontalAlignment: HorizontalAlignmentType = .horizontalCenter
    @State var rightHorizontalAlignment: HorizontalAlignmentType = .horizontalCenter
    @State var verticalAlignment: VerticalAlignmentType = .verticalCenter
    
    var staticGridView: some View {
        GridRow {
            RoundedRectangle(cornerRadius: 10)
                .fill(.pink.gradient)
                .frame(width: 100, height: 100)
                .gridColumnAlignment(leftHorizontalAlignment.alignment)
            VStack {
                Circle()
                    .foregroundStyle(.secondary)
                    .frame(width: 60, height: 60)
                Text("Hello")
            }.gridColumnAlignment(centerHorizontalAlignment.alignment)
            VStack {
                Button("Tap Me") {
                    
                }.buttonStyle(.borderedProminent)
                Toggle("Volume", isOn: $isOn)
                    .labelsHidden()
            }.frame(width: 100, height: 100)
            .gridColumnAlignment(rightHorizontalAlignment.alignment)
        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            Grid {
                staticGridView
                
                staticGridView
                    
                staticGridView
                GridRow {
                    Color.clear.gridCellUnsizedAxes([.horizontal])
                    Toggle("Use fixed-width font for new documents.", isOn: $documentIsOn)
                    Color.clear.gridCellUnsizedAxes([.horizontal])
                }
                GridRow {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.teal.gradient)
                        .frame(height: 100)
                        .gridCellColumns(cellColumnsCount)
                        .overlay {
                            Text(".gridCellColumns(\(cellColumnsCount))").foregroundStyle(.white)
                        }
                }
                
            }
        }.padding()
        .safeAreaInset(edge: .top) {
            VStack {
                HStack {
                    VerticalAlignmentSelector(alignment: $verticalAlignment)
                    Spacer()
                    pickerForColumnCount($cellColumnsCount)
                }
                HStack {
                    HorizontalAlignmentSelector(alignment: $leftHorizontalAlignment)
                    Spacer()
                    HorizontalAlignmentSelector(alignment: $centerHorizontalAlignment)
                    Spacer()
                    HorizontalAlignmentSelector(alignment: $rightHorizontalAlignment)
                }
                
            }
           
            .padding()
            
        }
    }
    
    func pickerForColumnCount(_ selection: Binding<Int>) -> some View {
        Picker("", selection: selection) {
            Text("One").tag(1)
            Text("Two").tag(2)
            Text("Three").tag(3)
        }.pickerStyle(.segmented)
    }
}

struct VerticalAlignmentSelector: View {
    @Binding var alignment: VerticalAlignmentType
    var body: some View {
        HStack {
            verticalAlignmentButton(type: .verticalTop) {
                alignment = .verticalTop
            }
            Spacer()
            verticalAlignmentButton(type: .verticalCenter) {
                alignment = .verticalCenter
            }
            Spacer()
            verticalAlignmentButton(type: .verticalBottom) {
                alignment = .verticalBottom
            }
        }.padding()
            .roundRectBorder(cornerRadius: 10, borderWidth: 1)
            .frame(width: 240)
    }
    
    func verticalAlignmentButton(type: VerticalAlignmentType, closure: @escaping () -> ()) -> some View {
        Button {
            closure()
        } label: {
            Image(systemName: type.imageName)
                .foregroundStyle(alignment == type ? .black : .gray.opacity(0.4))
                .font(.title)
        }
    }
}

struct HorizontalAlignmentSelector: View {
    @Binding var alignment: HorizontalAlignmentType
    var body: some View {
        HStack {
            horizontalAlignmentButton(type: .horizontalLeft) {
                alignment = .horizontalLeft
            }
            Spacer()
            horizontalAlignmentButton(type: .horizontalCenter) {
                alignment = .horizontalCenter
            }
            Spacer()
            horizontalAlignmentButton(type: .horizontalRight) {
                alignment = .horizontalRight
            }
        }.padding()
        .roundRectBorder(cornerRadius: 10, borderWidth: 1)
        .frame(width: 240)
    }
    
    func horizontalAlignmentButton(type: HorizontalAlignmentType, closure: @escaping () -> ()) -> some View {
        Button {
            closure()
        } label: {
            Image(systemName: type.imageName)
                .font(.title)
                .foregroundStyle(alignment == type ? .black : .gray.opacity(0.4))
        }
    }
}
