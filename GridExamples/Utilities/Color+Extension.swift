//
//  Color+Extension.swift
//  GridExamples
//
//  Created by Riley Calkins on 4/26/24.
//

import Foundation
import SwiftUI

extension Color  {
    static var random: Color {
        return Color(red: Double.random(in: 0...1),
                     green: Double.random(in: 0...1),
                     blue: Double.random(in: 0...1))
    }
}
