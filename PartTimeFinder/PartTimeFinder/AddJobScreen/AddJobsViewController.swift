//
//  AddJobsViewController.swift
//  PartTimeFinder
//
//  Created by Haris Gunasekaran on 11/24/24.
//

import UIKit
import PhotosUI
import FirebaseStorage
import FirebaseFirestore

class AddJobsViewController: UIViewController {
    
    let storage = Storage.storage()
    let database = Firestore.firestore()
    var pickedImage: UIImage?
    let addJobsView = AddJobsView()
    let childProgressView = ProgressSpinnerViewController()
    
    override func loadView() {
        view = addJobsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        addJobsView.buttonRegister.addTarget(self, action: #selector(onRegisterTapped), for: .touchUpInside)
        title = "Post Job"
        
        addJobsView.buttonTakePhoto.menu = getMenuImagePicker()
        Utils.addTapGestureToDismissKeyboard(on:self)
    }
    
    
    func setDefaultPhoto() {
        if let defaultImage = UIImage(named: "NoImage") {
            self.addJobsView.buttonTakePhoto.setImage(
                defaultImage.withRenderingMode(.alwaysOriginal),
                for: .normal
            )
            self.pickedImage = defaultImage
        } else {
            print("Default photo not found in assets")
        }
    }
    
    
    
    @objc func onRegisterTapped() {
        showActivityIndicator()
        uploadJobPhotoToStorage()
    }
    
    func getMenuImagePicker() -> UIMenu {
        let menuItems = [
            UIAction(title: "Camera", handler: { _ in
                self.pickUsingCamera()
            }),
            UIAction(title: "Gallery", handler: { _ in
                self.pickPhotoFromGallery()
            })
        ]
        
        return UIMenu(title: "Select source", children: menuItems)
    }
    
    // Take Photo using Camera
    func pickUsingCamera() {
        let cameraController = UIImagePickerController()
        cameraController.sourceType = .camera
        cameraController.allowsEditing = true
        cameraController.delegate = self
        present(cameraController, animated: true)
    }
    
    // Pick Photo using Gallery
    func pickPhotoFromGallery() {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        configuration.selectionLimit = 1
        
        let photoPicker = PHPickerViewController(configuration: configuration)
        photoPicker.delegate = self
        present(photoPicker, animated: true)
    }
}
