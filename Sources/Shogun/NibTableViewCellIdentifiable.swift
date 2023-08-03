//
//  NibTableViewCellIdentifiable.swift
//  
//
//  Created by Andrea Busi on 03/08/23.
//

#if canImport(UIKit)
import UIKit

public protocol NibTableViewCellIdentifiable {
   /// Nib name where the cell is stored.
   static var nibName: String { get }
   /// Reuse identifier for the cell.
   /// Must be the same used inside the xib name.
   static var reuseIdentifier: String { get }
   /// Estimated height for the cell
   static var estimatedHeight: CGFloat { get }
}

extension NibTableViewCellIdentifiable {
   // By default, the Nib name is equal to class name
   public static var nibName: String {
       String(describing: Self.self)
   }
}


/// Defines some convenience methods using `NibTableViewCellIdentifiable` protocol
extension UITableView {
    
    /// Registers a class that conforms to `NibTableViewCellIdentifiable`, to use in creating new table cells.
    public func registerCell(for nibCellIdentifiable: NibTableViewCellIdentifiable.Type) {
       let nib = UINib(nibName: nibCellIdentifiable.nibName, bundle: nil)
       register(nib, forCellReuseIdentifier: nibCellIdentifiable.reuseIdentifier)
       
       estimatedRowHeight = nibCellIdentifiable.estimatedHeight
    }
    
    /// Returns a reusable table-view cell object for the specified reuse identifier and adds it to the table.
    public func dequeueReusableCell<T: NibTableViewCellIdentifiable>(nibCellIdentifiable: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to dequeue a cell for reuseIdentifier '\(T.self)'. Make sure to call `registerCell(for:)` during table initialization")
        }
        return cell
    }
}

#endif
