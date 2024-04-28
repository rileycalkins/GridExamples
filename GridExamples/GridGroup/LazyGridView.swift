//
//  SwiftUIView.swift
//  GridExamples
//
//  Created by Riley Calkins on 4/26/24.
//

import SwiftUI
import Observation
import CoreGraphics
import AudioToolbox

extension Int {
    var cgFloat: CGFloat {
        return CGFloat(self)
    }
}

struct LazyGridView: View {
    @State var gridVM = GridVM()

    var body: some View {
        Group {
            @Bindable var gridVM = gridVM
            VStack {
                
                gridParameterRow
                Group {
                    switch gridVM.gridType {
                    case .vertical:
                        vGridSubView
                    case .horizontal:
                        Group {
                            GeometryReader { geometry in
                                ScrollView(.vertical) {
                                    hGridSubView
                                }.frame(width: geometry.size.width, height: geometry.size.height)
                            }
                        }
                        

                        
                    }
                }
            }
        }.safeAreaInset(edge: .top) {
            headerView
        }
    }
    
    var headerView: some View {

            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    gridOrientationSwitchButton
                    Spacer()
                    gridHeaderTitle
                    Spacer()
                    alignmentSubView.frame(width: 240)
                }
                HStack {
                    spacingSubView
                        .frame(width: 240)
                    Spacer()
                    itemCountStepper
                        .frame(width: 240)
                    Spacer()
                    frameStepper
                        .frame(width: 240)
                }
                GridSegmentedPicker(selectedItemType: $gridVM.selectedItemType)
            }
            .padding(.horizontal)
            .padding(.top)
    }
    
    var alignmentSubView: some View {
        Group {
            switch gridVM.gridType {
            case .vertical:
                HStack {
                    horizontalAlignmentButton(type: .horizontalLeft) {
                        gridVM.horiztonalAlignmentType = .horizontalLeft
                    }
                    Spacer()
                    horizontalAlignmentButton(type: .horizontalCenter) {
                        gridVM.horiztonalAlignmentType = .horizontalCenter
                    }
                    Spacer()
                    horizontalAlignmentButton(type: .horizontalRight) {
                        gridVM.horiztonalAlignmentType = .horizontalRight
                    }
                }
                .padding()
                .roundRectBorder(cornerRadius: 10, borderWidth: 1)
            case .horizontal:
                HStack {
                    verticalAlignmentButton(type: .verticalTop) {
                        gridVM.verticalAlignmentType = .verticalTop
                    }
                    Spacer()
                    verticalAlignmentButton(type: .verticalCenter) {
                        gridVM.verticalAlignmentType = .verticalCenter
                    }
                    Spacer()
                    verticalAlignmentButton(type: .verticalBottom) {
                        gridVM.verticalAlignmentType = .verticalBottom
                    }
                }.padding()
                    .roundRectBorder(cornerRadius: 10, borderWidth: 1)
            }
        }
    }
    
    var spacingSubView: some View {
        HStack {
            Stepper("Spacing: \(gridVM.spacing.value.description)", value: $gridVM.spacing.value)
                .padding()
                .roundRectBorder(cornerRadius: 10, borderWidth: 1)
        }
    }
    
    func horizontalAlignmentButton(type: HorizontalAlignmentType, closure: @escaping () -> ()) -> some View {
        Button {
            closure()
        } label: {
            Image(systemName: type.imageName)
                .font(.title)
                .foregroundStyle(type == gridVM.horiztonalAlignmentType ? .black : .gray.opacity(0.4))
        }
    }
    
    func verticalAlignmentButton(type: VerticalAlignmentType, closure: @escaping () -> ()) -> some View {
        Button {
            closure()
        } label: {
            Image(systemName: type.imageName)
                .foregroundStyle(type == gridVM.verticalAlignmentType ? .black : .gray.opacity(0.4))
                .font(.title)
        }
    }
    
    var vGridSubView: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: gridVM.vGridArray(gridVM.minimum, gridVM.maximum, gridVM.fixed, gridVM.count), alignment: gridVM.horiztonalAlignmentType.alignment, spacing: gridVM.spacing.value.cgFloat) {
                ForEach(gridVM.colorCollection(count: gridVM.arrayCount.value), id: \.self) { color in
                    GridItemView(type: .vertical, color: color, size: gridVM.frameValue.value.cgFloat, sound: SystemSoundID.returnRandomSFX())
                }
            }.padding()
        }
    }
    
    var hGridSubView: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: gridVM.hGridArray(gridVM.minimum, gridVM.maximum, gridVM.fixed, gridVM.count), alignment: gridVM.verticalAlignmentType.alignment, spacing: gridVM.spacing.value.cgFloat) {
                ForEach(gridVM.colorCollection(count: gridVM.arrayCount.value).indices, id: \.self) { index in
                    GridItemView(type: .horizontal, color: gridVM.colorCollection(count: gridVM.arrayCount.value)[index], size: gridVM.frameValue.value.cgFloat, sound: SystemSoundID.returnSFX(at: index))
                }
            }.padding()
        }
    }
    var itemCountStepper: some View {
        Stepper("Items: \(gridVM.arrayCount.value)", value: $gridVM.arrayCount.value)
            .padding()
            .roundRectBorder(cornerRadius: 10, borderWidth: 1)
    }
    
    var gridOrientationSwitchButton: some View {
        Label(gridVM.gridType.title, systemImage: gridVM.gridType.imageName)
            .labelStyle(.titleAndIcon)
            .font(.title)
            .padding()
            .frame(width: 240)
            .roundRectBorder(cornerRadius: 10, borderWidth: 1)
            .onTapGesture {
                gridVM.gridType.toggle()
            }
        
    }
    
    var gridHeaderTitle: some View {
        Text(gridVM.selectedItemType.title + " " + "Grid")
            .font(.largeTitle)
            .padding()
    }
    
    var gridParameterRow: some View {
        HStack {
            GridParameterView(type: .min, enabled: $gridVM.minimumEnabled, text: gridVM.minimum.toInt.description, value: $gridVM.minimum, gridLayout: gridVM.gridType)
            Spacer()
            GridParameterView(type: .max, enabled: $gridVM.maximumEnabled, text: gridVM.maximum.toInt.description, value: $gridVM.maximum, gridLayout: gridVM.gridType)
            Spacer()
            GridParameterView(type: .fixed, enabled: $gridVM.fixedEnabled, text: gridVM.fixed.toInt.description, value: $gridVM.fixed, gridLayout: gridVM.gridType)
            Spacer()
            GridParameterView(type: .count, enabled: $gridVM.countEnabled, text: gridVM.count.description, value: $gridVM.countCGFloat, gridLayout: gridVM.gridType)
        }.padding()
    }
    
    var frameStepper: some View {
        Stepper(gridVM.gridType == .vertical ? "Height: \(gridVM.frameValue.value)" : "Width: \(gridVM.frameValue.value)", value: $gridVM.frameValue.value)
            .padding()
            .roundRectBorder(cornerRadius: 10, borderWidth: 1)
    }
}

