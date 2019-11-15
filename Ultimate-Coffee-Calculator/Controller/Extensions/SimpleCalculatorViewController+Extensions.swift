//
//  SimpleCalculatorViewController+Extensions.swift
//  Ultimate-Coffee-Calculator
//
//  Created by Michael Maryanoff on 11/14/19.
//  Copyright © 2019 Michael Maryanoff. All rights reserved.
//

import UIKit

extension SimpleCalculationViewController {
    
    // MARK: - Lifecycle functions
    func initialSetup() {
        
        addDelegates()
        addGestureRecognizer()
        subscribeToKeyboardNotifications()
        view.setGradientBackground(from: Colors.deepOrange, to: Colors.mellowOrange)
    }
    
    // MARK: - Helper functions
    func addDelegates() {
        coffeeTextField.delegate = self
        ratioTextField.delegate = self
        waterTextField.delegate = self
    }
    
    func addGestureRecognizer() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    // MARK: - Keyboard functions
    func subscribeToKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func unsubscribeFromKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification:Notification) {
        if waterTextField.isEditing {
            view.frame.origin.y -= getKeyboardHeight(notification)
        }
    }
    
    @objc func keyboardWillHide(_ notification:Notification) {
        view.frame.origin.y = 0
    }
    
    func getKeyboardHeight(_ notification:Notification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue
        return keyboardSize.cgRectValue.height
    }
    
    @objc func dismissKeyboard() {
        
        view.endEditing(true)
    }
    
}

// MARK: - Text field methods
extension SimpleCalculationViewController: UITextFieldDelegate {
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if setCharacterLimit(textField: textField, shouldChangeCharactersIn: range, replacementString: string) == false {
            return false
        } else {
            return true
        }
    }
    
    func setCharacterLimit(textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        switch textField {
        case coffeeTextField:
            return limitCharacterOutput(textField: coffeeTextField, maxStringLength: 3, range: range, string: string)
        case ratioTextField:
            return limitCharacterOutput(textField: ratioTextField, maxStringLength: 2, range: range, string: string)
        case waterTextField:
            return limitCharacterOutput(textField: waterTextField, maxStringLength: 5, range: range, string: string)
        default:
            return true
        }

    }
    
    func limitCharacterOutput(textField: UITextField, maxStringLength: Int, range: NSRange, string: String) -> Bool {
        var result = true
        guard let text = textField.text else {
            return false
        }
        
        let disallowedCharacterSet = NSCharacterSet(charactersIn: "0123456789.-").inverted
        let replacementStringIsLegal = string.rangeOfCharacter(from: disallowedCharacterSet) == nil
        result = replacementStringIsLegal
        
        let maxStringLength = maxStringLength
        let currentString: NSString = text as NSString
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxStringLength && result
    }
    
}
