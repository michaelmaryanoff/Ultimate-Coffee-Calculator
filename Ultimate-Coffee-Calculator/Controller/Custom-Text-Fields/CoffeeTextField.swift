//
//  CoffeeTextField.swift
//  Ultimate-Coffee-Calculator
//
//  Created by Michael Maryanoff on 11/14/19.
//  Copyright © 2019 Michael Maryanoff. All rights reserved.
//

import UIKit

class CoffeeTextField: UITextField, UITextFieldDelegate {
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        guard let textFieldContents = textField.text else {
            return false
        }
        
        if textFieldContents.count > 4 {
            return false
        }
        
        return true
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("did edit")
    }
    
    
}
