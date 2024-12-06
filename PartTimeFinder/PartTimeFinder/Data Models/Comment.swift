//
//  Comment.swift
//  PartTimeFinder
//
//  Created by Rahul Chandak on 12/4/24.
//

import Foundation
import FirebaseFirestoreSwift

struct Comment: Codable{
    @DocumentID var id: String?
    var commenterName: String
    var commentContent : String
    var time: String
    
    init(commenterName: String, commentContent: String, time: String) {
        self.commenterName = commenterName
        self.commentContent = commentContent
        self.time = time
    }
}
