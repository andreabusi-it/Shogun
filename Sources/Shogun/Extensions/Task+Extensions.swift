//
//  Task+Extensions.swift
//  
//
//  Created by Andrea Busi on 07/02/23.
//

import Foundation


@available(iOS 13, macOS 10.15, *)
extension Task where Success == Never, Failure == Never {
    
    /// Suspends the current task for at least the given duration in seconds.
    ///
    /// Credits: https://www.hackingwithswift.com/quick-start/concurrency/how-to-make-a-task-sleep
    public static func sleep(seconds: Double) async throws {
        let duration = UInt64(seconds * 1_000_000_000)
        try await Task.sleep(nanoseconds: duration)
    }
}
