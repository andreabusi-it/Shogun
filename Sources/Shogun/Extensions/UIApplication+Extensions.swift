//
//  UIApplication+Extensions.swift
//  
//
//  Created by Andrea Busi (www.andreabusi.it).
//

import UIKit


extension UIApplication {
    
    /// The app's key window, made safe for UIScene support.
    public var sceneKeyWindow: UIWindow? {
        windows.filter { $0.isKeyWindow }.first
    }
    
    /// The height of the system status bar, made safe for UIScene support.
    public var sceneStatusBarHeight: CGFloat {
        if #available(iOS 13.0, *) {
            return sceneKeyWindow?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        } else {
            return UIApplication.shared.statusBarFrame.height
        }
    }
}
