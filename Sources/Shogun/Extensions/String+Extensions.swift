//
//  String+Extensions.swift
//  
//
//  Created by Andrea Busi (www.andreabusi.it).
//

import UIKit
import CryptoKit


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
    
    /// Add a separator in the current string every N characters.
    /// - Returns: Formatted string adding a separator.
    public func separated(every stride: Int, with separator: Character) -> String {
        return String(enumerated().map { $0 > 0 && $0 % stride == 0 ? [separator, $1] : [$1]}.joined())
    }
    
    /// Returns SHA256 hash of the current string.
    /// - Returns: SHA256 hash, nil if data convertion fails
    @available(iOS 13.0, macOS 10.15, watchOS 6.0, tvOS 13.0, *)
    public func sha256() -> String? {
        guard let data = data(using: .utf8) else {
            return nil
        }
        let hashed = SHA256.hash(data: data)
        return hashed.compactMap { String(format: "%02x", $0) }.joined()
    }
    
    /// Returns MD5 hash of the current string.
    /// Please note that MD5 is considered an insecure algorithm.
    /// - Returns: MD5 hash, nil if data convertion fails.
    @available(iOS 13.0, macOS 10.15, watchOS 6.0, tvOS 13.0, *)
    public func md5() -> String? {
        guard let data = data(using: .utf8) else {
            return nil
        }
        
        let hashed = Insecure.MD5.hash(data: data)
        return hashed.map { String(format: "%02hhx", $0) }.joined()
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

