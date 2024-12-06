//
//  LoginScreenView.swift
//  WA4_Chandak_6490
//
//  Created by Rahul Chandak on 10/29/24.
//

import UIKit

class HomeView: UIView, UISearchBarDelegate {
    
    var tableViewJobs: UITableView!
    
    var floatingButtonAddJobs: UIButton!
    
    var searchBar: UISearchBar!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //        backgroundColor = .white
        setupBackground()
        
        setupTableViewJobs()
        setupFloatingButtonAddJobs()
        setupSearchBar()
        
        initConstraints()
    }
    
    func setupTableViewJobs(){
        tableViewJobs = UITableView()
        tableViewJobs.register(JobsTableViewCell.self, forCellReuseIdentifier: Configs.tableViewJobsID)
        tableViewJobs.translatesAutoresizingMaskIntoConstraints = false
        
        // New: Enable automatic row height adjustment
        // added to increase cell height and width
        tableViewJobs.rowHeight = UITableView.automaticDimension
        tableViewJobs.estimatedRowHeight = 80
        
        tableViewJobs.backgroundColor = .clear
        self.addSubview(tableViewJobs)
    }
    
    func setupSearchBar() {
        searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.placeholder = "Search by role"
        searchBar.backgroundColor = .clear
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.isUserInteractionEnabled = true
        self.addSubview(searchBar)
    }
    
    func setupFloatingButtonAddJobs() {
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
            
            searchBar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            searchBar.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            searchBar.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.85),
            
            tableViewJobs.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 8),  // Space below the search bar
            tableViewJobs.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            tableViewJobs.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tableViewJobs.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
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
