//
//  UIView+Extensions.swift
//  
//
//  Created by Andrea Busi (www.andreabusi.it).
//

import UIKit


extension UIView {
    
    /// Apply rounded corners to the current view.
    ///
    /// - Parameters:
    ///    - radius: The radius of the layer's corner.
    public func roundBorder(
        radius: CGFloat
    ) {
        layer.cornerRadius = radius
        clipsToBounds = true
    }
    
    /// Apply rounded corners to the current view and also a border
    ///
    /// - Parameters:
    ///   - radius: The radius of the layer's corner
    ///   - width:  The width of the layer's border
    ///   - color:  The color of the layer's border
    public func roundBorder(
        radius: CGFloat,
        width: CGFloat,
        color: UIColor
    ) {
        layer.cornerRadius = radius
        layer.borderWidth = width
        layer.borderColor = color.cgColor
        clipsToBounds = true
    }
    
    /// Constraint the current view to the same anchors of the given view.
    /// - Parameters:
    ///    - view: View where to attach the current view.
    public func constraint(
        to view: UIView
    ) {
        constraint(top: view.topAnchor,
                   bottom: view.bottomAnchor,
                   leading: view.leadingAnchor,
                   trailing: view.trailingAnchor)
    }
    
    /// Constraint the current view to the given anchors.
    /// - Parameters:
    ///   - topAnchor: A layout anchor from a UIView, NSView, or UILayoutGuide object.
    ///   - bottomAnchor: A layout anchor from a UIView, NSView, or UILayoutGuide object.
    ///   - leadingAnchor: A layout anchor from a UIView, NSView, or UILayoutGuide object.
    ///   - trailingAnchor: A layout anchor from a UIView, NSView, or UILayoutGuide object.
    public func constraint(
        top topAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,
        bottom bottomAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>,
        leading leadingAnchor: NSLayoutAnchor<NSLayoutXAxisAnchor>,
        trailing trailingAnchor: NSLayoutAnchor<NSLayoutXAxisAnchor>
    ) {
        self.topAnchor.constraint(equalTo: topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    /// Creates a snapshot of the current view.
    /// - Returns: Image with the snapshot of the view.
    public func createSnapshot() -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: bounds.size)
        let image = renderer.image { ctx in
            drawHierarchy(in: bounds, afterScreenUpdates: true)
        }
        return image
    }
}
