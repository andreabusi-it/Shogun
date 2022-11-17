//
//  Float+Extensions.swift
//  
//
//  Created by Andrea Busi (www.andreabusi.it).
//

import Foundation


extension Float {
    
    // MARK: - Public
    
    /// Round the value to the neares number provided.
    ///
    /// Example:
    /// ```
    /// let valueA = 4.8
    /// print(valueA.round(nearest: 0.5))
    /// // Prints: 5.0
    ///
    /// let valueB = 4.61
    /// print(value.round(nearest: 0.1))
    /// // Prints: 4.6
    ///
    /// let valueC = 3.14
    /// print(value.round(nearest: 1.1))
    /// // Prints: 3.14
    /// ```
    ///
    /// - Parameters:
    ///    - nearest: Nearest value on which round the current value (valid values from 0 to 1).
    /// - Returns: Rounded value.
    public func round(
        nearest: Float
    ) -> Float {
        guard nearest >= 0 && nearest <= 1 else {
            return self
        }
        
        let n = 1/nearest
        let numberToRound = self * n
        return numberToRound.rounded() / n
    }
    
    /// Rounds the fraction down to the nearest provided value.
    ///
    /// Example:
    /// ```
    /// let valueA = 4.8
    /// print(valueA.floor(nearest: 0.5))
    /// // Prints: 4.5
    ///
    /// let valueB = 4.61
    /// print(value.round(nearest: 0.1))
    /// // Prints: 4.6
    ///
    /// let valueC = 3.14
    /// print(value.round(nearest: 1.1))
    /// // Prints: 3.14
    /// ```
    ///
    /// - Parameters:
    ///    - nearest: Nearest value on which round the current value.
    /// - Returns: Value rounded down.
    public func floor(
        nearest: Float
    ) -> Float {
        guard nearest >= 0 && nearest <= 1 else {
            return self
        }
        
        let intDiv = Float(Int(self / nearest))
        return intDiv * nearest
    }
}
