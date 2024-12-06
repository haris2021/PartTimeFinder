//
//  ActionsManager.swift
//  PartTimeFinder
//
//  Created by Rahul Chandak on 11/24/24.
//

import UIKit
//import Foundation
import FirebaseAuth
import FirebaseStorage

import MapKit
import CoreLocation

extension JobDetailsViewController {
    
    func manageLikeCounter() {
        if let jID = jobID {
            let jobRef = self.database.collection("jobs")
                .document(jID)
            
            jobRef.getDocument { documentSnapshot, error in
                if let error = error {
                    print("Error fetching document: \(error.localizedDescription)")
                    return
                }
                if let document = documentSnapshot, document.exists {
                    let data = document.data()
                    
                    do {
                        var job = try document.data(as: Job.self)
                        if let signedInUserEmail = self.currentUser?.email {
                            print(signedInUserEmail)
                            if let index = job.jobLikedBy.firstIndex(of: signedInUserEmail)  {
                                job.jobLikedBy.remove(at: index)
                                if let currentLikes = Int(self.jobDetailsView.likeCounterLabel.text ?? "0") {
                                    self.jobDetailsView.likeCounterLabel.text = "\(currentLikes - 1)"
                                    self.jobDetailsView.likeButton.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
                                }
                            } else {
                                job.jobLikedBy.append(signedInUserEmail)                                    // Add to likes
                                if let index = job.jobDislikedBy.firstIndex(of: signedInUserEmail)  {       // Remove from dislikes if present
                                    job.jobDislikedBy.remove(at: index)
                                    if let currentDislikes = Int(self.jobDetailsView.dislikeCounterLabel.text ?? "0") {
                                        self.jobDetailsView.dislikeCounterLabel.text = "\(currentDislikes - 1)"
                                        self.jobDetailsView.dislikeButton.setImage(UIImage(systemName: "hand.thumbsdown"), for: .normal)
                                    }
                                }
                                if let currentLikes = Int(self.jobDetailsView.likeCounterLabel.text ?? "0") {
                                    self.jobDetailsView.likeCounterLabel.text = "\(currentLikes + 1)"
                                    self.jobDetailsView.likeButton.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .normal)
                                }
                            }
                        }
                        
                        do {
                            try jobRef.setData(from: job) { error in
                                if let error = error {
                                    print("Error updating job: \(error.localizedDescription)")
                                } else {
                                    print("Successfully updated job with new like count.")
                                }
                            }
                        }
                        
                    }catch {
                        print("Error decoding job data: \(error)")
                    }
                }
            }
        }
    }
    
    
    func manageDislikeCounter(){
        if let jID = jobID {
            let jobRef = self.database.collection("jobs")
                .document(jID)
            
            jobRef.getDocument { documentSnapshot, error in
                if let error = error {
                    print("Error fetching document: \(error.localizedDescription)")
                    return
                }
                if let document = documentSnapshot, document.exists {
                    let data = document.data()
                    
                    do {
                        var job = try document.data(as: Job.self)
                        if let signedInUserEmail = self.currentUser?.email {
                            if let index = job.jobDislikedBy.firstIndex(of: signedInUserEmail) {
                                job.jobDislikedBy.remove(at: index)
                                if let currentDislikes = Int(self.jobDetailsView.dislikeCounterLabel.text ?? "0") {
                                    self.jobDetailsView.dislikeCounterLabel.text = "\(currentDislikes - 1)"
                                    self.jobDetailsView.dislikeButton.setImage(UIImage(systemName: "hand.thumbsdown"), for: .normal)
                                }
                            } else {
                                job.jobDislikedBy.append(signedInUserEmail)                              // Add to dislikes
                                if let index = job.jobLikedBy.firstIndex(of: signedInUserEmail)  {       // Remove from likes if present
                                    job.jobLikedBy.remove(at: index)
                                    if let currentLikes = Int(self.jobDetailsView.likeCounterLabel.text ?? "0") {
                                        self.jobDetailsView.likeCounterLabel.text = "\(currentLikes - 1)"
                                        self.jobDetailsView.likeButton.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
                                    }
                                }
                                if let currentDislikes = Int(self.jobDetailsView.dislikeCounterLabel.text ?? "0") {
                                    self.jobDetailsView.dislikeCounterLabel.text = "\(currentDislikes + 1)"
                                    self.jobDetailsView.dislikeButton.setImage(UIImage(systemName: "hand.thumbsdown.fill"), for: .normal)
                                }
                            }
                        }
                        
                        do {
                            try jobRef.setData(from: job) { error in
                                if let error = error {
                                    print("Error updating job: \(error.localizedDescription)")
                                } else {
                                    print("Successfully updated job with new like count.")
                                }
                            }
                        }
                        
                    }catch {
                        print("Error decoding job data: \(error)")
                    }
                }
            }
        }
    }
    
    func manageComments() {
        let commentsScreen = CommentsViewController()
        commentsScreen.jobID = jobID
        commentsScreen.commenterName = currentUser?.displayName;
        self.navigationController?.pushViewController(commentsScreen, animated: true)
    }
    
    func manageChat() {
        Utils.throwAlert(on: self, title: "Feature Coming Soon", message: "This feature is currently under development. Stay tuned for updates!")
    }
    
    func manageDirections() {
        // Specify the zip code
        
        if let zipCode = jobzipcode{
            showDirectionsToZipCode(zipCode: zipCode)
        }
    }
        
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.first else { return }
        // Check if the accuracy is good enough
        if location.horizontalAccuracy < 100 {
            currentLocation = location
            print("Current location: \(currentLocation?.coordinate.latitude ?? 0), \(currentLocation?.coordinate.longitude ?? 0)")
            
            locationManager.stopUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
    
    func showDirectionsToZipCode(zipCode: String) {
        guard let currentLocation = self.currentLocation else { return }
        print("currentLocation" , currentLocation)
        
        getCoordinates(from: zipCode) { targetLocation in
            guard let targetLocation = targetLocation else {
                print("Failed to get target location")
                return
            }
            
            print("targetLocation" , targetLocation)
            
            let sourcePlacemark = MKPlacemark(coordinate: currentLocation.coordinate)
            let destinationPlacemark = MKPlacemark(coordinate: targetLocation)
            
            let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
            let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
            
            let directionsRequest = MKDirections.Request()
            directionsRequest.source = sourceMapItem
            directionsRequest.destination = destinationMapItem
            directionsRequest.transportType = .automobile
            
            let directions = MKDirections(request: directionsRequest)
            directions.calculate { response, error in
                if let error = error {
                    print("Error calculating directions: \(error.localizedDescription)")
                    return
                }
                
                guard let route = response?.routes.first else {
                    print("No routes found")
                    return
                }
                
                // 5. Show directions on the map
                MKMapItem.openMaps(with: [sourceMapItem, destinationMapItem], launchOptions: [
                    MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving // Change to walking, etc.
                ])
            }
        }
    }
    
    func getCoordinates(from zipCode: String, completion: @escaping (CLLocationCoordinate2D?) -> Void) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(zipCode) { (placemarks, error) in
            if let error = error {
                print("Error geocoding zip code: \(error.localizedDescription)")
                completion(nil)
            } else if let placemark = placemarks?.first,
                      let location = placemark.location {
                completion(location.coordinate)
            } else {
                completion(nil)
            }
        }
    }
}
