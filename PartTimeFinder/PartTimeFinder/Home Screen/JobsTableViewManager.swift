//
//  JobsTableViewManager.swift
//  PartTimeFinder
//
//  Created by Haris Gunasekaran on 11/24/24.
//

import Foundation
import UIKit

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

        // Set the text labels
        cell.labelJobName.text = job.jobName
        cell.labelJobCompany.text = job.jobCompany

        // Handle image loading
        if let imageURL = URL(string: job.jobImage) {
            // Set the identifier to track which image should be loaded
            cell.jobImageView.accessibilityIdentifier = imageURL.absoluteString
            cell.jobImageView.loadRemoteImage(from: imageURL)
        } else {
            cell.jobImageView.image = UIImage(named: "defaultImage")
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let job = isSearchActive ? filteredJobsList[indexPath.row] : jobsList[indexPath.row]
        
        let jobDetails = JobDetailsViewController()
        jobDetails.currentUser = currentUser
        jobDetails.jobID = job.id
        self.navigationController?.pushViewController(jobDetails, animated: true)
    }
}

