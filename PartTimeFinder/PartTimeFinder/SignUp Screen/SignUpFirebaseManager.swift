//
//  RegisterFirebaseManager.swift
//  App12
//
//  Created by Rahul Chandak on 6/2/23.
//

import UIKit
import FirebaseAuth
import FirebaseStorage

extension SignUpViewController{
    
    func registerUser(){
        if let name = signUpView.textFieldName.text?.trimmingCharacters(in: .whitespacesAndNewlines),
           let email = signUpView.textFieldEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines),
           let phoneNum = signUpView.textFieldPhoneNum.text?.trimmingCharacters(in: .whitespacesAndNewlines),
           let password = signUpView.textFieldPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines),
           let repeatPassword = signUpView.textFieldRepeatPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines),
           
            !name.isEmpty, !email.isEmpty, !phoneNum.isEmpty, !password.isEmpty, !repeatPassword.isEmpty {
            if (password != repeatPassword) {
                Utils.throwAlert(on: self, title: "Error", message: "Passwords don't match")
                return
            } else if Utils.isEmailIncorrect(email: email) {
                Utils.throwAlert(on: self, title: "Error", message: "Please enter a valid email")
                return
            } else if (phoneNum.count != 10) {
                Utils.throwAlert(on: self, title: "Invalid Phone!", message: "Phone number should be of 10 digits")
                return
            } else {
                showActivityIndicator()
                Auth.auth().createUser(withEmail: email, password: password, completion: {result, error in
                    if error == nil{
                        self.setNameOfTheUserInFirebaseAuth(name: name)
                        guard let registeredEmail = result?.user.email else { return }
                        let collectionUsers = self.database
                            .collection("users")
                        
                        do{
                            let user = User(name: name, email: email, phoneNum: phoneNum)
                            try collectionUsers.document(registeredEmail).setData(from: user) { error in
                                if let error = error {
                                    print("Error adding user to users collection: \(error.localizedDescription)")
                                } else {
                                    print(error)
                                }
                            }
                        }catch{
                            print(error)
                        }
                    } else {
                        self.hideActivityIndicator()
                        Utils.throwAlert(on: self, title: "Error", message: "Account already exists. Please login")
                        self.navigationController?.popViewController(animated: true)
                        return
                    }
                })
            }
        } else {
            Utils.throwAlert(on: self, title: "Error", message: "Fields cannot be empty")
            hideActivityIndicator()
            return
        }
    }
    
    
    func setNameOfTheUserInFirebaseAuth(name: String){
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = name
        changeRequest?.commitChanges(completion: {(error) in
            if error == nil{
                //MARK: hide the progress indicator...
                self.hideActivityIndicator()
                
                let alert = UIAlertController(title: "Success", message: "Account Created Successfully", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                    // Pop the current view controller when OK is clicked
                    self.navigationController?.popViewController(animated: true)
                }
                alert.addAction(okAction)
                self.present(alert, animated: true)
            }else{
                //MARK: there was an error updating the profile...
                print("Error occured: \(String(describing: error))")
            }
        })
    }
}
