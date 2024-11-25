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
    
    
    func uploadJobPhotoToStorage()
    {
        var profilePhotoURL:URL?
        
        //MARK: Upload the profile photo if there is any...
        if let image = pickedImage
        {
            if let jpegData = image.jpegData(compressionQuality: 80)
            {
                let storageRef = storage.reference()
                let imagesRepo = storageRef.child("imagesJobs")
                let imageRef = imagesRepo.child("\(NSUUID().uuidString).jpg")
                
                let uploadTask = imageRef.putData(jpegData, completion: {(metadata, error) in
                    if error == nil
                    {
                        imageRef.downloadURL(completion: {(url, error) in
                            if error == nil
                            {
                                profilePhotoURL = url
                                self.addJob(photoURL: profilePhotoURL!)
                            }
                        })
                    }
                })
            }
        }else
        {
            addJob(photoURL: profilePhotoURL!)
        }
        
        
    }
    
//    func addJob(photoURL: URL)
//    {
//        
//          let jobCompany = addJobsView.textFieldJobCompany.text
//          let jobDesc = addJobsView.textViewJobDesc.text
//          let jobName = addJobsView.textFieldJobName.text
//          let jobPosterEmail = addJobsView.textFieldJobPosterEmail.text
//          let jobPostingDate = addJobsView.textFieldJobPostingDate.text
//        
//        if jobCompany == "" || jobDesc == "" || jobName == "" || jobPosterEmail == "" || jobPostingDate == ""{
//            //alert..
//        }else{
//            
//            let newJob = Jobs(jobCompany: jobCompany!, jobDesc: jobDesc!, jobImage: "photoURL1" , jobLikescount: "0", jobName: jobName!, jobPosterEmail: jobPosterEmail!, jobPostingDate: jobPostingDate!)
//            saveNewJobToFireStore(Jobs : newJob)
//            
//        }
//        
//    }
//    
//    func saveNewJobToFireStore(Jobs : Jobs){
//        
//        let collectionJobs = database
//            .collection("jobs")
//            .document("job2")
//            .collection("comments")
//        
//        //MARK: show progress indicator...
//        showActivityIndicator()
//        
//        do{
//            try collectionJobs.addDocument(from: Jobs, completion: {(error) in
//                if error == nil{
//                    //MARK: hide progress indicator...
//                    self.hideActivityIndicator()
//                    
//                    self.navigationController?.popViewController(animated: true)
//                }
//            })
//        }catch{
//            print("Error adding document!")
//        }
//        
//    }

    func addJob(photoURL: URL) {
        // Safely unwrap the input fields
        guard
            let jobCompany = addJobsView.textFieldJobCompany.text, !jobCompany.isEmpty,
            let jobDesc = addJobsView.textViewJobDesc.text, !jobDesc.isEmpty,
            let jobName = addJobsView.textFieldJobName.text, !jobName.isEmpty,
            let jobPosterEmail = addJobsView.textFieldJobPosterEmail.text, !jobPosterEmail.isEmpty,
            let jobPostingDate = addJobsView.textFieldJobPostingDate.text, !jobPostingDate.isEmpty
        else {
            // Show alert if any field is empty
            showAlert("Error", "Please fill in all fields")
            return
        }
        
        // Create a new job object
        let newJob = Jobs(
            jobCompany: jobCompany,
            jobDesc: jobDesc,
            jobImage: photoURL.absoluteString,
            jobLikescount: "0",
            jobName: jobName,
            jobPosterEmail: jobPosterEmail,
            jobPostingDate: jobPostingDate
        )
        
        // Save the new job to Firestore
        saveNewJobToFireStore(newJob: newJob)
    }

    func saveNewJobToFireStore(newJob: Jobs) {
        // Get the "jobs" collection
        let jobsCollection = database.collection("jobs")
        
        // Show progress indicator
        showActivityIndicator()
        
        // Add the job to Firestore
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
                    
                    // Optionally add a subcollection (e.g., "comments")
                   // self?.addDefaultComments(to: jobID)
                    
                    // Hide progress indicator and navigate back
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
