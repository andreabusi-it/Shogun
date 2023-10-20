//
//  KeyedDecodingContainer+Extensions.swift
//  
//
//  Created by Andrea Busi (www.andreabusi.it).
//

import Foundation
import CoreLocation


extension KeyedDecodingContainer {
    
    // MARK: - Public
    
    /// Decodes a string value to an Int for the given key.
    /// - Parameter key: The key that the decoded value is associated with.
    /// - Throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    /// - Throws: `DecodingError.keyNotFound` if `self` does not have an entry
    ///   for the given key.
    /// - Throws: `DecodingError.valueNotFound` if `self` has a null entry for
    ///   the given key.
    /// - Returns: An Int value, if present for the given key and convertible to Int.
    public func decodeInt(
        forKey key: Key
    ) throws -> Int  {
        // try first if is already an Int
        if let value = try? self.decode(Int.self, forKey: key) {
            return value
        }
        // try with a string value
        let stringValue = try self.decode(String.self, forKey: key)
        guard let value = Int(stringValue) else {
            let context = DecodingError.Context(codingPath: self.codingPath, debugDescription: "Impossible to decode Int for \(key.stringValue) key")
            throw DecodingError.typeMismatch(Int.self, context)
        }
        return value
    }
    
    /// Decodes a string value to an UInt for the given key.
    /// - Parameter key: The key that the decoded value is associated with.
    /// - Throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    /// - Throws: `DecodingError.keyNotFound` if `self` does not have an entry
    ///   for the given key.
    /// - Throws: `DecodingError.valueNotFound` if `self` has a null entry for
    ///   the given key.
    /// - Returns: An UInt value, if present for the given key and convertible to UInt.
    public func decodeUInt(
        forKey key: Key
    ) throws -> UInt  {
        // try first if is already an Int
        if let value = try? self.decode(UInt.self, forKey: key) {
            return value
        }
        // try with a string value
        let stringValue = try self.decode(String.self, forKey: key)
        guard let value = UInt(stringValue) else {
            let context = DecodingError.Context(codingPath: self.codingPath, debugDescription: "Impossible to decode UInt for \(key.stringValue) key")
            throw DecodingError.typeMismatch(UInt.self, context)
        }
        return value
    }
    
    /// Decodes a string value to a Float for the given key.
    /// - Parameter key: The key that the decoded value is associated with.
    /// - Throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    /// - Throws: `DecodingError.keyNotFound` if `self` does not have an entry
    ///   for the given key.
    /// - Throws: `DecodingError.valueNotFound` if `self` has a null entry for
    ///   the given key.
    /// - Returns: A Float value, if present for the given key and convertible to Float.
    public func decodeFloat(
       forKey key: Key
    ) throws -> Float  {
       // try first if is already a Float
       if let value = try? self.decode(Float.self, forKey: key) {
          return value
       }
       // try with a string value
       let stringValue = try self.decode(String.self, forKey: key)
       guard let value = Float(stringValue) else {
          let context = DecodingError.Context(codingPath: self.codingPath, debugDescription: "Impossible to decode Float for \(key.stringValue) key")
          throw DecodingError.typeMismatch(Int.self, context)
       }
       return value
    }
    
    /// Decodes a string value to a Double for the given key.
    /// - Parameter key: The key that the decoded value is associated with.
    /// - Throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    /// - Throws: `DecodingError.keyNotFound` if `self` does not have an entry
    ///   for the given key.
    /// - Throws: `DecodingError.valueNotFound` if `self` has a null entry for
    ///   the given key.
    /// - Returns: A Double value, if present for the given key and convertible to Double.
    public func decodeDouble(
       forKey key: Key
    ) throws -> Double  {
       // try first if is already a Double
       if let value = try? self.decode(Double.self, forKey: key) {
          return value
       }
       // try with a string value
       let stringValue = try self.decode(String.self, forKey: key)
       guard let value = Double(stringValue) else {
          let context = DecodingError.Context(codingPath: self.codingPath, debugDescription: "Impossible to decode Double for \(key.stringValue) key")
          throw DecodingError.typeMismatch(Int.self, context)
       }
       return value
    }
    
    /// Decodes a string value to a Bool for the given key.
    /// - Parameter key: The key that the decoded value is associated with.
    /// - Throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    /// - Throws: `DecodingError.keyNotFound` if `self` does not have an entry
    ///   for the given key.
    /// - Throws: `DecodingError.valueNotFound` if `self` has a null entry for
    ///   the given key.
    /// - Returns: A Bool value, if present for the given key and convertible to Bool.
    public func decodeBool(
        forKey key: Key
    ) throws -> Bool  {
        // try first if is already a Bool
        if let value = try? self.decode(Bool.self, forKey: key) {
            return value
        }
        // try with an int value
        if let intValue = try? self.decode(Int.self, forKey: key) {
            return intValue.boolValue
        }
        // try with a string value
        if let stringValue = try? self.decode(String.self, forKey: key) {
            // check for "true" or "false" values
            if let value = Bool(stringValue) {
                return value
            }
            // check for "0" or "1" values
            if let intValue = Int(stringValue) {
                return intValue.boolValue
            }
        }
        
        let context = DecodingError.Context(codingPath: self.codingPath, debugDescription: "Impossible to decode Bool for \(key.stringValue) key")
        throw DecodingError.typeMismatch(Bool.self, context)
    }
    
