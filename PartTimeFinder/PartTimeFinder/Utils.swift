//
//  Utils.swift
//  PartTimeFinder
//
//  Created by Snehal Bondre on 11/22/24.
//

import UIKit

class Utils {
    static func throwAlert(on viewController: UIViewController, title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        viewController.present(alert, animated: true)
    }
    
    static func isEmailIncorrect(email: String) -> Bool{     // Returns true if email is incorrect
        // referred from stackoverflow.com/questions/25471114/how-to-validate-an-e-mail-address-in-swift/25471164#25471164
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return !emailPredicate.evaluate(with: email) || email.isEmpty
    }
    // Add Tap Gesture to Dismiss Keyboard
    static func addTapGestureToDismissKeyboard(on viewController: UIViewController) {
        let tapGesture = UITapGestureRecognizer(target: viewController, action: #selector(viewController.dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        viewController.view.addGestureRecognizer(tapGesture)
    }
    
    // Vaidation for zipCode
    
    static func isValidUSZipCode(_ zipCode: String) -> Bool {
        //        let zipCodePattern = "^[0-9]{5}$|^[0-9]{5}-[0-9]{4}$" // Only accepts exactly 5 digits or 5-4 format
        let zipCodePattern = "^(?!00000$|[0]{5}(-[0]{4})?$)[0-9]{5}$|^[0-9]{5}-[0-9]{4}$" // Exclude 00000 and all-zero zip codes
        
        let zipCodePredicate = NSPredicate(format: "SELF MATCHES %@", zipCodePattern)
        return zipCodePredicate.evaluate(with: zipCode)
    }
    
}

// Extend UIViewController to Add Dismiss Keyboard Method
extension UIViewController {
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
}
