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
        
        if textField == waterTextField {
            
        }
        return true
    }
    
    }
