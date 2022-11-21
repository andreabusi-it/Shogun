//
//  Bundle+Extensions.swift
//  
//
//  Created by Andrea Busi (www.andreabusi.it).
//

import Foundation


extension Bundle {
    
    /// Gets the `CFBundleShortVersionString`from the `Info.plist` file inside the current bundle.
    /// In a main app bundle, this value usualy contains the app version.
    /// - Returns: Short version if found, empty string otherwise.
    public var shortVersion: String {
        guard let info = Bundle.main.infoDictionary, let version = info["CFBundleShortVersionString"] as? String else {
            return ""
        }
        return version
    }
    
    /// Gets the `CFBundleVersion`from the `Info.plist` file inside the current bundle.
    /// In a main app bundle, this value usualy contains the build version.
    /// - Returns: Build version if found, empty string otherwise.
    public var buildVersion: String {
        guard let info = Bundle.main.infoDictionary, let build = info["CFBundleVersion"] as? String else {
            return ""
        }
        return build
    }
    
    /// Returns a formatted version of the complete app version,
    /// merging `shortVersion` and `buildVersion` properties.
    ///
    /// Example: 2.0 (10)
    /// - Returns: Complete version of the current bundle
    public var appVersion: String {
        let version = shortVersion
        let build = buildVersion
        if build.isEmpty {
            return version
        }
        return "\(version) (\(build))"
    }
    
    /// Returns the 'Display Name' of the current bundle (CFBundleDisplayName)
    ///
    /// Gets the `CFBundleDisplayName`from the `Info.plist` file inside the current bundle.
    /// In a main app bundle, this value usualy contains the app display name.
    /// - Returns: App display name if found, empty string otherwise.
    public var displayName: String {
        guard let info = Bundle.main.infoDictionary, let displayName = info["CFBundleDisplayName"] as? String else {
            return ""
        }
        return displayName
    }
}
