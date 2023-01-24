//
//  UIDevice+Extensions.swift
//  
//
//  Created by Andrea Busi (www.andreabusi.it).
//

#if canImport(UIKit)
import UIKit


extension UIDevice {
    
    /// Returns the device code of the current device.
    ///
    /// This code is usually different from the commercial name.
    /// Here are some examples:
    /// ```
    /// iPhone14,5 -> iPhone 13
    /// Watch6,18 -> Apple Watch Ultra (1st gen)
    /// iPad14,2 -> iPad Mini (6th gen)
    /// ```
    ///
    /// - Returns: Device code of the current device
    public func deviceCode() -> String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        return machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
    }
}

#endif
