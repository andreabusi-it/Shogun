//
//  UIButton+Extensions.swift
//  
//
//  Created by Andrea Busi (www.andreabusi.it).
//

#if canImport(UIKit)
import UIKit


extension UIButton {
    
    /// Add a blurred effect on the background of the current button.
    /// - Parameters:
    ///   - style: Style to use for the blur effect.
    ///   - cornerRadius: Corner radius of the background layer.
    ///   - padding: Padding to add between the button content and the background border.
    public func addBlurEffect(
        style: UIBlurEffect.Style = .regular,
        cornerRadius: CGFloat = 0,
        padding: CGFloat = 0
    ) {
        backgroundColor = .clear
        
        // add an effect view
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: style))
        blurView.isUserInteractionEnabled = false
        blurView.backgroundColor = .clear
        if cornerRadius > 0 {
            blurView.layer.cornerRadius = cornerRadius
            blurView.layer.masksToBounds = true
        }
        insertSubview(blurView, at: 0)
        
        // add constants for the effect view
        blurView.translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: blurView.leadingAnchor, constant: padding).isActive = true
        trailingAnchor.constraint(equalTo: blurView.trailingAnchor, constant: -padding).isActive = true
        topAnchor.constraint(equalTo: blurView.topAnchor, constant: padding).isActive = true
        bottomAnchor.constraint(equalTo: blurView.bottomAnchor, constant: -padding).isActive = true
        
        // if there is an image view, bring it to top
        if let imageView = self.imageView {
            imageView.backgroundColor = .clear
            bringSubviewToFront(imageView)
        }
    }
}

#endif
