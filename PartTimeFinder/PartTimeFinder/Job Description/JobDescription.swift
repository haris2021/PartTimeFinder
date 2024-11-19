//
//  JobDescription.swift
//  App12
//
//  Created by Rahul Chandak on 11/19/24.
//

import UIKit

class JobDescription: UIView {
    
    var jobImageView: UIImageView!
    var jobTitleLabel: UILabel!
    var companyNameLabel: UILabel!
    var locationLabel: UILabel!
    var descriptionTitleLabel: UILabel!
    var descriptionLabel: UILabel!
    var postingDateTitleLabel: UILabel!
    var postingDateLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupJobImageView()
        setupJobDetails()
        setupDescriptionSection()
        setupPostingDate()
        initConstraints()
    }
    
    // MARK: - Initializing UI Elements
    func setupJobImageView() {
        jobImageView = UIImageView()
        jobImageView.image = UIImage(systemName: "briefcase")
        jobImageView.contentMode = .scaleAspectFit
        jobImageView.tintColor = .darkGray
        jobImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(jobImageView)
    }
    
    func setupJobDetails() {
        jobTitleLabel = UILabel()
        jobTitleLabel.text = "Software Engineer"
        jobTitleLabel.font = .boldSystemFont(ofSize: 18)
        jobTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(jobTitleLabel)
        
        companyNameLabel = UILabel()
        companyNameLabel.text = "TechCorp Inc."
        companyNameLabel.font = .systemFont(ofSize: 16)
        companyNameLabel.textColor = .darkGray
        companyNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(companyNameLabel)
        
        locationLabel = UILabel()
        locationLabel.text = "San Francisco, CA"
        locationLabel.font = .systemFont(ofSize: 14)
        locationLabel.textColor = .lightGray
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(locationLabel)
    }
    
    func setupDescriptionSection() {
        descriptionTitleLabel = UILabel()
        descriptionTitleLabel.text = "Description"
        descriptionTitleLabel.font = .boldSystemFont(ofSize: 20)
        descriptionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(descriptionTitleLabel)
        
        descriptionLabel = UILabel()
        descriptionLabel.text = "This is a software engineering position focused on developing high-quality applications."
        descriptionLabel.font = .systemFont(ofSize: 16)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(descriptionLabel)
    }
    
    func setupPostingDate() {
        postingDateTitleLabel = UILabel()
        postingDateTitleLabel.text = "Posted on"
        postingDateTitleLabel.font = .boldSystemFont(ofSize: 20)
        postingDateTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(postingDateTitleLabel)
        
        postingDateLabel = UILabel()
        postingDateLabel.text = "15th November, 2024"
        postingDateLabel.font = .systemFont(ofSize: 16)
        postingDateLabel.numberOfLines = 0
        postingDateLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(postingDateLabel)
    }
    
    // MARK: - Setting Up Constraints
    func initConstraints() {
        NSLayoutConstraint.activate([
            jobImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            jobImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            jobImageView.widthAnchor.constraint(equalToConstant: 60),
            jobImageView.heightAnchor.constraint(equalToConstant: 60),
            
            jobTitleLabel.topAnchor.constraint(equalTo: jobImageView.topAnchor),
            jobTitleLabel.leadingAnchor.constraint(equalTo: jobImageView.trailingAnchor, constant: 20),
            
            companyNameLabel.topAnchor.constraint(equalTo: jobTitleLabel.bottomAnchor, constant: 4),
            companyNameLabel.leadingAnchor.constraint(equalTo: jobTitleLabel.leadingAnchor),
            
            locationLabel.topAnchor.constraint(equalTo: companyNameLabel.bottomAnchor, constant: 4),
            locationLabel.leadingAnchor.constraint(equalTo: jobTitleLabel.leadingAnchor),
            
            descriptionTitleLabel.topAnchor.constraint(equalTo: jobImageView.bottomAnchor, constant: 30),
            descriptionTitleLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            descriptionTitleLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            descriptionLabel.topAnchor.constraint(equalTo: descriptionTitleLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            postingDateTitleLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 30),
            postingDateTitleLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            postingDateTitleLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            postingDateLabel.topAnchor.constraint(equalTo: postingDateTitleLabel.bottomAnchor, constant: 10),
            postingDateLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            postingDateLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
