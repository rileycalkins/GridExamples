//
//  GridItemType.swift
//  GridExamples
//
//  Created by Riley Calkins on 4/27/24.
//

import SwiftUI

enum GridItemType: Int {
    case flex = 1
    case adaptive = 2
    case fixed = 3
    
    var title: String {
        switch self {
        case .flex:
            return "Flex"
        case .adaptive:
            return "Adaptive"
        case .fixed:
            return "Fixed"
        }
    }
}
