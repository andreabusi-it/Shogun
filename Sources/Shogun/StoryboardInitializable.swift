//
//  StoryboardInitializable.swift
//  
//
//  Created by Andrea Busi (www.andreabusi.it).
//

#if canImport(UIKit)
import UIKit


/// Conforms to this protocol to have a class method that  instantiate a new
/// controller from Storybaord
public protocol StoryboardInitializable where Self: UIViewController {
    /// Name of the Storybaord file where the controller is defined
    static var storyboardName: String { get }
    /// Controller Id defined in the Storybaord for the current class
    static var storyboardControllerId: String { get }
    
    /// Creates the view controller with the storyboard identifier defined by the protocol itself.
    static func makeViewController() -> Self
}

public extension StoryboardInitializable {
    static func makeViewController() -> Self {
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle(for: Self.self))
        guard let controller = storyboard.instantiateViewController(withIdentifier: storyboardControllerId) as? Self else {
            fatalError("Unable to instantiate controller with name '\(storyboardControllerId)'")
        }
        return controller
    }
}

#endif
