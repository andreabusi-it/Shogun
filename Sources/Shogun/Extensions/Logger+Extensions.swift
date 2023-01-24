//
//  Logger+Extensions.swift
//  
//
//  Created by Andrea Busi on 24/01/23.
//

import Foundation
import OSLog


@available(iOS 14.0, macOS 11.0, *)
extension Logger {
    
    /// Default formatter used to create text representation of logs
    private static let iso8601Formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter
    }()
    
    /// Retrieve log entries saved in the current OSLogStore.
    /// - Parameters:
    ///   - subsystem: Payload subsystem to filter.
    ///   - lifespan: Max log date to look for.
    ///   - separator: Separator used to compose the final log text
    /// - Returns: Text with retrieved os logs
    @available(iOS 15.0, macOS 12.0, *)
    public func getLogEntries(
        subsystem: String,
        lifespan: Int = 1 * 60 * 60, // hour * min * sec
        timeFormatter: DateFormatter? = nil,
        separator: String = "\n"
    ) async throws -> String {
        let formatter = timeFormatter ?? Self.iso8601Formatter
        
        let logTask = Task.init(priority: .utility) { () -> String in
            let logs = try retrieveLogEntries(subsystem: subsystem, lifespan: lifespan)
            let text = logs
                .compactMap { "\(formatter.string(from: $0.date)) [\($0.level)] \($0.composedMessage)" }
                .joined(separator: separator)
            return text
        }
        return try await logTask.value
    }

    // MARK: - Private
    
    @available(iOS 15.0, macOS 12.0, *)
    private func retrieveLogEntries(
        subsystem: String,
        lifespan: Int
    ) throws -> [OSLogEntryLog] {
        // Open the log store.
        let logStore = try OSLogStore(scope: .currentProcessIdentifier)

        // Fetch log objects from the given time interval
        let intervalPosition = logStore.position(date: Date().addingTimeInterval(TimeInterval(-lifespan)))
        let allEntries = try logStore.getEntries(at: intervalPosition)

        // Filter the log to be relevant for our specific subsystem
        // and remove other elements (signposts, etc).
        return allEntries
            .compactMap { $0 as? OSLogEntryLog }
            .filter { $0.subsystem == subsystem }
    }
}
