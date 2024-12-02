//
//  JobsTableViewManager.swift
//  PartTimeFinder
//
//  Created by Haris Gunasekaran on 11/24/24.
//

import Foundation
import UIKit

//extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//            return 120 // Your fixed row height
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return jobsList.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.tableViewJobsID, for: indexPath) as! JobsTableViewCell
//        cell.labelJobName.text = jobsList[indexPath.row].jobName
//        cell.labelJobCompany.text = jobsList[indexPath.row].jobCompany
//
//        let imageURLString = jobsList[indexPath.row].jobImage
//        if let imageURL = URL(string: imageURLString) {
//               // If it's a valid URL, load the image
//               cell.jobImageView.loadRemoteImage(from: imageURL)
//           } else {
//               // If the URL is invalid, set a fallback image
//               cell.jobImageView.image = UIImage(named: "defaultImage")
//           }
//        
//        return cell
//    }
//}

// new code

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120 // Fixed row height
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Show filtered results if search is active, else show the full list
        return isSearchActive ? filteredJobsList.count : jobsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.tableViewJobsID, for: indexPath) as! JobsTableViewCell
        
        // Get the job from the filtered list or the full list
        let job = isSearchActive ? filteredJobsList[indexPath.row] : jobsList[indexPath.row]
        
        cell.labelJobName.text = job.jobName
        cell.labelJobCompany.text = job.jobCompany
        
        // Handle image loading
        if let imageURL = URL(string: job.jobImage) {
            cell.jobImageView.loadRemoteImage(from: imageURL)
        } else {
            cell.jobImageView.image = UIImage(named: "defaultImage")
        }
        
        return cell
    }
    
    // MARK: - Table View Delegate Method (Handle Row Selection)
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           // Deselect the row (optional)
//           tableView.deselectRow(at: indexPath, animated: true)
//           
//           // Get the selected job
//           let selectedJob = isSearchActive ? filteredJobsList[indexPath.row] : jobsList[indexPath.row]
//           
//           // Create an instance of the JobDetailViewController
           let jobDetailVC = JobDetailsViewController()
//           
//           // Pass the selected job data to the detail view controller
//           jobDetailVC.job = selectedJob
//           
//           // Push the detail view controller onto the navigation stack
           navigationController?.pushViewController(jobDetailVC, animated: true)
       }
    
    
}

