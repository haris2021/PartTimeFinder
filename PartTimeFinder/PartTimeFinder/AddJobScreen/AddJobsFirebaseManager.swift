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
    
    
//    func uploadJobPhotoToStorage()
//    {
//        var profilePhotoURL:URL?
//        
//        //MARK: Upload the profile photo if there is any...
//        if let image = pickedImage
//        {
//            if let jpegData = image.jpegData(compressionQuality: 80)
//            {
//                let storageRef = storage.reference()
//                let imagesRepo = storageRef.child("imagesJobs")
//                let imageRef = imagesRepo.child("\(NSUUID().uuidString).jpg")
//                
//                let uploadTask = imageRef.putData(jpegData, completion: {(metadata, error) in
//                    if error == nil
//                    {
//                        imageRef.downloadURL(completion: {(url, error) in
//                            if error == nil
//                            {
//                                profilePhotoURL = url
//                                self.addJob(photoURL: profilePhotoURL!)
//                            }
//                        })
//                    }
//                })
//            }
//        }else
//        {
//            print("hello")
//            // add alert here to throw when image is not found.
//            addJob(photoURL: profilePhotoURL!)
//        }
//        
//        
//    }
    
    // chatgpt - code
    
//    
//    func uploadJobPhotoToStorage() {
//        guard let image = pickedImage else {
//            print("No image to upload")
//            setDefaultPhoto();
//            // Add alert or fallback logic here if no image is available
//        }
//        
//        guard let jpegData = image.jpegData(compressionQuality: 0.8) else {
//            print("Failed to convert image to JPEG")
//            return
//        }
//        
//        let storageRef = storage.reference()
//        let imagesRepo = storageRef.child("imagesJobs")
//        let imageRef = imagesRepo.child("\(NSUUID().uuidString).jpg")
//        
//        let uploadTask = imageRef.putData(jpegData, metadata: nil) { (metadata, error) in
//            if let error = error {
//                print("Error uploading image: \(error.localizedDescription)")
//                return
//            }
//            
//            // Get the download URL
//            imageRef.downloadURL { (url, error) in
//                if let error = error {
//                    print("Error getting download URL: \(error.localizedDescription)")
//                    return
//                }
//                
//                if let photoURL = url {
//                    print("Image uploaded successfully. URL: \(photoURL)")
//                    self.addJob(photoURL: photoURL) // Pass the valid URL to your function
//                }
//            }
//        }
//        
//        uploadTask.observe(.progress) { snapshot in
//            if let progress = snapshot.progress {
//                print("Upload progress: \(progress.fractionCompleted * 100)%")
//            }
//        }
//    }
//
    
    func uploadJobPhotoToStorage() {
        // Ensure `pickedImage` is set; if not, set a default photo
        if pickedImage == nil {
            setDefaultPhoto()
        }
        
        // Safely unwrap the image after ensuring a default is set
        guard let image = pickedImage else {
            print("Failed to set default image")
            return // If no image is set even after fallback, terminate here
        }
        
        // Convert the image to JPEG data
        guard let jpegData = image.jpegData(compressionQuality: 0.8) else {
            print("Failed to convert image to JPEG")
            return
        }
        
        // Firebase storage upload logic
        let storageRef = storage.reference()
        let imagesRepo = storageRef.child("imagesJobs")
        let imageRef = imagesRepo.child("\(NSUUID().uuidString).jpg")
        
        let uploadTask = imageRef.putData(jpegData, metadata: nil) { (metadata, error) in
            if let error = error {
                print("Error uploading image: \(error.localizedDescription)")
                return
            }
            
            // Get the download URL
            imageRef.downloadURL { (url, error) in
                if let error = error {
                    print("Error getting download URL: \(error.localizedDescription)")
                    return
                }
                
                if let photoURL = url {
                    print("Image uploaded successfully. URL: \(photoURL)")
                    self.addJob(photoURL: photoURL) // Proceed with job creation logic
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
            let jobPostingDate = addJobsView.textFieldJobPostingDate.text, !jobPostingDate.isEmpty,
            let jobPostingZip = addJobsView.textFieldJobPostingZip.text, !jobPostingZip.isEmpty
        else {
            // Show alert if any field is empty
            showAlert("Error", "Please fill in all fields")
            hideActivityIndicator()
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
            jobPostingDate: jobPostingDate,
            jobPostingZip: jobPostingZip
        
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
