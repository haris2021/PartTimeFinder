//
//  ViewController.swift
//  WA7_Chandak_6490
//
//  Created by Rahul Chandak on 10/29/24.
//

import Foundation
import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    let loginScreen = LoginView()
    
    override func loadView() {
        view = loginScreen
    }
    
    // To clear fields after logout
    // referred from stackoverflow.com/questions/28335447/how-do-you-clear-a-textfield-box-after-going-back-from-a-navigation-stack
    override func viewWillAppear(_ animated: Bool) {

        super.viewWillAppear(animated)
        loginScreen.textFieldEmail.text = ""
        loginScreen.textFieldPassword.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        let defaults = UserDefaults.standard
//        let tokenSaved = defaults.object(forKey: "loginToken") as! String?
                
//        if let sessionToken = tokenSaved{           // Fetching token from session (if available)
//            let notesScreen = NotesScreenViewController()
//            notesScreen.loggedInToken = sessionToken
//            self.navigationController?.pushViewController(notesScreen, animated: true)
//        }
        
        loginScreen.buttonLogin
            .addTarget(self, action: #selector(onButtonLoginTapped), for: .touchUpInside)
        
        loginScreen.buttonSignup
            .addTarget(self, action: #selector(onButtonSignupTapped), for: .touchUpInside)
    }
    
    @objc func onButtonLoginTapped() {
        if let email = loginScreen.textFieldEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines),
           let password = loginScreen.textFieldPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines),
           !email.isEmpty, !password.isEmpty {
            
            if Utils.isEmailIncorrect(email: email) {
                Utils.throwAlert(on: self, title: "Error", message: "Please enter a valid email")
            }
            
            self.signInToFirebase(email: email, password: password)
            
        } else {
            Utils.throwAlert(on: self, title: "Error", message: "One of the fields is empty")
        }
    }
    
    @objc func onButtonSignupTapped() {
        // Go to Signup page
        let signUpScreen = SignUpViewController()
        navigationController?.pushViewController(signUpScreen, animated: true)
    }
    
    func signInToFirebase(email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password, completion: {(result, error) in
            if error == nil{
                let homeScreen = HomeViewController()
                self.navigationController?.pushViewController(homeScreen, animated: true)
            }else{
                Utils.throwAlert(on: self, title: "Error", message: "Account doesn't exist")
                return
            }
            
        })
    }
}


