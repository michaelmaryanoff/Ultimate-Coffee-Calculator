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
        print("called \(#function)")
        
        initialSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("called \(#function)")
        
        subscribeToKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        unsubscribeFromKeyboardNotifications()
    }
    
    // MARK: - IBActions
    @IBAction func coffeeWeightDidChange(_ sender: Any) {
        print("called \(#function)")
        waterTextField.text = calculateFinalWeight(coffeeText: coffeeTextField.text,
                                                   ratioText: ratioTextField.text,
                                                   waterText: waterTextField.text,
                                                   calculateWater: true)
        
    }
    
    @IBAction func ratioDidChange(_ sender: Any) {
        print("called \(#function)")
        waterTextField.text = calculateFinalWeight(coffeeText: coffeeTextField.text,
                                                   ratioText: ratioTextField.text,
                                                   waterText: waterTextField.text,
                                                   calculateWater: true)
        
    }
    
    @IBAction func waterWeightDidChange(_ sender: Any) {
        print("called \(#function)")
        coffeeTextField.text = calculateFinalWeight(coffeeText: coffeeTextField.text,
                                                   ratioText: ratioTextField.text,
                                                   waterText: waterTextField.text,
                                                   calculateWater: false)

    }
    
}


