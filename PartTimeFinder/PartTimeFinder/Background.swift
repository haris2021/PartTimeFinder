//
//  Background.swift
//  PartTimeFinder
//
//  Created by Rahul Chandak on 12/5/24.
//

import UIKit

extension UIView {
    
    func setupBackground() {
           let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.systemGray.cgColor, UIColor.white.cgColor]
           gradientLayer.startPoint = CGPoint(x: 0, y: 0)
           gradientLayer.endPoint = CGPoint(x: 1, y: 1)
           gradientLayer.frame = UIScreen.main.bounds
           self.layer.insertSublayer(gradientLayer, at: 0)
       }
    
}

