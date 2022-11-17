//
//  String+Extensions.swift
//  
//
//  Created by Andrea Busi (www.andreabusi.it).
//

import UIKit


extension String {
    
    // MARK: - Public
    
    /// Returns the string converted to an integer (if not possible, returns 0).
    public var intValue: Int {
        Int(self) ?? 0
    }
    
    /// Returns a new string made by capitilize the first character of the receiver.
    /// In comparison by `capitalized()`, this method capitalize only the first char (and not the first char of every words).
    public var firstCharacterCapitalized: String {
        if self.count < 1 {
            return ""
        } else if self.count == 1 {
            return self.capitalized
        }
        let firstChar = self.prefix(1).uppercased()
        let otherChars = self.suffix(self.count - 1).lowercased()
        return "\(firstChar)\(otherChars)"
    }
    
    /// Returns a new string made by removing from both ends of the receiver whitespace characters.
    public var trimmed: String {
        trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /// Remove all the whitespace and newline characters from the receiver.
    public var whitespacesRemoved: String {
        let words = self.components(separatedBy: .whitespacesAndNewlines)
        return words.joined(separator: "")
    }
    
    /// Returns a localized string, using the main bundle.
    public var localized: String {
        NSLocalizedString(self, comment: "")
    }
    
    /// Returns a Boolean value indicating whether the sequence contains the given element.
    /// The search is case insensitive.
    /// - Parameters:
    ///    - other: The element to find in the sequence.
    /// - Returns: true if the element was found in the sequence; otherwise, false.
    public func containsCaseInsensitive(
        _ other: String
    ) -> Bool {
        range(of: other, options: .caseInsensitive) != nil
    }
}


extension Optional where Wrapped == String {
    
    /// Check if current string is nil or has an empty value.
    public var isNilOrEmpty: Bool {
        switch self {
        case .none: return true
        case .some(let wrapped): return wrapped.isEmpty
        }
    }
}

