//
//  AddJobsFirebaseManager.swift
//  PartTimeFinder
//
//  Created by Haris Gunasekaran on 11/24/24.
//

import Foundation
import FirebaseStorage
import FirebaseAuth
import FirebaseFirestore


// This entire part manages code to upload image to get URL
// Use this URL to register a job in the job collection

extension AddJobsViewController{
    
    func uploadJobPhotoToStorage() {
        if pickedImage == nil {
            setDefaultPhoto()
        }
        
        guard let image = pickedImage else {
            print("Failed to set default image")
            return
        }
        
        guard let jpegData = image.jpegData(compressionQuality: 0.8) else {
            print("Failed to convert image to JPEG")
            return
        }
        
        let storageRef = storage.reference()
        let imagesRepo = storageRef.child("imagesJobs")
        let imageRef = imagesRepo.child("\(NSUUID().uuidString).jpg")
        
        let uploadTask = imageRef.putData(jpegData, metadata: nil) { (metadata, error) in
            if let error = error {
                print("Error uploading image: \(error.localizedDescription)")
                return
            }
            
            imageRef.downloadURL { (url, error) in
                if let error = error {
                    print("Error getting download URL: \(error.localizedDescription)")
                    return
                }
                
                if let photoURL = url {
                    print("Image uploaded successfully. URL: \(photoURL)")
                    self.addJob(photoURL: photoURL)
                }
            }
        }
        
        // Observe upload progress
        uploadTask.observe(.progress) { snapshot in
            if let progress = snapshot.progress {
                print("Upload progress: \(progress.fractionCompleted * 100)%")
            }
        }
    }
    
    func addJob(photoURL: URL) {
        guard
            let jobCompany = addJobsView.textFieldJobCompany.text, !jobCompany.isEmpty,
            let jobDesc = addJobsView.textViewJobDesc.text, !jobDesc.isEmpty,
            let jobName = addJobsView.textFieldJobName.text, !jobName.isEmpty,
            let jobPosterLocation = addJobsView.textFieldJobPosterLocation.text, !jobPosterLocation.isEmpty,
            let jobPostingDate = addJobsView.textFieldJobPostingDate.text, !jobPostingDate.isEmpty,
            let jobPostingZip = addJobsView.textFieldJobPostingZip.text, !jobPostingZip.isEmpty
        else {
            Utils.throwAlert(on: self, title: "Error", message: "Please fill in all fields")
            hideActivityIndicator()
            return
        }
        
        if !Utils.isValidUSZipCode(jobPostingZip) {
            Utils.throwAlert(on: self, title: "Invalid ZIP Code", message: "Please enter a valid 5-digit US ZIP Code.")
            hideActivityIndicator()
            return
        }
        
        let newJob = Job(
            jobName: jobName,
            jobCompany: jobCompany,
            jobDesc: jobDesc,
            jobImage: photoURL.absoluteString,
            jobPosterLocation: jobPosterLocation,
            jobPostingDate: jobPostingDate,
            jobPostingZip: jobPostingZip,
            jobLikedBy: [],
            jobDislikedBy: []
        )
        
        saveNewJobToFireStore(newJob: newJob)
    }
    
    func saveNewJobToFireStore(newJob: Job) {
        let jobsCollection = database.collection("jobs")
        
        showActivityIndicator()
        
        var jobRef: DocumentReference? = nil
        do {
            jobRef = try jobsCollection.addDocument(from: newJob, completion: { [weak self] (error: Error?) in
                if let error = error {
                    print("Error adding document: \(error.localizedDescription)")
                    self?.hideActivityIndicator()
                    self?.showAlert("Error", "Failed to save the job. Please try again.")
                } else {
                    guard let jobID = jobRef?.documentID else { return }
                    print("Successfully added job with ID: \(jobID)")
                    
                    self?.hideActivityIndicator()
                    self?.navigationController?.popViewController(animated: true)
                }
            })
        } catch {
            print("Error adding job: \(error)")
            hideActivityIndicator()
        }
    }
    
    func showAlert(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}
