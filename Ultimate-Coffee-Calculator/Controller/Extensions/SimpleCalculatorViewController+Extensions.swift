//
//  SimpleCalculatorViewController+Extensions.swift
//  Ultimate-Coffee-Calculator
//
//  Created by Michael Maryanoff on 11/14/19.
//  Copyright © 2019 Michael Maryanoff. All rights reserved.
//

import UIKit

extension SimpleCalculationViewController {
    
    func initialSetup() {
        coffeeTextField.delegate = self
        ratioTextField.delegate = self
        waterTextField.delegate = self
    }
    
}