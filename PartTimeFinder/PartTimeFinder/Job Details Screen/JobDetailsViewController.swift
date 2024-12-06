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
    
    var jobID: String?
    let database = Firestore.firestore()
    var currentUser:FirebaseAuth.User?
    let childProgressView = ProgressSpinnerViewController()
    
    // location
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var jobzipcode: String?
    
    override func loadView() {
        view = jobDetailsView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchJobDetails() // Refresh job details, including comment count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchJobDetails()
        
        var signedInUserEmail = currentUser?.email
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
        
    }
    
    @objc func fetchJobDetails() {
        if let jID = jobID {
            let jobRef = self.database.collection("jobs").document(jID)
            
            // Fetch job details
            jobRef.getDocument { documentSnapshot, error in
                if let error = error {
                    print("Error fetching job details: \(error.localizedDescription)")
                    return
                }
                
                if let document = documentSnapshot, document.exists {
                    do {
                        let job = try document.data(as: Job.self)
                        self.jobDetailsView.companyNameLabel.text = job.jobCompany
                        self.jobDetailsView.jobTitleLabel.text = job.jobName
                        self.jobDetailsView.descriptionLabel.text = job.jobDesc
                        self.jobDetailsView.locationLabel.text = job.jobPosterLocation
                        self.jobDetailsView.postingDateLabel.text = job.jobPostingDate
                        self.jobDetailsView.likeCounterLabel.text = "\(job.jobLikedBy.count)"
                        self.jobDetailsView.dislikeCounterLabel.text = "\(job.jobDislikedBy.count)"
                        self.jobzipcode = job.jobPostingZip
                        
                        if let imageURL = URL(string: job.jobImage) {
                        //                            cell.jobImageView.loadRemoteImage(from: imageURL)
                                                    self.jobDetailsView.jobImageView.loadRemoteImage(from: imageURL)

                                                }
                        
                        if let userEmail = self.currentUser?.email {
                            if job.jobLikedBy.contains(userEmail) {
                                self.jobDetailsView.likeButton.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .normal)
                            }
                            if job.jobDislikedBy.contains(userEmail) {
                                self.jobDetailsView.dislikeButton.setImage(UIImage(systemName: "hand.thumbsdown.fill"), for: .normal)
                            }
                        }
                    } catch {
                        print("Error decoding job data: \(error)")
                    }
                } else {
                    print("Document does not exist.")
                }
            }
             
            // Fetch the number of comments
            let commentsRef = jobRef.collection("comments")
            commentsRef.getDocuments { snapshot, error in
                if let error = error {
                    print("Error fetching comments: \(error.localizedDescription)")
                    self.jobDetailsView.commentCounterLabel.text = "0"
                    return
                }
                
                if let snapshot = snapshot {
                    let commentCount = snapshot.documents.count
                    self.jobDetailsView.commentCounterLabel.text = "\(commentCount)"
                } else {
                    self.jobDetailsView.commentCounterLabel.text = "0"
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
        manageChat()
    }
    
    @objc func onDirectionsIconTapped(){
        manageDirections()
    }
    
}
