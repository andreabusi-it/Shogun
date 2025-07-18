//
//  CaseIterable+Extensions.swift
//  Shogun
//
//  Created by Andrea Busi on 18/07/25.
//

import Foundation


extension CaseIterable where Self: Equatable {
    
    /// Returns the next case in the enum.
    /// If the end is reached, wraps back to the first case.
    public func next() -> Self {
        let all = Self.allCases
        let idx = all.firstIndex(of: self)!
        let next = all.index(after: idx)
        let newValue = all[next == all.endIndex ? all.startIndex : next]
        return newValue
    }
    
    /// Advances to the next case in the enum.
    /// If the end is reached, wraps back to the first case.
    public mutating func advance() {
        self = next()
    }
}
