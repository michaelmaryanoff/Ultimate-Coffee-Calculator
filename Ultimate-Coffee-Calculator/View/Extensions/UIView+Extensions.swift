//
//  UIView+Extensions.swift
//  Ultimate-Coffee-Calculator
//
//  Created by Michael Maryanoff on 11/15/19.
//  Copyright © 2019 Michael Maryanoff. All rights reserved.
//

import UIKit

extension UIView {
    func setGradientBackground(from topColor: UIColor, to bottomColor: UIColor) {
        
        // This function draws a gradient layer when view is loaded
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.1)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
