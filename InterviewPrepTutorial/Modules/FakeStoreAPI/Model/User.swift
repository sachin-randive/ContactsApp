//
//  User.swift
//  InterviewPrepTutorial
//
//  Created by Sachin Randive on 09/12/25.
//

import Foundation

struct User: Identifiable, Codable {
    var id: Int
    var username: String
    var email: String
}

extension User {
    static let mockUsers: [User] = [
        User(
            id: 1,
            username: "sachin_r",
            email: "sachin.r@example.com"
        ),
        User(
            id: 2,
            username: "tech_guru",
            email: "techguru@example.com"
        ),
        User(
            id: 3,
            username: "swift_master",
            email: "swiftmaster@example.com"
        ),
        User(
            id: 4,
            username: "design_pro",
            email: "designpro@example.com"
        ),
        User(
            id: 5,
            username: "coder_life",
            email: "coderlife@example.com"
        )
    ]
}
