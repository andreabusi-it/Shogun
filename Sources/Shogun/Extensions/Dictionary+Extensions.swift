//
//  Dictionary+Extensions.swift
//  
//
//  Created by Andrea Busi (www.andreabusi.it).
//

import Foundation


extension Dictionary {
    
    // MARK: - Public
    
    /// Returns the integer value associated with a given key, if any.
    /// This method try to parse the value as integer type.
    /// - Returns: The integer value associated with `key`, or nil if no value is associated with `key`.
    public func integer(
        forKey key: Key
    ) -> Int? {
        if let value = self[key] as? Int {
            return value
        } else if let value = self[key] as? NSNumber {
            return value.intValue
        } else if let stringValue = self[key] as? String, let value = Int(stringValue) {
            return value
        }
        return nil
    }
    
    /// Returns the integer value associated with a given key,
    /// or the provided default value if a value cannot be found.
    /// - Returns: The integer value associated with `key`, or the `defaultValue`.
    public func integer(
        forKey key: Key,
        orDefault defaultValue: Int = 0
    ) -> Int {
        integer(forKey: key) ?? 0
    }
    
    /// Returns the float value associated with a given key, if any.
    /// This method try to parse the value as float type.
    /// - Returns: The integer value associated with `key`, or nil if no value is associated with `key`.
    public func float(
        forKey key: Key
    ) -> Float? {
        if let value = self[key] as? Float {
            return value
        } else if let value = self[key] as? NSNumber {
            return value.floatValue
        } else if let stringValue = self[key] as? String, let value = Float(stringValue) {
            return value
        }
        return nil
    }
    
    /// Returns the float value associated with a given key,
    /// or the provided default value if a value cannot be found.
    /// - Returns: The float value associated with `key`, or the `defaultValue`.
    public func float(
        forKey key: Key,
        orDefault defaultValue: Float = 0.0
    ) -> Float {
        float(forKey: key) ?? defaultValue
    }
    
    /// Returns the double value associated with a given key, if any.
    /// This method try to parse the value as double type.
    /// - Returns: The integer value associated with `key`, or nil if no value is associated with `key`.
    public func double(
        forKey key: Key
    ) -> Double? {
        if let value = self[key] as? Double {
            return value
        } else if let value = self[key] as? NSNumber {
            return value.doubleValue
        } else if let stringValue = self[key] as? String, let value = Double(stringValue) {
            return value
        }
        return nil
    }
    
    /// Returns the double value associated with a given key,
    /// or the provided default value if a value cannot be found.
    /// - Returns: The float value associated with `key`, or the `defaultValue`.
    public func double(
        forKey key: Key,
        orDefault defaultValue: Double = 0.0
    ) -> Double {
        double(forKey: key) ?? defaultValue
    }
    
    /// Returns the bool value associated with a given key, if any.
    /// This method try to parse the value as bool type.
    /// - Returns: The integer value associated with `key`, or nil if no value is associated with `key`.
    public func bool(
        forKey key: Key
    ) -> Bool? {
        if let value = self[key] as? Bool {
            return value
        } else if let value = self[key] as? NSNumber {
            return value.boolValue
        } else if let stringValue = self[key] as? String, let value = Bool(stringValue) {
            return value
        }
        return nil
    }
    
    /// Returns the bool value associated with a given key,
    /// or the provided default value if a value cannot be found.
    /// - Returns: The float value associated with `key`, or the `defaultValue`.
    public func bool(
        forKey key: Key,
        orDefault defaultValue: Bool = false
    ) -> Bool? {
        bool(forKey: key) ?? defaultValue
    }
    
    /// Returns the string value associated with a given key, if any.
    /// This method try to parse the value as string type.
    /// - Returns: The integer value associated with `key`, or nil if no value is associated with `key`.
    public func string(
        forKey key: Key
    ) -> String? {
        if let value = self[key] as? String {
            return value
        }
        return nil
    }
    
    /// Returns the string value associated with a given key,
    /// or the provided default value if a value cannot be found.
    /// - Returns: The float value associated with `key`, or the `defaultValue`.
    public func string(
        forKey key: Key,
        orDefault defaultValue: String = ""
    ) -> String {
        string(forKey: key) ?? defaultValue
    }
    
    /// Returns a pretty printed JSON version of the current dictionary.
    /// String uses white space and indentation to make the resulting data more readable.
    /// - Returns: JSON pretty-printed for the current dictionary.
    public var prettyPrintedJson: String {
        do {
            let data = try JSONSerialization.data(withJSONObject: self, options: [.withoutEscapingSlashes, .prettyPrinted])
            return String(data: data, encoding: .utf8) ?? ""
        } catch {
            return ""
        }
    }
}
