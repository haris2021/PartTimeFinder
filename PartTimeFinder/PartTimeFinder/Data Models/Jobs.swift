//
//  Jobs.swift
//  PartTimeFinder
//
//  Created by Haris Gunasekaran on 11/24/24.
//

import Foundation
import FirebaseFirestoreSwift

struct Jobs: Codable{
    @DocumentID var id: String?
    var jobCompany: String
    var jobDesc: String
    var jobImage: String
    var jobLikescount: String
    var jobName: String
    var jobPosterEmail : String
    var jobPostingDate: String
    
    init(jobCompany: String, jobDesc: String,jobImage: String,jobLikescount: String, jobName: String,jobPosterEmail : String,jobPostingDate: String) {
        self.jobCompany = jobCompany
        self.jobDesc = jobDesc
        self.jobImage = jobImage
        self.jobLikescount = jobLikescount
        self.jobName = jobName
        self.jobPosterEmail = jobPosterEmail
        self.jobPostingDate = jobPostingDate
    }
}
