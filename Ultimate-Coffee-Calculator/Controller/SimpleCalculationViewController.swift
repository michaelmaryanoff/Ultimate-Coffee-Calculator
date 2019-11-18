//
//  ViewController.swift
//  Ultimate-Coffee-Calculator
//
//  Created by Michael Maryanoff on 11/14/19.
//  Copyright © 2019 Michael Maryanoff. All rights reserved.
//

import UIKit

class SimpleCalculationViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var coffeeTextField: UITextField!
    @IBOutlet weak var ratioTextField: UITextField!
    @IBOutlet weak var waterTextField: UITextField!
    
    // MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        unsubscribeFromKeyboardNotifications()
    }
    
    // MARK: - IBActions
    @IBAction func coffeeWeightDidChange(_ sender: Any) {
        waterTextField.text = calculateFinalWeight(calculateWater: true)
    }
    
    @IBAction func ratioDidChange(_ sender: Any) {
        waterTextField.text = calculateFinalWeight(calculateWater: true)
    }
    
    @IBAction func waterWeightDidChange(_ sender: Any) {
        coffeeTextField.text = calculateFinalWeight(calculateWater: false)
    }
    
}


