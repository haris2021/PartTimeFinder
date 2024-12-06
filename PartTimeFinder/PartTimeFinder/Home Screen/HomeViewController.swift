//
//  HomeViewController.swift
//  PartTimeFinder
//
//  Created by Haris Gunasekaran on 11/24/24.
//

import UIKit
import PhotosUI
import FirebaseStorage
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class HomeViewController: UIViewController {
    
    let homeView = HomeView()
    
    var jobsList = [Job]()
    var filteredJobsList = [Job]() // List to store filtered jobs
    var isSearchActive = false // Flag to determine if the search is active
    let database = Firestore.firestore()
    var currentUser:FirebaseAuth.User?
    
    override func loadView() {
        view = homeView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchJobs()
    }
    
    func fetchJobs() {
        
        self.database.collection("jobs")
            .addSnapshotListener(includeMetadataChanges: false, listener: { querySnapshot, error in
                if let documents = querySnapshot?.documents {
                    self.jobsList.removeAll()
                    for document in documents {
                        do {
                            let job = try document.data(as: Job.self)
                            self.jobsList.append(job)
                        } catch {
                            print(error)
                        }
                    }
                    self.jobsList.sort(by: { $0.jobPostingDate < $1.jobPostingDate })
                    self.homeView.tableViewJobs.reloadData()
                }
            })
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeView.tableViewJobs.delegate = self
        homeView.tableViewJobs.dataSource = self
        homeView.tableViewJobs.separatorStyle = .none
        
        homeView.searchBar.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "person.crop.circle"), // Use a system icon
            style: .plain,
            target: self,
            action: #selector(onProfileBarButtonTapped)
        )
        
        homeView.floatingButtonAddJobs.addTarget(self, action: #selector(addJobButtonTapped), for: .touchUpInside)
        Utils.addTapGestureToDismissKeyboard(on:self)
        print("hello")
    }
    
    @objc func onProfileBarButtonTapped(){
        let profileScreen = ProfileViewController()
        profileScreen.signedInEmail = currentUser?.email
        navigationController?.pushViewController(profileScreen, animated: true)
    }
    
    @objc func addJobButtonTapped(){
        let addNewJob = AddJobsViewController()
        navigationController?.pushViewController(addNewJob, animated: true)
        
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("inside searchbar")
        
        if searchText.isEmpty {
            isSearchActive = false
            filteredJobsList = jobsList // No filtering, show all jobs
            print("inside searchbar 1")
            
        } else {
            print("inside searchbar 2")
            
            isSearchActive = true
            
            filteredJobsList = jobsList.filter { job in
                return job.jobName.lowercased().contains(searchText.lowercased())
            }
            
            // if filteredJob is empty call alert
            if filteredJobsList.isEmpty {
                Utils.throwAlert(on: self, title: "No result", message: "No results found for \"\(searchText)\".")
            }
        }
        homeView.tableViewJobs.reloadData() // Reload the table with filtered data
    }
    
    // Optionally, handle search bar cancel button tap
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("inside searchbar cancel")
        
        searchBar.text = ""
        isSearchActive = false
        filteredJobsList = jobsList // Reset to show all jobs
        homeView.tableViewJobs.reloadData()
    }
}
