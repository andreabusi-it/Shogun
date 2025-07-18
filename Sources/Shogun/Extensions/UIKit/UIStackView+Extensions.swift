//
//  UIStackView+Extensions.swift
//  
//
//  Created by Andrea Busi (www.andreabusi.it).
//

#if canImport(UIKit)
import UIKit


extension UIStackView {
    
    /// Remove all subviews from the current stack view.
    /// - Returns: Removed subviews
    @discardableResult
    public func removeArrangedSubviews() -> [UIView] {
        arrangedSubviews.reduce([UIView]()) { $0 + [removeArrangedSubViewProperly($1)] }
    }
    
    // MARK: - Private
    
    private func removeArrangedSubViewProperly(
        _ view: UIView
    ) -> UIView {
        removeArrangedSubview(view)
        NSLayoutConstraint.deactivate(view.constraints)
        view.removeFromSuperview()
        return view
    }
}

#endif
