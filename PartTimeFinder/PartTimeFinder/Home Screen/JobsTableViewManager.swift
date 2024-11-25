//
//  JobsTableViewManager.swift
//  PartTimeFinder
//
//  Created by Haris Gunasekaran on 11/24/24.
//

import Foundation
import UIKit

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 120 // Your fixed row height
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.tableViewJobsID, for: indexPath) as! JobsTableViewCell
        cell.labelJobName.text = jobsList[indexPath.row].jobName
        cell.labelJobCompany.text = jobsList[indexPath.row].jobCompany
        
//        if let imageURL = jobsList[indexPath.row].jobImage {
//                cell.jobImageView.loadRemoteImage(from: imageURL)
//        }

        // Convert the String URL to a URL object, and load the image if it's valid
//           if let imageURLString = jobsList[indexPath.row].jobImage,
//              let imageURL = URL(string: imageURLString) {
//               cell.jobImageView.loadRemoteImage(from: imageURL)
//           }
        
        // Convert the String to URL safely
        // And use this String to fetch Image from separate function
        
        
        let imageURLString = jobsList[indexPath.row].jobImage
        if let imageURL = URL(string: imageURLString) {
               // If it's a valid URL, load the image
               cell.jobImageView.loadRemoteImage(from: imageURL)
           } else {
               // If the URL is invalid, set a fallback image
               cell.jobImageView.image = UIImage(named: "defaultImage")
           }
        
        return cell
    }
}
