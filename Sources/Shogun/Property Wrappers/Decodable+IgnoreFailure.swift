//
//  Decodable+IgnoreFailure.swift
//  
//
//  Created by Andrea Busi (www.andreabusi.it).
//

import Foundation


/// Allows to mark a decodable property and ignore elements inside an array that fails decoding.
///
/// Consider this JSON:
/// ```
/// {
/// "teams": [
///     { "team": "Ferrari", "color": "Red", "country": "Italy"  },
///     { "team": "McLaren", "color": "Papaya", "country": "England" }
///     { "team": "Alpine", "color": "Blue" }
/// ]
/// }
/// ```
/// Using this model, the convertion fails due to `country` property non optional:
/// ```
/// struct Teams: Decodable {
///     struct Team: Decodable {
///         let team: String
///         let color: String
///         let country: String
///     }
///     let teams: [Team]
///}
/// ```
/// Using `@IgnoreFailure`, the `teams` array will contains all the valid items,
/// skipping only the ones that are not decodable (in the example, only Alpine will be skipped).
///
@propertyWrapper
public struct IgnoreFailure<Value: Decodable>: Decodable {
    private struct _None: Decodable {}
    
    public var wrappedValue: [Value] = []
    
    // MARK: - Init
    
    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        while !container.isAtEnd {
            do {
                let decoded = try container.decode(Value.self)
                wrappedValue.append(decoded)
            } catch let error {
                print("[Shogun] Item skipped, error: \(error)")
                // item is silently ignored.
                _ = try? container.decode(_None.self)
            }
        }
    }
}
