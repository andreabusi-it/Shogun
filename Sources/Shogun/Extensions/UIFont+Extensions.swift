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
        let desc = UIFontDescriptor.preferredFontDescriptor(withTextStyle: style)
        let font = UIFont.systemFont(ofSize: desc.pointSize, weight: weight)
        return metrics.scaledFont(for: font)
    }
}
