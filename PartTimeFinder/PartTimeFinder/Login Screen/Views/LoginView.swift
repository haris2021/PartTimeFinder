//
//  LoginScreenView.swift
//  WA4_Chandak_6490
//
//  Created by Rahul Chandak on 10/29/24.
//

import UIKit

class LoginView: UIView {
    
    var labelTitle: UILabel!
    var textFieldEmail: UITextField!
    var textFieldPassword: UITextField!
    var buttonLogin: UIButton!
    var buttonSignup: UIButton!
    var imageViewLogo: UIImageView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBackground()
        
        setupLogo()
        setupTitleLabel()
        setupEmailField()
        setupPasswordField()
        setupLoginButton()
        setupSignupButton()
        setupConstraints()
    }
    
    func setupLogo() {
        imageViewLogo = UIImageView()
        imageViewLogo.image = UIImage(named: "Logo")
        imageViewLogo.contentMode = .scaleAspectFit
        
        imageViewLogo.layer.cornerRadius = 50
        imageViewLogo.layer.masksToBounds = true
        
        imageViewLogo.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageViewLogo)
    }
    
    
    func setupTitleLabel() {
        labelTitle = UILabel()
        labelTitle.text = "Welcome to PartTimeFinder"
        labelTitle.font = UIFont.boldSystemFont(ofSize: 28)
        labelTitle.textColor = .white
        labelTitle.textAlignment = .center
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelTitle)
    }
    
    func setupEmailField() {
        textFieldEmail = UITextField()
        textFieldEmail.placeholder = "Email"
        textFieldEmail.borderStyle = .roundedRect
        textFieldEmail.backgroundColor = UIColor(white: 1.0, alpha: 0.8)
        
        let iconContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 36, height: 36))
        let iconImageView = UIImageView(image: UIImage(systemName: "envelope"))
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.frame = CGRect(x: 12, y: 8, width: 20, height: 20)
        iconContainerView.addSubview(iconImageView)
        
        textFieldEmail.leftView = iconContainerView
        textFieldEmail.leftViewMode = .always
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldEmail)
    }
    
    
    func setupPasswordField() {
        textFieldPassword = UITextField()
        textFieldPassword.placeholder = "Password"
        textFieldPassword.borderStyle = .roundedRect
        textFieldPassword.backgroundColor = UIColor(white: 1.0, alpha: 0.8)
        textFieldPassword.isSecureTextEntry = true
        
        let iconContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 36, height: 36))
        let iconImageView = UIImageView(image: UIImage(systemName: "lock"))
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.frame = CGRect(x: 12, y: 8, width: 20, height: 20)
        iconContainerView.addSubview(iconImageView)
        
        textFieldPassword.leftView = iconContainerView
        textFieldPassword.leftViewMode = .always
        textFieldPassword.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldPassword)
    }
    
    func setupLoginButton() {
        buttonLogin = UIButton(type: .system)
        buttonLogin.setTitle("Login", for: .normal)
        buttonLogin.setTitleColor(.white, for: .normal)
        buttonLogin.backgroundColor = UIColor.systemBlue
        buttonLogin.layer.cornerRadius = 8
        buttonLogin.layer.shadowColor = UIColor.black.cgColor
        buttonLogin.layer.shadowOffset = CGSize(width: 0, height: 2)
        buttonLogin.layer.shadowOpacity = 0.3
        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonLogin)
    }
    
    func setupSignupButton() {
        buttonSignup = UIButton(type: .system)
        buttonSignup.setTitle("New User? Sign Up Here", for: .normal)
        buttonSignup.setTitleColor(.systemBlue, for: .normal)
        buttonSignup.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        buttonSignup.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSignup)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            imageViewLogo.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageViewLogo.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageViewLogo.widthAnchor.constraint(equalToConstant: 100), // Adjust the size as needed
            imageViewLogo.heightAnchor.constraint(equalToConstant: 100),
            
            labelTitle.topAnchor.constraint(equalTo: imageViewLogo.bottomAnchor, constant: 20),
            labelTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            labelTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            textFieldEmail.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 40),
            textFieldEmail.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            textFieldEmail.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            textFieldEmail.heightAnchor.constraint(equalToConstant: 50),
            
            textFieldPassword.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 20),
            textFieldPassword.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            textFieldPassword.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            textFieldPassword.heightAnchor.constraint(equalToConstant: 50),
            
            buttonLogin.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 40),
            buttonLogin.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            buttonLogin.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            buttonLogin.heightAnchor.constraint(equalToConstant: 50),
            
            buttonSignup.topAnchor.constraint(equalTo: buttonLogin.bottomAnchor, constant: 20),
            buttonSignup.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            buttonSignup.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
