//
//  View+Extensions.swift
//  Shogun
//
//  Created by Andrea Busi on 18/07/25.
//

import SwiftUI


@available(macOS 10.15, *)
extension View {
    
    /// Apply given transformation only if the condition is meet.
    @ViewBuilder
    public func `if`<Content: View>(
        _ condition: Bool,
        transform: (Self) -> Content
    ) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
    
    /// Allows to apply some transformations inside a given closure.
    ///
    /// This is useful, for instance, when a check on the target platform has to be done:
    /// ```
    /// .apply {
    ///     if #available(iOS 16.0, *) {
    ///         $0.scrollIndicators(.hidden)
    ///     } else {
    ///         $0
    ///     }
    /// }
    /// ```
    @ViewBuilder
    public func apply<Content: View>(
        @ViewBuilder _ transform: (Self) -> Content
    ) -> some View {
        transform(self)
    }
}
