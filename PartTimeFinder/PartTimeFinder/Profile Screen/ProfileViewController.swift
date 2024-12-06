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
    let database = Firestore.firestore()
    var signedInEmail: String?
    
    override func loadView() {
        view = profileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        title = "Profile Screen"
        
        fetchProfileDetails()
        
        profileView.buttonLogout.addTarget(self, action: #selector(onLogoutBarButtonTapped), for: .touchUpInside)
    }
    
    @objc func fetchProfileDetails() {
        self.database.collection("users").getDocuments { (snapshot, error) in
            if let error = error {
                print("Error fetching users: \(error.localizedDescription)")
                return
            }
            
            guard let documents = snapshot?.documents else {
                print("No documents found")
                return
            }
            
            for document in documents {
                let data = document.data()
                self.profileView.labelName.text = "\(data["name"] ?? "Anonymous")"
                self.profileView.labelEmail.text = "\(data["email"] ?? "")"
                self.profileView.labelPhoneNum.text = "\(data["phoneNum"] ?? "+1 000 000 0000")"
            }
        }
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