    /// Decodes an enum value with String as associated type, for the given key.
    /// - Parameter key: The key that the decoded value is associated with.
    /// - Throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    /// - Throws: `DecodingError.keyNotFound` if `self` does not have an entry
    ///   for the given key.
    /// - Throws: `DecodingError.valueNotFound` if `self` has a null entry for
    ///   the given key.
    /// - Returns: An Int value, if present for the given key and convertible to Int.
    public func decodeEnum<T: RawRepresentable>(
        forKey key: Key
    ) throws -> T where T.RawValue == String  {
        let rawValue = try self.decode(T.RawValue.self, forKey: key)
        guard let value = T(rawValue: rawValue) else {
            let context = DecodingError.Context(codingPath: self.codingPath, debugDescription: "Impossible to decode Enum for \(key.stringValue) key")
            throw DecodingError.typeMismatch(Int.self, context)
        }
        return value
    }
    
    /// Decodes an enum value with String as associated type, for the given key.
    /// - Parameter key: The key that the decoded value is associated with.
    /// - Throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    /// - Throws: `DecodingError.keyNotFound` if `self` does not have an entry
    ///   for the given key.
    /// - Throws: `DecodingError.valueNotFound` if `self` has a null entry for
    ///   the given key.
    /// - Returns: An Int value, if present for the given key and convertible to Int.
    public func decodeEnum<T: RawRepresentable>(
        forKey key: Key
    ) throws -> T where T.RawValue == Int  {
        let stringValue = try self.decodeInt(forKey: key)
        guard let value = T(rawValue: stringValue) else {
            let context = DecodingError.Context(codingPath: self.codingPath, debugDescription: "Impossible to decode Enum for \(key.stringValue) key")
            throw DecodingError.typeMismatch(Int.self, context)
        }
        return value
    }
    
    /// Decodes two string values to a CLLocationCoordinate2D for the given keys.
    /// - Parameter latitudeKey: The key that the latituide value is associated with.
    /// - Parameter longitudeKey: The key that the longitude value is associated with.
    /// - Throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    /// - Throws: `DecodingError.keyNotFound` if `self` does not have an entry
    ///   for the given key.
    /// - Throws: `DecodingError.valueNotFound` if `self` has a null entry for
    ///   the given key.
    /// - Returns: A CLLocationCoordinate2D value, if both the given keys are available and convertible.
    public func decodeCoordinate2D(
       latitudeKey: Key,
       longitudeKey: Key
    ) throws -> CLLocationCoordinate2D  {
       // try to extract Double values
       let latitude = try self.decodeDouble(forKey: latitudeKey)
       let longitude = try self.decodeDouble(forKey: longitudeKey)
       return .init(latitude: latitude, longitude: longitude)
    }
    
    /// Decodes a string value to an Int for the given key, if present
    /// - Parameter key: The key that the decoded value is associated with.
    /// - Throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    /// - Throws: `DecodingError.keyNotFound` if `self` does not have an entry
    ///   for the given key.
    /// - Throws: `DecodingError.valueNotFound` if `self` has a null entry for
    ///   the given key.
    /// - Returns: A decoded Int value, or nil if the Decoder does not have an entry associated with the given key, or if the value is a null value.
    public func decodeIntIfPresent(
        forKey key: Key
    ) throws -> Int?  {
        guard let stringValue = try self.decodeIfPresent(String.self, forKey: key) else {
            return nil
        }
        guard let value = Int(stringValue) else {
            let context = DecodingError.Context(codingPath: self.codingPath, debugDescription: "Impossible to decode Int for \(key.stringValue) key")
            throw DecodingError.typeMismatch(Int.self, context)
        }
        return value
    }
    
    /// Decodes a string value to an UInt for the given key, if present
    /// - Parameter key: The key that the decoded value is associated with.
    /// - Throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to the requested type.
    /// - Throws: `DecodingError.keyNotFound` if `self` does not have an entry
    ///   for the given key.
    /// - Throws: `DecodingError.valueNotFound` if `self` has a null entry for
    ///   the given key.
    /// - Returns: A decoded UInt value, or nil if the Decoder does not have an entry associated with the given key, or if the value is a null value.
    public func decodeUIntIfPresent(
        forKey key: Key
    ) throws -> UInt?  {
        guard let stringValue = try self.decodeIfPresent(String.self, forKey: key) else {
            return nil
        }
        guard let value = UInt(stringValue) else {
            let context = DecodingError.Context(codingPath: self.codingPath, debugDescription: "Impossible to decode UInt for \(key.stringValue) key")
            throw DecodingError.typeMismatch(UInt.self, context)
        }
        return value
    }
}
