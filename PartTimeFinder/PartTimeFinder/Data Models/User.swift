//
//  User.swift
//  PartTimeFinder
//
//  Created by Snehal Bondre on 11/23/24.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Codable{
    @DocumentID var id: String?
    var name: String
    var email: String
    var phoneNum: String
    
    init(name: String, email: String, phoneNum: String) {
        self.name = name
        self.email = email
        self.phoneNum = phoneNum
    }
}
