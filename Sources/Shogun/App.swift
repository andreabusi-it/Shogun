//
//  App.swift
//  
//
//  Created by Andrea Busi (www.andreabusi.it).
//

import Foundation


final public class App {
    
    /// Defines if the current app is running inside Xcode Previews (SwiftUI canvas)
    public var isRunningInPreviews: Bool {
        ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    }
}
