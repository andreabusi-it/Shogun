//
//  Int+Extensions.swift
//  
//
//  Created by Andrea Busi (www.andreabusi.it).
//

import Foundation


extension Int {
    
    // MARK: - Public

    /// Converts current value to a boolean one.
    /// - Returns: `true` if current value is zero, `false` otherwise.
    public var boolValue: Bool {
        self != 0
    }
    
    /// Returns roman number rapresentation of the current value.
    ///
    /// Credits: https://stackoverflow.com/a/63357512
    /// - Returns: Roman number rapresentation.
    public func romanNumber() -> String {
        let conversionTable: [(intNumber: Int, romanNumber: String)] =
        [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"),
         (90, "XC"), (50, "L"), (40, "XL"), (10, "X"),
         (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
        
        var roman = ""
        var remainder = 0
        for entry in conversionTable {
            let quotient = (self - remainder) / entry.intNumber
            remainder += quotient * entry.intNumber
            roman += String(repeating: entry.romanNumber, count: quotient)
        }
        return roman
    }
}
