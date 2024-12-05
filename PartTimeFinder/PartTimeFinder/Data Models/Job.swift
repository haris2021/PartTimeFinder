//
//  User.swift
//  PartTimeFinder
//
//  Created by Snehal Bondre on 11/23/24.
//

import Foundation
import FirebaseFirestoreSwift

struct Job: Codable{
    @DocumentID var id: String?
    var jobName: String
    var jobCompany: String
    var jobDesc: String
    var jobImage: String
    var jobPosterLocation: String
    var jobPostingDate: String
    var jobPostingZip: String
    var jobLikedBy: [String]
    var jobDislikedBy: [String]
    
    init(jobName: String, jobCompany: String, jobDesc: String, jobImage: String,
         jobPosterLocation: String, jobPostingDate: String, jobPostingZip: String, jobLikedBy: [String] = [],
         jobDislikedBy: [String] = []) {
        self.jobName = jobName
        self.jobCompany = jobCompany
        self.jobDesc = jobDesc
        self.jobImage = jobImage
        self.jobPosterLocation = jobPosterLocation
        self.jobPostingDate = jobPostingDate
        self.jobPostingZip = jobPostingZip
        self.jobLikedBy = jobLikedBy
        self.jobDislikedBy = jobDislikedBy
    }
}
