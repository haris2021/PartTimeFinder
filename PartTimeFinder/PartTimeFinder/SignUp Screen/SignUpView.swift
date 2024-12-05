//
//  RegisterScreenView.swift
//  WA4_Chandak_6490
//
//  Created by Rahul Chandak on 10/29/24.
//

import UIKit

class SignUpView: UIView {

    var labelTitle: UILabel!
    var textFieldName: UITextField!
    var buttonProfilePic: UIButton!
    var textFieldPhoneNum: UITextField!
    var textFieldEmail: UITextField!
    var textFieldPassword: UITextField!
    var textFieldRepeatPassword: UITextField!
    
    var buttonSignup: UIButton!
    var buttonLogin: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setuplabelTitle()
        setuptextFieldName()
//        setupbuttonProfilePic()
        setuptextFieldEmail()
        setuptextFieldPhoneNum()
        setuptextFieldPassword()
        setuptextFieldRepeatPassword()
        setupButtonLogin()
        setupButtonSignup()
        
        initConstraints()
    }
    
    func setuplabelTitle() {
        labelTitle = UILabel()
        labelTitle.text = "Create an account"
        labelTitle.font = labelTitle.font.withSize(24)
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelTitle)
    }
    
    func setuptextFieldName() {
        textFieldName = UITextField()
        textFieldName.placeholder = "Name"
        textFieldName.borderStyle = .roundedRect
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldName)
    }

    
    func setuptextFieldEmail() {
        textFieldEmail = UITextField()
        textFieldEmail.placeholder = "Email ID"
        textFieldEmail.borderStyle = .roundedRect
        textFieldEmail.autocapitalizationType = .none // Disable automatic capitalization
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldEmail)
    }
    
    func setuptextFieldPhoneNum() {
        textFieldPhoneNum = UITextField()
        textFieldPhoneNum.placeholder = "Phone Number"
        textFieldPhoneNum.borderStyle = .roundedRect
        textFieldPhoneNum.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldPhoneNum)
    }
    
    func setuptextFieldPassword() {
        textFieldPassword = UITextField()
        textFieldPassword.placeholder = "Password"
        textFieldPassword.borderStyle = .roundedRect
        textFieldPassword.isSecureTextEntry = true // Enable secure text entry
        textFieldPassword.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldPassword)
    }
    
    func setuptextFieldRepeatPassword() {
        textFieldRepeatPassword = UITextField()
        textFieldRepeatPassword.placeholder = "Retype Password"
        textFieldRepeatPassword.borderStyle = .roundedRect
        textFieldRepeatPassword.isSecureTextEntry = true // Enable secure text entry

        textFieldRepeatPassword.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldRepeatPassword)
    }
    
    func setupButtonSignup(){
        buttonSignup = UIButton(type: .system)
        buttonSignup.titleLabel?.font = .boldSystemFont(ofSize: 16)
        buttonSignup.setTitle("Sign up", for: .normal)
        buttonSignup.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSignup)
    }
    
    func setupButtonLogin(){
        buttonLogin = UIButton(type: .system)
        buttonLogin.titleLabel?.font = .boldSystemFont(ofSize: 16)
        buttonLogin.setTitle("Existing user? Click here to log in", for: .normal)
        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonLogin)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            labelTitle.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            labelTitle.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            textFieldName.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 32),
            textFieldName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldName.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            textFieldEmail.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 16),
            textFieldEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldEmail.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            textFieldPhoneNum.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 16),
            textFieldPhoneNum.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldPhoneNum.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            textFieldPassword.topAnchor.constraint(equalTo: textFieldPhoneNum.bottomAnchor, constant: 16),
            textFieldPassword.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldPassword.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            textFieldRepeatPassword.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 16),
            textFieldRepeatPassword.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldRepeatPassword.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            buttonSignup.topAnchor.constraint(equalTo: textFieldRepeatPassword.bottomAnchor, constant: 32),
            buttonSignup.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            buttonSignup.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            buttonLogin.topAnchor.constraint(equalTo: buttonSignup.bottomAnchor, constant: 16),
            buttonLogin.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            buttonLogin.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }
    
    //MARK: unused methods...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
