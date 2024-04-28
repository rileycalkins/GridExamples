//
//  GridVM.swift
//  GridExamples
//
//  Created by Riley Calkins on 4/27/24.
//

import SwiftUI
import Observation

@Observable
class GridVM {
    var verticalAlignmentType: VerticalAlignmentType = .verticalCenter
    var horiztonalAlignmentType: HorizontalAlignmentType = .horizontalCenter
    var gridType: GridType = .vertical
    
    var arrayCount = ClampedValue(value: 100, range: 0...250)
    var frameValue = ClampedValue(value: 100, range: 0...250)
    var spacing = ClampedValue(value: 20, range: 0...250)
    var selectedItemType: GridItemType = .flex
    
    
    func colorCollection(count: Int) -> [Color] {
        (0..<count).map { _ in Color.random }
    }
    
    
    //MARK: MinimumEnabled
    private var _minimumEnabled: Bool = true
    var minimumEnabled: Bool {
        get {
            return _minimumEnabled
        }
        set {
            _minimumEnabled = newValue
        }
    }
    
    private var _minimum: CGFloat = 100
    var minimum: CGFloat {
        get {
            if minimumEnabled {
                return _minimum
            } else {
                return 0
            }
        }
        set {
            if newValue <= _maximum {
                _minimum = min(max(newValue, 0), 250)
            } else {
                _minimum = min(max(newValue, 0), 250)
                _maximum = min(max(newValue, 0), 250)
            }
            
        }
    }
    
    //MARK: Maximum Value
    private var _maximumEnabled: Bool = true
    var maximumEnabled: Bool {
        get {
            return _maximumEnabled
        }
        set {
            _maximumEnabled = newValue
        }
    }
    private var _maximum: CGFloat = 100
    var maximum: CGFloat {
        get {
            if maximumEnabled {
                return _maximum
            } else {
                return 0
            }
            
        }
        set {
            if newValue >= _minimum {
                _maximum = min(max(newValue, 0), 250)
            } else {
                _maximum = min(max(newValue, 0), 250)
                _minimum = min(max(newValue, 0), 250)
            }
        }
    }
    //MARK: Fixed Value
    private var _fixedEnabled: Bool = true
    var fixedEnabled: Bool {
        get {
            return _fixedEnabled
        }
        set {
            _fixedEnabled = newValue
        }
    }
    private var _fixed: CGFloat = 100
    var fixed: CGFloat {
        get {
            if fixedEnabled {
                return _fixed
            } else {
                return 0
            }
            
        }
        set {
            _fixed = min(max(newValue, 0), 250)
        }
    }
    
    private var _countEnabled: Bool = true
    var countEnabled: Bool {
        get {
            return _countEnabled
        }
        set {
            _countEnabled = newValue
        }
    }
    
    private var _count: Int = 5
    var count: Int {
        get {
            return _count
        }
        set {
            _count = min(max(newValue, 0), 250)
        }
    }
    var countCGFloat: CGFloat {
        get {
            return CGFloat(integerLiteral: _count)
        }
        set {
            let countFloat = min(max(newValue, 0), 250)
            _count = countFloat.toInt
        }
    }
    
    
    
    func vGridArray(_ minimum: CGFloat = 0, _ maximum: CGFloat = 0, _ fixed: CGFloat = 0, _ count: Int = 0) -> [GridItem] {
        switch selectedItemType {
        case .flex:
            if minimum > 0 && maximum > 0 && count > 0 {
                return Array(repeating: GridItem(.flexible(minimum: minimum, maximum: maximum)), count: count)
            } else if minimum > 0 && count > 0{
                return Array(repeating: GridItem(.flexible(minimum: minimum)), count: count)
            } else if maximum > 0 && count > 0 {
                return Array(repeating: GridItem(.flexible(maximum: maximum)), count: count)
            } else {
                return Array(repeating: GridItem(.flexible()), count: count)
                
            }
            
        case .adaptive:
            if minimum > 0  {
                return [GridItem(.adaptive(minimum: minimum, maximum: maximum))]
            } else {
                return [GridItem(.adaptive(minimum: minimum))]
            }
        case .fixed:
            return Array(repeating: GridItem(.fixed(fixed)), count: count)
        }
    }
    
    func hGridArray(_ minimum: CGFloat = 0, _ maximum: CGFloat = 0, _ fixed: CGFloat = 0, _ count: Int = 0) -> [GridItem] {
        switch selectedItemType {
        case .flex:
            if minimum > 0 && maximum > 0 && count > 0 {
                return Array(repeating: GridItem(.flexible(minimum: minimum, maximum: maximum)), count: count)
            } else if minimum > 0 && count > 0{
                return Array(repeating: GridItem(.flexible(minimum: minimum)), count: count)
            } else if maximum > 0 && count > 0 {
                return Array(repeating: GridItem(.flexible(maximum: maximum)), count: count)
            } else {
                return Array(repeating: GridItem(.flexible()), count: count)
                
            }
        case .adaptive:
            if minimum > 0  {
                return [GridItem(.adaptive(minimum: minimum, maximum: maximum))]
            } else {
                return [GridItem(.adaptive(minimum: minimum))]
            }
        case .fixed:
            return Array(repeating: GridItem(.fixed(fixed)), count: count)
        }
    }
}


struct ClampedValue<T: Comparable> {
    var value: T
    var range: ClosedRange<T>

    init(value: T, range: ClosedRange<T>) {
        self.value = value
        self.range = range
    }
}
