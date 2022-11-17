//
//  Data+Extensions.swift
//  Shogun
//
//  Created by Andrea Busi (www.andreabusi.it).
//

import Foundation


extension Data {
    
    // MARK: - Public

    /// Appends the specified string to the end of curent data.
    /// Default encoding is UTF8.
    /// - Parameter string: String to append to the current data.
    public mutating func append(
        _ string: String,
        encoding: String.Encoding = .utf8
    ) {
        if let stringData = string.data(using: encoding) {
            self.append(stringData)
        }
    }
    
    /// Returns a String initialized by converting current data into Unicode characters using a given encoding.
    /// If the convertion fails, an empty string is returned.
    public var utf8String: String {
        String(data: self, encoding: .utf8) ?? ""
    }
}
