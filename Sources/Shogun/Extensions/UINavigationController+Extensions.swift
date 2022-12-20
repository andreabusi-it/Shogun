//
//  UINavigationController+Extensions.swift
//  
//
//  Created by Andrea Busi (www.andreabusi.it).
//

import UIKit


extension UINavigationController {
    
    /// Remove current controller from the current navigation stack
    /// and push the given controller
    public func replaceLastController(
        with controller: UIViewController,
        animated: Bool
    ) {
        var controllers = viewControllers
        
        // remove current controller (assume that is the last one)
        controllers.removeLast()
        // add new controller
        controllers.append(controller)
        
        // set new view controller
        // using this method, the transition will be managed automatically
        setViewControllers(controllers, animated: animated)
    }
    
    /// Pops view controller until the last (presented) view controller of the given type is found.
    ///
    /// - Parameters:
    ///    - type: Type of controller to search.
    ///    - animated: Set this value to true to animate the transition.
    public func popToLastViewController(
        of type: AnyClass,
        animated: Bool
    ) {
        if let controller = viewControllers.last(where: { $0.isKind(of: type) }) {
            popToViewController(controller, animated: animated)
        }
    }
    
    /// Pops view controller until the first (presented) view controller of the given type is found.
    ///
    /// - Parameters:
    ///    - type: Type of controller to search.
    ///    - animated: Set this value to true to animate the transition.
    public func popToFirstViewController(
        of type: AnyClass,
        animated: Bool
    ) {
        if let controller = viewControllers.first(where: { $0.isKind(of: type) }) {
            popToViewController(controller, animated: animated)
        }
    }
}
