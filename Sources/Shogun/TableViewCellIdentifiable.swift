//
//  TableViewCellIdentifiable.swift
//
//
//  Created by Andrea Busi on 06/06/24.
//

#if canImport(UIKit)
import UIKit

/// This protocol defines a static `reuseIdentifier` property, that will be used to manage
/// reuse identifier when interacting with a table view
public protocol TableViewCellIdentifiable where Self: UITableViewCell {
    /// Reuse identifier for the cell.
    static var reuseIdentifier: String { get }
}

public protocol TableViewHeaderFooterIdentifiable where Self: UITableViewHeaderFooterView {
    /// Reuse identifier for the cell.
    static var reuseIdentifier: String { get }
}

/// Defines some convenience methods using `TableViewCellIdentifiable` protocol
extension UITableView {
    
    /// Registers a class that conforms to `TableViewCellIdentifiable`, to use in creating new table cells.
    public func registerCell(for cellIdentifiable: TableViewCellIdentifiable.Type) {
        register(cellIdentifiable.self, forCellReuseIdentifier: cellIdentifiable.reuseIdentifier)
    }
    
    /// Registers a class that conforms to `TableViewCellIdentifiable`, to use in creating new header or footer views.
    public func registerHeaderFooterView(for cellIdentifiable: TableViewHeaderFooterIdentifiable.Type) {
        register(cellIdentifiable.self, forHeaderFooterViewReuseIdentifier: cellIdentifiable.reuseIdentifier)
    }
    
    /// Returns a reusable table-view cell object for the specified reuse identifier and adds it to the table.
    public func dequeueReusableCell<T: TableViewCellIdentifiable>(cellIdentifiable: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to dequeue a cell for reuseIdentifier '\(T.self)'. Make sure to call `registerCell(for:)` during table initialization")
        }
        return cell
    }
    
    /// Returns a reusable header or footer view after locating it by its identifier.
    public func dequeueHeaderFooterView<T: TableViewHeaderFooterIdentifiable>(cellIdentifiable: T.Type) -> T {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: cellIdentifiable.reuseIdentifier) as? T else {
            fatalError("Unable to dequeue an header/footer view for reuseIdentifier '\(T.self)'. Make sure to call `registerHeaderFooterView(for:)` during table initialization")
        }
        return view
    }
}

/// Make UITableViewCell conforms to the protocol, in order to always have the `reuseIdentifier` property
/// Default implementation uses the class name as reuse identifier
extension UITableViewCell: TableViewCellIdentifiable {
    public static var reuseIdentifier: String {
        String(describing: Self.self)
    }
}

extension UITableViewHeaderFooterView: TableViewHeaderFooterIdentifiable {
    public static var reuseIdentifier: String {
        String(describing: Self.self)
    }
}
#endif
