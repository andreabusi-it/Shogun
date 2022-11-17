//
//  UIFont+Extensions.swift
//  
//
//  Created by Andrea Busi (www.andreabusi.it).
//

import UIKit


extension UIFont {
    
    /// Returns an instance of the system font for the specified text style and the given weight.
    /// - Parameters:
    ///    - style: The text style for which to return a font.
    ///    - weight: The weight of the font, specified as a font weight constant.
    /// - Returns: A font object of the specified style and weight.
    public static func preferredFont(
        forTextStyle style: TextStyle,
        weight: Weight
    ) -> UIFont {
        let metrics = UIFontMetrics(forTextStyle: style)
        let descriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: style)
        let font = UIFont.systemFont(ofSize: descriptor.pointSize, weight: weight)
        return metrics.scaledFont(for: font)
    }
    
    /// Returns a new font in the same family with the given symbolic traits,
    /// or `nil` if none found in the system.
    /// - Parameters:
    ///    - traits: The new symbolic traits.
    /// - Returns: Same family font with given traits.
    public func withSymbolicTraits(
        _ traits: UIFontDescriptor.SymbolicTraits
    ) -> UIFont? {
        guard let descriptor = fontDescriptor.withSymbolicTraits(traits) else {
            return nil
        }
        return UIFont(descriptor: descriptor, size: pointSize)
    }
}
