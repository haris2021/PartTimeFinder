//
//  LoginScreenView.swift
//  WA4_Chandak_6490
//
//  Created by Rahul Chandak on 10/29/24.
//

import UIKit

class HomeView: UIView {
    
    var buttonDummy: UIButton!
    
    // Create table to print job
    var tableViewJobs: UITableView!
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupButtonDummy()
        setupTableViewJobs()
        initConstraints()
    }
    
    // create table structure to display jobs
    
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
            
            tableViewJobs.topAnchor.constraint(equalTo: buttonDummy.bottomAnchor, constant: 8),
            tableViewJobs.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            tableViewJobs.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tableViewJobs.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
    ])}
    
    //MARK: unused methods...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
