//
//  GridParameterType.swift
//  GridExamples
//
//  Created by Riley Calkins on 4/27/24.
//

import SwiftUI

enum GridParameterType {
    case min
    case max
    case fixed
    case count
    
    var label: String {
        switch self {
        case .min:
            return "Min"
        case .max:
            return "Max"
        case .fixed:
            return "Fixed"
        case .count:
            return "Count"
        }
    }
}
