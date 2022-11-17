//
//  UITableView+Extensions.swift
//  
//
//  Created by Andrea Busi (www.andreabusi.it).
//

import UIKit


extension UITableView {
    
    /// Hide the separator line between empty cells
    public func hideSeparatorForEmptyCells() {
        tableFooterView = UIView(frame: .zero)
    }
    
    /// Remove left margin of the rows separator
    public func removeLeftMargin() {
        cellLayoutMarginsFollowReadableWidth = false
        layoutMargins = .zero
        separatorInset = .zero
    }
}
