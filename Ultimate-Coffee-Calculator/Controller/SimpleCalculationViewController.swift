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
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        unsubscribeFromKeyboardNotifications()
    }
    

    @IBAction func coffeeWeightDidChange(_ sender: Any) {
        if let coffeeWeightText = coffeeTextField.text, let ratioText = ratioTextField.text {
            
            let coffeeWeightToInt = Int(coffeeWeightText) ?? 0
            let ratioTextToInt = Int(ratioText) ?? 0
            var calculatedWater: Int { return coffeeWeightToInt * ratioTextToInt }
            waterTextField.text = String(calculatedWater)
        }
    }
    
    @IBAction func ratioDidChange(_ sender: Any) {
        if let coffeeWeightText = coffeeTextField.text, let ratioText = ratioTextField.text, let waterText = waterTextField.text {
            
            let coffeeWeightToInt = Int(coffeeWeightText) ?? 0
            let ratioTextToInt = Int(ratioText) ?? 0
            let waterTextToInt = Int(waterText) ?? 0
            var calculatedWater: Int { return coffeeWeightToInt * ratioTextToInt }
            waterTextField.text = String(calculatedWater)
        }
        
    }
    
    @IBAction func waterWeightDidChange(_ sender: Any) {
        if let coffeeWeightText = coffeeTextField.text, let ratioText = ratioTextField.text, let waterText = waterTextField.text {
            
            let coffeeWeightToInt = Int(coffeeWeightText) ?? 0
            let ratioTextToInt = Int(ratioText) ?? 0
            let waterTextToInt = Int(waterText) ?? 0
            let calculatedCoffee = calculateWater(coffee: coffeeWeightToInt, ratio: ratioTextToInt, water: waterTextToInt)
            coffeeTextField.text = String(calculatedCoffee)
        }
        
    }
    
    func calculateWater(coffee: Int, ratio: Int, water: Int) -> Int {
        if water > 0 {
            return water / ratio
        } else {
            return 0
        }
    }
    
    
}


