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
    
    // MARK: - LifeCycle methods
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
        waterTextField.text = calculateFinalWeight(calculateWater: false)
        
    }
    
    // MARK: - Helper methods
    func calculateFinalWeight(calculateWater: Bool) -> String {
        
        // If "calculateWater" is true, we are multiplying the amount of coffee by the ratio
        // If "calculateWater" is false, we are dividing water by the ratio
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
        if water > 0 {
            return water / ratio
        } else {
            return 0
        }
    }
    
    
}


