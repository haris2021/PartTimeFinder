//
//  HomeViewController.swift
//  PartTimeFinder
//
//  Created by Snehal Bondre on 11/22/24.
//

import UIKit
import PhotosUI
import FirebaseStorage
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class HomeViewController: UIViewController {
    
    let homeView = HomeView()

    
    var jobsList = [Jobs]()
    
    let database = Firestore.firestore()

        
    override func loadView() {
        view = homeView
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchJobs()
    }
    
    func fetchJobs() {
//        database.collection("jobs").getDocuments { snapshot, error in
//            if let error {
//                print("Error fetching jobs: \(error)")
//                return
//            }
//            
//            guard let snapshot else { return }
//            
//            self.jobsList.removeAll()
//        }
        
        self.database.collection("jobs")
            .addSnapshotListener(includeMetadataChanges: false, listener: { querySnapshot, error in
                if let documents = querySnapshot?.documents {
                    self.jobsList.removeAll()
                    for document in documents {
                        do {
                            let job = try document.data(as: Jobs.self)
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
        
        // Do any additional setup after loading the view.
        title = "Home Screen"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Profile", style: .plain, target: self,
            action: #selector(onProfileBarButtonTapped)
        )
        
        homeView.tableViewJobs.delegate = self
        homeView.tableViewJobs.dataSource = self
               
        //MARK: removing the separator line...
        homeView.tableViewJobs.separatorStyle = .none
        
        
        homeView.buttonDummy.addTarget(self, action: #selector(onJobDetailsButtonTapped), for: .touchUpInside)
    }
    
    @objc func onProfileBarButtonTapped(){
        let profileScreen = ProfileViewController()
        navigationController?.pushViewController(profileScreen, animated: true)
    }
    
    @objc func onJobDetailsButtonTapped(){
//        let jobDetailsScreen = JobDetailsViewController()
//        navigationController?.pushViewController(jobDetailsScreen, animated: true)
        
        let addNewJob = AddJobsViewController()
        navigationController?.pushViewController(addNewJob, animated: true)

    }
    
}
