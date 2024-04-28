//
//  GridType.swift
//  GridExamples
//
//  Created by Riley Calkins on 4/27/24.
//

import SwiftUI

enum GridType {
    case vertical
    case horizontal
    
    var imageName: String {
        switch self {
        case .vertical:
            return "arrow.up.arrow.down"
        case .horizontal:
            return "arrow.left.arrow.right"
        }
    }
    
    var title: String {
        switch self {
        case .vertical:
            return "Vertical"
        case .horizontal:
            return "Horizontal"
        }
    }
    
    var parameter: String {
        switch self {
        case .vertical:
            return "Width"
        case .horizontal:
            return "Height"
        }
    }
    
    mutating func toggle() {
        switch self {
        case .vertical:
            self = .horizontal
        case .horizontal:
            self = .vertical
        }
    }
}
