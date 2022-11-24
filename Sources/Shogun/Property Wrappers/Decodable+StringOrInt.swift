//
//  Decodable+StringOrInt.swift
//  
//
//  Created by Andrea Busi (www.andreabusi.it).
//

import Foundation


/// Allows to mark a decodable property and gets values from a string or an int raw value
///
/// Sometimes you have to fight against a JSON like this:
/// ```
/// {
///     "value1": "a",
///     "value2"" "1",
///     "value3": 2
/// }
/// ```
/// With the standard Decodable behaviour, you cannot define `value2` as Int.
/// This property wrapper allows you to define a model like this:
/// ```
/// strucy MyModel {
///     let value1: String
///     @StringOrInt var value2: Int
///     let value3: Int
/// }
/// ```
///
///  Credits: [theswiftdeveloper.com](https://theswiftdeveloper.com/2022/04/10/customizing-codable-with-property-wrappers/)
///
@propertyWrapper
public struct StringOrInt {
    public let wrappedValue: Int
    
    public init(wrappedValue: Int) {
        self.wrappedValue = wrappedValue
    }
}


extension StringOrInt: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let stringValue = try? container.decode(String.self) {
            self.wrappedValue = Int(stringValue) ?? 0
        } else {
            self.wrappedValue = try container.decode(Int.self)
        }
    }
}
