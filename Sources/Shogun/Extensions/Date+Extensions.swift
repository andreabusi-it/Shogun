//
//  Date+Extensions.swift
//  
//
//  Created by Andrea Busi (www.andreabusi.it).
//

import Foundation


extension Date {
    
    // MARK: - Class methods
    
    /// Get the date for the first day of the given month/year.
    ///
    /// - Parameters:
    ///   - month:  Month (for instance, 02).
    ///   - year:   Year (for instance, 2022).
    /// - Returns:  Date object for the first day of the given parameters (for instace, 01/02/2022).
    public static func firstDay(
        for month: Int,
        year: Int
    ) -> Date? {
        let calendar = Calendar.current
        var components = calendar.dateComponents([.year, .month, .day], from: Date())
        components.day = 1
        components.month = month
        components.year = year
        return calendar.date(from: components)
    }
    
    /// Get the date for the last day of the given month/year.
    ///
    /// - Parameters:
    ///   - month:  Month (for instance, 03).
    ///   - year:   Year (for instance, 2022).
    /// - Returns:  Date object for the first day of the given parameters (for instace, 31/03/2022).
    public static func lastDay(
        for month: Int,
        year: Int
    ) -> Date? {
        let calendar = Calendar.current
        var components = calendar.dateComponents([.year, .month, .day], from: Date())
        components.day = 0
        components.month = month + 1
        components.year = year
        return calendar.date(from: components)
    }
    
    // MARK: - Public
    
    /// Check if current date is today.
    /// - Returns: `true` if current date is today, `false` otherwise.
    public var isToday: Bool {
        let calendar = Calendar.current
        let componentsCurrentDate = calendar.dateComponents([.year, .month, .day], from: Date())
        let componentsDate = calendar.dateComponents([.year, .month, .day], from: self)
        
        return  componentsCurrentDate.year == componentsDate.year &&
                componentsCurrentDate.month == componentsDate.month &&
                componentsCurrentDate.day == componentsDate.day
    }
    
    /// Year component of the current date.
    public var year: Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year], from: self)
        return components.year ?? 0
    }
    
    /// Month component of the current date.
    public var month: Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.month], from: self)
        return components.month ?? 0
    }
    
    /// Day component of the current date.
    public var day: Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: self)
        return components.day ?? 0
    }
    
    /// Hour component of the current date.
    public var hour: Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour], from: self)
        return components.hour ?? 0
    }
    
    /// Minute component of the current date.
    public var minute: Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.minute], from: self)
        return components.minute ?? 0
    }
    
    /// Second component of the current date.
    public var second: Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.second], from: self)
        return components.second ?? 0
    }
    
    /// Set value for given component for the current date.
    public func setValue(
        _ value: Int?,
        for component: Calendar.Component
    ) -> Date? {
        let calendar = Calendar.current
        var components = calendar.dateComponents(
            [.calendar, .timeZone,
             .era, .quarter,
             .year, .month, .day,
             .hour, .minute, .second, .nanosecond,
             .weekday, .weekdayOrdinal,
             .weekOfMonth, .weekOfYear, .yearForWeekOfYear],
            from: self)
        components.setValue(value, for: component)
        return components.date
    }
    
    /// Returns current date including only `year`, `month` and `day` components.
    public func dateOnly() -> Date {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: self)
        let date = Calendar.current.date(from: components)
        return date!
    }
}
