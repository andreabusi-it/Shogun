//
//  File.swift
//  Shogun
//
//  Created by Andrea Busi on 18/07/25.
//

#if canImport(UIKit)
import SwiftUI
import UIKit


extension UIColor {
    
    @available(iOS 15.0, macCatalyst 15.0, *)
    public var color: Color {
        Color(uiColor: self)
    }
}
#endif
