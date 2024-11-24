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
    
    override func loadView() {
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        title = "Home Screen"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Profile", style: .plain, target: self,
            action: #selector(onProfileBarButtonTapped)
        )
        
        homeView.buttonDummy.addTarget(self, action: #selector(onJobDetailsButtonTapped), for: .touchUpInside)
    }
    
    @objc func onProfileBarButtonTapped(){
        let profileScreen = ProfileViewController()
        navigationController?.pushViewController(profileScreen, animated: true)
    }
    
    @objc func onJobDetailsButtonTapped(){
        let jobDetailsScreen = JobDetailsViewController()
        navigationController?.pushViewController(jobDetailsScreen, animated: true)
    }
    
}
