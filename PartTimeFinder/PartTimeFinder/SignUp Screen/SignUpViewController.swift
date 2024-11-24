//
//  SignUpViewController.swift
//  WA7_Chandak_6490
//
//  Created by Rahul Chandak on 10/29/24.
//

import UIKit
import PhotosUI
import FirebaseStorage
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class SignUpViewController: UIViewController {
    
    let signUpView = SignUpView()
    
    let childProgressView = ProgressSpinnerViewController()
    
    let storage = Storage.storage()
    
    let database = Firestore.firestore()
    
    override func loadView() {
        view = signUpView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        signUpView.buttonSignup
            .addTarget(self, action: #selector(onButtonSignupTapped), for: .touchUpInside)
        
        signUpView.buttonLogin
            .addTarget(self, action: #selector(onButtonLoginTapped), for: .touchUpInside)
    }
    
    @objc func onButtonSignupTapped() {
        registerUser()
    }
    
    @objc func onButtonLoginTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}
