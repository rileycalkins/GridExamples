//
//  AlignmentTypes.swift
//  GridExamples
//
//  Created by Riley Calkins on 4/27/24.
//

import SwiftUI

enum HorizontalAlignmentType {
    
    case horizontalLeft
    case horizontalCenter
    case horizontalRight
    var imageName: String {
        switch self {
        case .horizontalLeft:
            return "align.horizontal.left"
        case .horizontalCenter:
            return "align.horizontal.center"
        case .horizontalRight:
            return "align.horizontal.right"
        }
    }
    
    var alignment: HorizontalAlignment {
        switch self {
        case .horizontalLeft:
            return .leading
        case .horizontalCenter:
            return .center
        case .horizontalRight:
            return .trailing
        }
    }
}
enum VerticalAlignmentType {
    case verticalTop
    case verticalCenter
    case verticalBottom
    var imageName: String {
        switch self {
        case .verticalTop:
            return "align.vertical.top"
        case .verticalCenter:
            return "align.vertical.center"
        case .verticalBottom:
            return "align.vertical.bottom"
        }
    }
    
    var alignment: VerticalAlignment {
        switch self {
        case .verticalTop:
            return .top
        case .verticalCenter:
            return .center
        case .verticalBottom:
            return .bottom
        }
    }
}
