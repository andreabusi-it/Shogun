//
//  UITextField+Extensions.swift
//  
//
//  Created by Andrea Busi (www.andreabusi.it).
//

import UIKit


extension UITextField {
    
    /// Limit the number of characters in the current text field.
    /// This method is a useful implementation for the UITextFieldDelegate's method
    /// `textField(_:shouldChangeCharactersIn:replacementString:)`.
    ///
    /// Here is a sample of the method usage:
    /// ```
    /// extension MyController: UITextFieldDelegate {
    ///     func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    ///         textField.limitLength(to: 10, range: range, string: string)
    ///     }
    /// }
    /// ```
    ///
    /// Credits: [hackingwithswift.com](https://www.hackingwithswift.com/example-code/uikit/how-to-limit-the-number-of-characters-in-a-uitextfield-or-uitextview)
    ///
    /// - Parameters:
    ///    - maxLength: Max number of characters allowed in the text field
    ///    - range: The range of characters to be replaced
    ///    - string: The replacement string for the specified range
    /// - Returns: `true` if the specified text range should be replaced; otherwise, `false` to keep the old text.
    public func limitLength(
        to maxLength: Int,
        range: NSRange,
        string: String
    ) -> Bool {
        // get the current text, or use an empty string if that failed
        let currentText = text ?? ""
        
        // attempt to read the range they are trying to change, or exit if we can't
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        // add their new text to the existing text
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        return updatedText.count <= maxLength
    }
}
