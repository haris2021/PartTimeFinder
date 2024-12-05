//
//  Background.swift
//  PartTimeFinder
//
//  Created by Snehal Bondre on 12/5/24.
//

import UIKit

extension UIView {
//    func setupBackground(imageName: String = "background") {
//        let backgroundImage = UIImageView(image: UIImage(named: imageName))
//        backgroundImage.contentMode = .scaleAspectFill
//        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
//        self.addSubview(backgroundImage)
//        self.sendSubviewToBack(backgroundImage)
//        
//        NSLayoutConstraint.activate([
//            backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
//            backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor)
//        ])
//    }
    
    func setupBackground() {
           let gradientLayer = CAGradientLayer()
           gradientLayer.colors = [UIColor.systemTeal.cgColor, UIColor.white.cgColor]
           gradientLayer.startPoint = CGPoint(x: 0, y: 0)
           gradientLayer.endPoint = CGPoint(x: 1, y: 1)
           gradientLayer.frame = UIScreen.main.bounds
           self.layer.insertSublayer(gradientLayer, at: 0)
       }
    
}

