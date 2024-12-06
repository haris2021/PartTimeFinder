//
//  AddJobsView.swift
//  PartTimeFinder
//
//  Created by Haris Gunasekaran on 11/19/24.
//

import UIKit

class AddJobsView: UIView, UITextViewDelegate {
    
    var textFieldJobCompany: UITextField!
    var textViewJobDesc: UITextView!
    var textFieldJobName: UITextField!
    var textFieldJobPosterLocation: UITextField!
    var textFieldJobPostingDate: UITextField!
    var textFieldJobPostingZip: UITextField!
    
    var labelPhoto: UILabel!
    var buttonTakePhoto: UIButton!
    var buttonRegister: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //        self.backgroundColor = .white
        setupBackground()
        
        setuptextFieldJobCompany()
        setuptextFieldJobDesc()
        setuptextFieldJobName()
        setuptextFieldJobPosterLocation()
        setuptextFieldJobPostingDate()
        setuptextFieldJobPostingZip()
        
        setuplabelPhoto()
        setupbuttonTakePhoto()
        setupbuttonRegister()
        
        initConstraints()
    }
    
    func setupbuttonRegister(){
        buttonRegister = UIButton(type: .system)
        buttonRegister.setTitle("Add Job", for: .normal)
        buttonRegister.titleLabel?.font = .boldSystemFont(ofSize: 16)
        buttonRegister.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonRegister)
    }
    
    func setuplabelPhoto(){
        labelPhoto = UILabel()
        labelPhoto.text = "Add Image"
        labelPhoto.font = UIFont.boldSystemFont(ofSize: 14)
        labelPhoto.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelPhoto)
    }
    
    func setupbuttonTakePhoto(){
        buttonTakePhoto = UIButton(type: .system)
        buttonTakePhoto.setTitle("", for: .normal)
        buttonTakePhoto.setImage(UIImage(systemName: "camera.fill")?.withRenderingMode(.alwaysOriginal), for: .normal)
        buttonTakePhoto.contentHorizontalAlignment = .fill
        buttonTakePhoto.contentVerticalAlignment = .fill
        buttonTakePhoto.imageView?.contentMode = .scaleAspectFit
        buttonTakePhoto.showsMenuAsPrimaryAction = true
        buttonTakePhoto.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonTakePhoto)
    }
    
    func setuptextFieldJobCompany() {
        textFieldJobCompany = UITextField()
        textFieldJobCompany.placeholder = "Company"
        textFieldJobCompany.keyboardType = .default
        textFieldJobCompany.borderStyle = .roundedRect
        textFieldJobCompany.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldJobCompany)
    }
    
    func setuptextFieldJobDesc() {
        textViewJobDesc = UITextView()
        textViewJobDesc.text = "Enter job description here..."
        textViewJobDesc.font = UIFont.systemFont(ofSize: 16)
        textViewJobDesc.textColor = .lightGray
        textViewJobDesc.layer.borderColor = UIColor.gray.cgColor
        textViewJobDesc.layer.borderWidth = 1.0
        textViewJobDesc.layer.cornerRadius = 5.0
        textViewJobDesc.translatesAutoresizingMaskIntoConstraints = false
        textViewJobDesc.isScrollEnabled = true // Allows scrolling for long text
        textViewJobDesc.isEditable = true
        textViewJobDesc.isSelectable = true
        
        textViewJobDesc.delegate = self
        self.addSubview(textViewJobDesc)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = ""
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Enter job description here..."
            textView.textColor = .lightGray
        }
    }
    
    func setuptextFieldJobName() {
        textFieldJobName = UITextField()
        textFieldJobName.placeholder = "Job Title"
        textFieldJobName.keyboardType = .default
        textFieldJobName.borderStyle = .roundedRect
        textFieldJobName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldJobName)
    }
    
    func setuptextFieldJobPosterLocation() {
        textFieldJobPosterLocation = UITextField()
        textFieldJobPosterLocation.placeholder = "Job Location"
        textFieldJobPosterLocation.keyboardType = .default
        textFieldJobPosterLocation.borderStyle = .roundedRect
        textFieldJobPosterLocation.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldJobPosterLocation)
    }
    
    func setuptextFieldJobPostingDate() {
        textFieldJobPostingDate = UITextField()
        textFieldJobPostingDate.placeholder = "Posting Date"
        textFieldJobPostingDate.keyboardType = .default
        textFieldJobPostingDate.borderStyle = .roundedRect
        textFieldJobPostingDate.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldJobPostingDate)
    }
    
    func setuptextFieldJobPostingZip()
    {
        textFieldJobPostingZip = UITextField()
        textFieldJobPostingZip.placeholder = "Zip Code"
        textFieldJobPostingZip.keyboardType = .default
        textFieldJobPostingZip.borderStyle = .roundedRect
        textFieldJobPostingZip.keyboardType = .numberPad
        textFieldJobPostingZip.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldJobPostingZip)
        
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            
            // New constraints for job-related fields
            textFieldJobCompany.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            textFieldJobCompany.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldJobCompany.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            
            textViewJobDesc.topAnchor.constraint(equalTo: textFieldJobCompany.bottomAnchor, constant: 16),
            textViewJobDesc.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textViewJobDesc.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            textViewJobDesc.heightAnchor.constraint(equalToConstant: 100),
            
            textFieldJobName.topAnchor.constraint(equalTo: textViewJobDesc.bottomAnchor, constant: 16),
            textFieldJobName.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldJobName.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            
            textFieldJobPosterLocation.topAnchor.constraint(equalTo: textFieldJobName.bottomAnchor, constant: 16),
            textFieldJobPosterLocation.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldJobPosterLocation.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            
            textFieldJobPostingDate.topAnchor.constraint(equalTo: textFieldJobPosterLocation.bottomAnchor, constant: 16),
            textFieldJobPostingDate.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldJobPostingDate.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            
            textFieldJobPostingZip.topAnchor.constraint(equalTo: textFieldJobPostingDate.bottomAnchor, constant: 16),
            textFieldJobPostingZip.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldJobPostingZip.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            
            buttonTakePhoto.topAnchor.constraint(equalTo: textFieldJobPostingZip.bottomAnchor, constant: 16),
            buttonTakePhoto.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            buttonTakePhoto.widthAnchor.constraint(equalToConstant: 100),
            buttonTakePhoto.heightAnchor.constraint(equalToConstant: 100),
            
            labelPhoto.topAnchor.constraint(equalTo: buttonTakePhoto.bottomAnchor),
            labelPhoto.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            buttonRegister.topAnchor.constraint(equalTo: labelPhoto.bottomAnchor, constant: 32),
            buttonRegister.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
