//
//  LoginScreenView.swift
//  WA4_Chandak_6490
//
//  Created by Rahul Chandak on 10/29/24.
//

import UIKit

class HomeView: UIView, UISearchBarDelegate {
    
    var buttonDummy: UIButton!
    
    // Create table to print job
    var tableViewJobs: UITableView!
    // Add job posting
    var floatingButtonAddJobs: UIButton!
    // profile pic
    var profilePic: UIImageView!
    // search bar
    var searchBar: UISearchBar!

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
//      setupButtonDummy()
        setupProfilePic()
        
        setupTableViewJobs()
        setupFloatingButtonAddJobs()
        
        setupSearchBar()
        
        initConstraints()
    }
    
    // create table structure to display jobs
    
    func setupProfilePic(){
        profilePic = UIImageView()
        profilePic.image = UIImage(systemName: "person.circle")?.withRenderingMode(.alwaysOriginal)
        profilePic.contentMode = .scaleToFill
        profilePic.clipsToBounds = true
        profilePic.layer.masksToBounds = true
        profilePic.translatesAutoresizingMaskIntoConstraints = false
 
        
        self.addSubview(profilePic)
    }
    
    
    
    func setupTableViewJobs(){
        tableViewJobs = UITableView()
        tableViewJobs.register(JobsTableViewCell.self, forCellReuseIdentifier: Configs.tableViewJobsID)
        tableViewJobs.translatesAutoresizingMaskIntoConstraints = false
        
        // New: Enable automatic row height adjustment
        // added to increase cell height and width
        tableViewJobs.rowHeight = UITableView.automaticDimension
        tableViewJobs.estimatedRowHeight = 80
        
        
        
        self.addSubview(tableViewJobs)
    }
    
//    func setupButtonDummy() {
//        buttonDummy = UIButton(type: .system)
//        buttonDummy.setTitle("Job Details", for: .normal)
//        buttonDummy.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
//        buttonDummy.setTitleColor(.white, for: .normal)
//        buttonDummy.backgroundColor = .systemRed
//        buttonDummy.layer.cornerRadius = 8
//        buttonDummy.translatesAutoresizingMaskIntoConstraints = false
//        self.addSubview(buttonDummy)
//    }
//
    
    func setupSearchBar()
    {
        
           searchBar = UISearchBar()
           searchBar.delegate = self
           searchBar.placeholder = "Search by title"
           searchBar.translatesAutoresizingMaskIntoConstraints = false
           searchBar.isUserInteractionEnabled = true


           // Add the search bar to your view
           self.addSubview(searchBar)
        
    }
    
    
    
    
    func setupFloatingButtonAddJobs()
    {
        floatingButtonAddJobs = UIButton(type: .system)
        floatingButtonAddJobs.setTitle("", for: .normal)
        floatingButtonAddJobs.setImage(UIImage(systemName: "doc.text.magnifyingglass")?.withRenderingMode(.alwaysOriginal), for: .normal)
        floatingButtonAddJobs.contentHorizontalAlignment = .fill
        floatingButtonAddJobs.contentVerticalAlignment = .fill
        floatingButtonAddJobs.imageView?.contentMode = .scaleAspectFit
        floatingButtonAddJobs.layer.cornerRadius = 16
        floatingButtonAddJobs.imageView?.layer.shadowOffset = .zero
        floatingButtonAddJobs.imageView?.layer.shadowRadius = 0.8
        floatingButtonAddJobs.imageView?.layer.shadowOpacity = 0.7
        floatingButtonAddJobs.imageView?.clipsToBounds = true
        floatingButtonAddJobs.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(floatingButtonAddJobs)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
//            buttonDummy.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
//            buttonDummy.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
//            buttonDummy.widthAnchor.constraint(equalToConstant: 100),
//            buttonDummy.heightAnchor.constraint(equalToConstant: 100),
            
//            profilePic.widthAnchor.constraint(equalToConstant: 42),
//            profilePic.heightAnchor.constraint(equalToConstant: 42),
//            profilePic.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
//            profilePic.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            // working code
            
//            profilePic.widthAnchor.constraint(equalToConstant:  40),
//            profilePic.heightAnchor.constraint(equalToConstant: 40),
//            profilePic.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: -33),
//            profilePic.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -33),
//            
//            searchBar.topAnchor.constraint(equalTo: self.topAnchor),
//            searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            
//            tableViewJobs.topAnchor.constraint(equalTo: searchBar.topAnchor, constant: 50),
//            tableViewJobs.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
//            tableViewJobs.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
//            tableViewJobs.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
//            
//            floatingButtonAddJobs.widthAnchor.constraint(equalToConstant: 48),
//            floatingButtonAddJobs.heightAnchor.constraint(equalToConstant: 48),
//            floatingButtonAddJobs.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16),
//            floatingButtonAddJobs.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            // Profile Picture Constraints
            profilePic.widthAnchor.constraint(equalToConstant: 40),
            profilePic.heightAnchor.constraint(equalToConstant: 40),
            profilePic.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: -26),  // Adjust this value to make sure it's visible
            profilePic.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -26),

            // Search Bar Constraints
            searchBar.topAnchor.constraint(equalTo: profilePic.topAnchor, constant: 78),  // Make space below the profile pic
            searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),

            // Table View Constraints
            tableViewJobs.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 8),  // Space below the search bar
            tableViewJobs.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            tableViewJobs.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tableViewJobs.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),

            // Floating Button Constraints
            floatingButtonAddJobs.widthAnchor.constraint(equalToConstant: 48),
            floatingButtonAddJobs.heightAnchor.constraint(equalToConstant: 48),
            floatingButtonAddJobs.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            floatingButtonAddJobs.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
    ])}
    
    //MARK: unused methods...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
