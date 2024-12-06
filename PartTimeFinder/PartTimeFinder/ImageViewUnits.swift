//
//  ImageViewUnits.swift
//  PartTimeFinder
//
//  Created by Haris Gunasekaran on 11/24/24.
//

import Foundation

import UIKit

extension UIImageView {
    func waitAndLoadRemoteImage(from url: URL) {
        // Placeholder image to avoid showing old content
        self.image = UIImage(named: "defaultImage")
        
        // Create a shared URL cache or use a custom caching library
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self, error == nil, let data = data, let image = UIImage(data: data) else {
                return
            }
            
            DispatchQueue.main.async {
                // Check if the cell is still showing the right image for its job
                if url.absoluteString == self.accessibilityIdentifier {
                    self.image = image
                }
            }
        }.resume()
    }
    
    func loadRemoteImage(from url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
}

