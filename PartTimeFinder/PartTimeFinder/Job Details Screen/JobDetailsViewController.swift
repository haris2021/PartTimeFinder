//
//  JobDescriptionViewController.swift
//  PartTimeFinder
//
//  Created by Snehal Bondre on 11/19/24.
//

import UIKit

import MapKit
import CoreLocation


class JobDetailsViewController: UIViewController, CLLocationManagerDelegate  {
    

//    var myMapView: MKMapView!
    
    let jobDetailsView = JobDetailsView()
    
    // location
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation?
        
        
    override func loadView() {
        view = jobDetailsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Job Description"
        
        
        // Create the MKMapView programmatically
//        myMapView = MKMapView()
//        
//        // Set up its frame or constraints (to fit the whole view in this case)
//        myMapView.frame = view.bounds
//        myMapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        
//        // Add the map view as a subview of the main view
//        view.addSubview(myMapView)

        
        
        
        
        // Request location permission
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
//        locationManager.requestAlwaysAuthorization()
    

        
        // Do any additional setup after loading the view.
//        jobDetailsView.buttonDummy.addTarget(self, #selector(didTapNavigate), for: .touchUpInside)
        jobDetailsView.buttonDummy.addTarget(self, action: #selector(didTapNavigate), for: .touchUpInside) // Use action: parameter

        
    }
    
    
    @objc func didTapNavigate() {
        // Specify the zip code
        let zipCode = "02120"
        showDirectionsToZipCode(zipCode: zipCode)
    }
    
    // CLLocationManager Delegate methods
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let location = locations.first {
//            currentLocation = location
//        }
        
//        currentLocation = locations.first
        
        guard let location = locations.first else { return }

            // Check if the accuracy is good enough
            if location.horizontalAccuracy < 100 {
                currentLocation = location
                print("Current location: \(currentLocation?.coordinate.latitude ?? 0), \(currentLocation?.coordinate.longitude ?? 0)")
                // Stop further updates to save battery
                locationManager.stopUpdatingLocation()
            }

    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
    
}


extension JobDetailsViewController {
    
    func showDirectionsToZipCode(zipCode: String) {
        // 1. Get the user's current location
        guard let currentLocation = self.currentLocation else { return }
        print("currentLocation" , currentLocation)
        
        // 2. Get the coordinates for the zip code (02120 in this case)
        getCoordinates(from: zipCode) { targetLocation in
            guard let targetLocation = targetLocation else {
                print("Failed to get target location")
                return
            }
        
            print("targetLocation" , targetLocation)
        
            // 3. Create MKMapItems for the current and target locations
            let sourcePlacemark = MKPlacemark(coordinate: currentLocation.coordinate)
            let destinationPlacemark = MKPlacemark(coordinate: targetLocation)
            
            let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
            let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
            
            // 4. Open Apple Maps and show directions
            let directionsRequest = MKDirections.Request()
            directionsRequest.source = sourceMapItem
            directionsRequest.destination = destinationMapItem
            directionsRequest.transportType = .automobile  // Can be changed to .walking, .transit, etc.
            
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
