//
//  JobDescriptionViewController.swift
//  PartTimeFinder
//
//  Created by Snehal Bondre on 11/19/24.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

import MapKit
import CoreLocation

class JobDetailsViewController: UIViewController, CLLocationManagerDelegate {
    
    let jobDetailsView = JobDetailsView()
    var signedInUserEmail: String?
    var jobID: String?
    let database = Firestore.firestore()
    let childProgressView = ProgressSpinnerViewController()

    
    // location
    
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    

    override func loadView() {
//        hideActivityIndicator()  // Ensure the indicator is hidden when returning to this screen
        view = jobDetailsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchJobDetails()
        
        // Do any additional setup after loading the view.
        title = "Job Description"
        jobDetailsView.likeButton.addTarget(self, action: #selector(onLikeIconTapped), for: .touchUpInside)
        jobDetailsView.dislikeButton.addTarget(self, action: #selector(onDislikeIconTapped), for: .touchUpInside)
        jobDetailsView.commentButton.addTarget(self, action: #selector(onCommentIconTapped), for: .touchUpInside)
        jobDetailsView.chatButton.addTarget(self, action: #selector(onChatIconTapped), for: .touchUpInside)
        jobDetailsView.directionsButton.addTarget(self, action: #selector(onDirectionsIconTapped), for: .touchUpInside)
        
        // Request location permission
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
//        hideActivityIndicator()  // Ensure the indicator is hidden when returning to this screen

    }
    
    @objc func fetchJobDetails() {
        if let jID = jobID {
            let jobRef = self.database.collection("jobs")
                .document(jID)
            
            jobRef.getDocument { documentSnapshot, error in
                if let error = error {
                    print("Error fetching job details: \(error.localizedDescription)")
                    return
                }
                
                if let document = documentSnapshot, document.exists {
                    let data = document.data()
                    
                    do {
                        var job = try document.data(as: Job.self)
                        self.jobDetailsView.companyNameLabel.text = job.jobCompany
                        self.jobDetailsView.jobTitleLabel.text = job.jobName
                        //  jobDetailsView.locationLabel.text = job.location
                        self.jobDetailsView.descriptionLabel.text = job.jobDesc
                        self.jobDetailsView.postingDateLabel.text = job.jobPostingDate
                        self.jobDetailsView.likeCounterLabel.text = "\(job.jobLikedBy.count)"
                        self.jobDetailsView.dislikeCounterLabel.text = "\(job.jobDislikedBy.count)"
                        
                        if let imageURL = URL(string: job.jobImage) {
//                            cell.jobImageView.loadRemoteImage(from: imageURL)
                            self.jobDetailsView.jobImageView.loadRemoteImage(from: imageURL)

                        }
                        
                        
                        if let userEmail = self.signedInUserEmail {
                            print("1")
                            if (job.jobLikedBy.contains(userEmail)) {
                                print("2")
                                self.jobDetailsView.likeButton.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .normal)
                            }
                            if (job.jobDislikedBy.contains(userEmail)) {
                                self.jobDetailsView.dislikeButton.setImage(UIImage(systemName: "hand.thumbsdown.fill"), for: .normal)
                            }
                        }
                        
                    }catch {
                        print("Error decoding job data: \(error)")
                    }
                    
                } else {
                    print("Document does not exist.")
                }
            }
        }
    }
    
    @objc func onLikeIconTapped(){
        manageLikeCounter()
    }
    
    @objc func onDislikeIconTapped(){
        manageDislikeCounter()
    }
    
    @objc func onCommentIconTapped(){
        manageComments()
    }
    
    @objc func onChatIconTapped(){
        //        manageChat()
    }
    
    @objc func onDirectionsIconTapped(){
        manageDirections()
//        showActivityIndicator()
    }
    
}
