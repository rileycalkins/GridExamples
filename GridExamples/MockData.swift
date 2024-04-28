//
//  MockData.swift
//  GridExamples
//
//  Created by Riley Calkins on 4/26/24.
//

import Foundation
import SwiftUI

struct MockData {
    static var colors: [Color] {
        var array: [Color] = []
        for _ in 0..<100 { array.append(Color.random) }
        return array
    }
}
