//
//  UIColor+Extensions.swift
//  
//
//  Created by Andrea Busi (www.andreabusi.it).
//

#if canImport(UIKit)
import UIKit


extension UIColor {
    
    // MARK: - Inits
    
    /// The shorthand three-digit hexadecimal representation of color.
    /// RGB defines to the color #RGB.
    ///
    /// - Parameters:
    ///   - hex3:   Three-digit hexadecimal value.
    ///   - alpha:  0.0 - 1.0. The default is 1.0.
    /// - Returns: The color object.
    public convenience init(
        hex3: UInt16,
        alpha: CGFloat = 1
    ) {
        let divisor = CGFloat(15)
        let red     = CGFloat((hex3 & 0xF00) >> 8) / divisor
        let green   = CGFloat((hex3 & 0x0F0) >> 4) / divisor
        let blue    = CGFloat( hex3 & 0x00F      ) / divisor
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /// The shorthand four-digit hexadecimal representation of color with alpha.
    /// RGBA defines to the color #RGBA.
    ///
    /// - Parameters:
    ///    - hex4:   Four-digit hexadecimal value.
    /// - Returns: The color object.
    public convenience init(
        hex4: UInt16
    ) {
        let divisor = CGFloat(15)
        let red     = CGFloat((hex4 & 0xF000) >> 12) / divisor
        let green   = CGFloat((hex4 & 0x0F00) >>  8) / divisor
        let blue    = CGFloat((hex4 & 0x00F0) >>  4) / divisor
        let alpha   = CGFloat( hex4 & 0x000F       ) / divisor
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    ///  The six-digit hexadecimal representation of color of the form #RRGGBB.
    ///
    /// - Parameters:
    ///    - hex6: Six-digit hexadecimal value.
    ///    - alpha:  0.0 - 1.0. The default is 1.0.
    /// - Returns: The color object.
    public convenience init(
        hex6: UInt32,
        alpha: CGFloat = 1
    ) {
        let divisor = CGFloat(255)
        let red     = CGFloat((hex6 & 0xFF0000) >> 16) / divisor
        let green   = CGFloat((hex6 & 0x00FF00) >>  8) / divisor
        let blue    = CGFloat( hex6 & 0x0000FF       ) / divisor
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /// The six-digit hexadecimal representation of color with alpha of the form #RRGGBBAA.
    ///
    /// - Parameters:
    ///    - hex8: Eight-digit hexadecimal value.
    /// - Returns: The color object.
    public convenience init(
        hex8: UInt32
    ) {
        let divisor = CGFloat(255)
        let red     = CGFloat((hex8 & 0xFF000000) >> 24) / divisor
        let green   = CGFloat((hex8 & 0x00FF0000) >> 16) / divisor
        let blue    = CGFloat((hex8 & 0x0000FF00) >>  8) / divisor
        let alpha   = CGFloat( hex8 & 0x000000FF       ) / divisor
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /// Create a new color from the RGB/RGBA string representation.
    /// Supported formats are:
    /// - RGB (3 hex), like #A2C (equivalent to #AA22CC)
    /// - RGBA (4 hex), like #A2C3 (equivalent to #AA22CC33, where 33 is the alpha component)
    /// - RRGGBB (6 hex), like #A125C7
    /// - RRGGBBAA (8 hex), like #A125C776 (where 76 is the alpha component)
    ///
    /// - Parameters:
    ///    - rgba:  Hex representation of a color.
    /// - Returns: The color object.
    public convenience init?(
        hexString rgba: String
    ) {
        let hexString = rgba
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: "#", with: "")
        
        if hexString.isEmpty { return nil }
        
        var hexValue: UInt64 = 0
        guard Scanner(string: hexString).scanHexInt64(&hexValue) else {
            print("[Shogun] Scan of '\(rgba)' failed")
            return nil
        }
        
        switch (hexString.count) {
        case 3:
            self.init(hex3: UInt16(hexValue))
        case 4:
            self.init(hex4: UInt16(hexValue))
        case 6:
            self.init(hex6: UInt32(hexValue))
        case 8:
            self.init(hex8: UInt32(hexValue))
        default:
            print("[Shogun] Invalid RGB string from \(rgba), number of characters after '#' should be either 3, 4, 6 or 8")
            return nil
        }
    }
    
    /// Create a new color from the RGB/RGBA string representation.
    /// If the convertion fails, the default color is returned (UIColor.clear)
    ///
    /// - Parameters:
    ///   - rgba:           Hex representation of a color.
    ///   - defaultColor:   Default color to use in case of error
    /// - Returns: The color object.
    public convenience init(
        hexString rgba: String,
        defaultColor: UIColor = .clear
    ) {
        guard let color = UIColor(hexString: rgba) else {
            self.init(cgColor: defaultColor.cgColor)
            return
        }
        self.init(cgColor: color.cgColor)
    }
    
    // MARK: - Public
    
    /// Hex string of a UIColor instance.
    /// If the convertion fails, an empty string is returned.
    ///
    /// - Parameters:
    ///    - includeAlpha: Whether the alpha should be included.
    /// - Returns: Hex string for the current color (empty string if the convertion fails).
    public func hexString(
        includeAlpha: Bool = false
    ) -> String  {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        guard r >= 0 && r <= 1 && g >= 0 && g <= 1 && b >= 0 && b <= 1 else {
            return ""
        }
        
        if (includeAlpha) {
            return String(format: "#%02X%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255), Int(a * 255))
        }
        return String(format: "#%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255))
    }
    
    /// Get the RGB components of the current color.
    ///
    /// - Returns: Tuple with the components color
    public func rgb() -> (red:Int, green:Int, blue:Int, alpha:Int)? {
        var fRed:   CGFloat = 0
        var fGreen: CGFloat = 0
        var fBlue:  CGFloat = 0
        var fAlpha: CGFloat = 0
        if self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha) == false {
            // Could not extract RGBA components
            return nil
        }
        
        let iRed    = Int(fRed * 255.0)
        let iGreen  = Int(fGreen * 255.0)
        let iBlue   = Int(fBlue * 255.0)
        let iAlpha  = Int(fAlpha * 255.0)
        return (red:iRed, green:iGreen, blue:iBlue, alpha:iAlpha)
    }
    
    /// Returns a random color between the default ones.
    /// Black and grays colors are not used.
    /// - Returns: Random color
    public static func randomColor() -> UIColor {
        let colors: [UIColor] = [.red, .gray, .blue, .cyan, .yellow, .magenta, .orange, .purple, .brown]
        return colors.randomElement()!
    }
    
    /// Returns a random color between the system ones.
    /// Black and grays colors are not used.
    /// - Returns: Random system color.
    public static func randomSystemColor() -> UIColor {
        var colors: [UIColor] = [.systemRed, .systemGreen, .systemBlue, .systemOrange, .systemYellow, .systemPink, .systemPurple, .systemTeal]
        if #available(iOS 13.0, *) {
            colors += [ .systemIndigo, .systemBrown]
            if #available(iOS 15.0, *) {
                colors += [ .systemMint, .systemCyan]
            }
        }
        return colors.randomElement()!
    }
}

#endif
