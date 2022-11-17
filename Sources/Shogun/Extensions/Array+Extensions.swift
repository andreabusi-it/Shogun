//
//  Array+Extensions.swift
//  Shogun
//
//  Created by Andrea Busi (www.andreabusi.it).
//

import Foundation


extension Array {
    
    // MARK: - Public
    
    /// Create chunks from the current array of the given size.
    /// - Parameters:
    ///    - size: Size of the chunks
    /// - Returns: Chunks
    public func chunked(
        into size: Int
    ) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
