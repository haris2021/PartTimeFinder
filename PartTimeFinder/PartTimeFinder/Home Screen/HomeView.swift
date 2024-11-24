//
//  LoginScreenView.swift
//  WA4_Chandak_6490
//
//  Created by Rahul Chandak on 10/29/24.
//

import UIKit

class HomeView: UIView {
    
    var buttonDummy: UIButton!
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupButtonDummy()
        
        initConstraints()
    }
    
    func setupButtonDummy() {
        buttonDummy = UIButton(type: .system)
        buttonDummy.setTitle("Job Details", for: .normal)
        buttonDummy.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        buttonDummy.setTitleColor(.white, for: .normal)
        buttonDummy.backgroundColor = .systemRed
        buttonDummy.layer.cornerRadius = 8
        buttonDummy.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonDummy)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            buttonDummy.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            buttonDummy.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonDummy.widthAnchor.constraint(equalToConstant: 100),
            buttonDummy.heightAnchor.constraint(equalToConstant: 100),
    ])}
    
    //MARK: unused methods...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
