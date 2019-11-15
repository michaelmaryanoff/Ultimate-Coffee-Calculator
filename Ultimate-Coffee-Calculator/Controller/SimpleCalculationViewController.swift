//
//  ViewController.swift
//  Ultimate-Coffee-Calculator
//
//  Created by Michael Maryanoff on 11/14/19.
//  Copyright © 2019 Michael Maryanoff. All rights reserved.
//

import UIKit

class SimpleCalculationViewController: UIViewController {
    
    
    // Outlets
    @IBOutlet weak var coffeeTextField: UITextField!
    @IBOutlet weak var ratioTextField: UITextField!
    @IBOutlet weak var waterTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
    }
    
}

extension SimpleCalculationViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if setCharacterLimit(textField: textField, shouldChangeCharactersIn: range, replacementString: string) == false {
            
            return false
        } else {
            
            return true
        }
        
        
        
    }
    
    func setCharacterLimit(textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == coffeeTextField {
            var result = true
            guard let text = textField.text else {
                print("there was no text")
                return false
            }
            
            let disallowedCharacterSet = NSCharacterSet(charactersIn: "0123456789.-").inverted
            let replacementStringIsLegal = string.rangeOfCharacter(from: disallowedCharacterSet) == nil
            result = replacementStringIsLegal
        
            let maxCoffeeStringLength = 3
            let currentString: NSString = text as NSString
            let newCoffeeString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
            return newCoffeeString.length <= maxCoffeeStringLength && result
            
        }
        
        if textField == ratioTextField {
            var result = true
            guard let text = textField.text else {
                print("there was no text")
                return false
            }
            
            let disallowedCharacterSet = NSCharacterSet(charactersIn: "0123456789.-").inverted
            let replacementStringIsLegal = string.rangeOfCharacter(from: disallowedCharacterSet) == nil
            result = replacementStringIsLegal
            
            let maxRatioStringLength = 2
            let currentString: NSString = text as NSString
            let newRatioString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
            return newRatioString.length <= maxRatioStringLength && result
        }
        
        if textField == waterTextField {
            var result = true
            guard let text = textField.text else {
                print("there was no text")
                return false
            }
            
            let disallowedCharacterSet = NSCharacterSet(charactersIn: "0123456789.-").inverted
            let replacementStringIsLegal = string.rangeOfCharacter(from: disallowedCharacterSet) == nil
            result = replacementStringIsLegal
            
            let maxWaterStringLength = 5
            let currentString: NSString = text as NSString
            let newWaterString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
            return newWaterString.length <= maxWaterStringLength && result
        }
        
        return true
    }
    
}
