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

class ProfileViewController: UIViewController {
    
    let profileView = ProfileView()
    
    override func loadView() {
        view = profileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        title = "Profile Screen"
    
        profileView.buttonLogout.addTarget(self, action: #selector(onLogoutBarButtonTapped), for: .touchUpInside)
    }
    
    @objc func onLogoutBarButtonTapped(){
        let logoutAlert = UIAlertController(title: "Logging out!", message: "Are you sure want to log out?", preferredStyle: .actionSheet)
        logoutAlert.addAction(UIAlertAction(title: "Yes, log out!", style: .default, handler: {(_) in
            do{
                try Auth.auth().signOut()
                self.navigationController?.popToRootViewController(animated: true)
            }catch{
                print("Error occured!")
            }
        })
        )
        logoutAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        self.present(logoutAlert, animated: true)
    }
}
