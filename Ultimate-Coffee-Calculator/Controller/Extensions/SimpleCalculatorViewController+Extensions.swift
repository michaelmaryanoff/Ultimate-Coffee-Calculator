//
//  SimpleCalculatorViewController+Extensions.swift
//  Ultimate-Coffee-Calculator
//
//  Created by Michael Maryanoff on 11/14/19.
//  Copyright © 2019 Michael Maryanoff. All rights reserved.
//

import UIKit

extension SimpleCalculationViewController {
    
    // MARK: - Lifecycle Methods
    func initialSetup() {
        
        addDelegates()
        addGestureRecognizer()
        subscribeToKeyboardNotifications()
        
        view.setGradientBackground(from: Colors.deepOrange, to: Colors.mellowOrange)
    }
    
    // MARK: - Setup Methods
    func addDelegates() {
        coffeeTextField.delegate = self
        ratioTextField.delegate = self
        waterTextField.delegate = self
    }
    
    func addGestureRecognizer() {
        // This gesture recognizer dismisses the keyboard when user
        // taps outside of a text field.
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
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if waterTextField.isEditing {
            // Ensures that the view only moves up when the waterTextField is tapped
            view.frame.origin.y -= getKeyboardHeight(notification)
        }
    }
    
    @objc func keyboardWillHide(_ notification:Notification) {
        // Returns view to original position
        view.frame.origin.y = 0
    }
    
    func getKeyboardHeight(_ notification:Notification) -> CGFloat {
        // Gets the keyboard height in order to move frame to proper position
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
        // This switch ensures that no text field exceeds the maximum
        // number of characters for that specific text field.
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
        
        // Can set a max string length and illegal characters in a text field.
        var result = true
        guard let text = textField.text else {
            return false
        }
        
        let disallowedCharacterSet = NSCharacterSet(charactersIn: "0123456789").inverted
        let replacementStringIsLegal = string.rangeOfCharacter(from: disallowedCharacterSet) == nil
        result = replacementStringIsLegal
        
        let maxStringLength = maxStringLength
        let currentString: NSString = text as NSString
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxStringLength && result
    }
    
}


//MARK: - Calculation Methods
extension SimpleCalculationViewController {
    
    func calculateFinalWeight(calculateWater: Bool) -> String {
        // This function is used to calculate the weight of water or coffee needed to brew a cup.
        // If "calculateWater" is true, we are calculating the amount of water needed.
        // If "calculateWater" is false, we are calculating the amount of coffee needed.
        var calculationResult = ""
        if let coffeeText = coffeeTextField.text, let ratioText = ratioTextField.text, let waterText = waterTextField.text {
            let coffeeTextToInt = Int(coffeeText) ?? 0
            let ratioTextToInt = Int(ratioText) ?? 0
            let waterTextToInt = Int(waterText) ?? 0
            var computedWater: Int { return coffeeTextToInt * ratioTextToInt }
            let computedCoffee: Int = calculateCoffee(coffee: coffeeTextToInt, ratio: ratioTextToInt, water: waterTextToInt)
            if calculateWater == true {
                calculationResult = String(computedWater)
            } else {
                calculationResult = String(computedCoffee)
            }
        }
        return calculationResult
    }
    
    func calculateCoffee(coffee: Int, ratio: Int, water: Int) -> Int {
        
        // This function ensure we do not encounter a divide by zero error
        if water > 0 && ratio > 0 {
            return water / ratio
        } else {
            return 0
        }
    }
}
