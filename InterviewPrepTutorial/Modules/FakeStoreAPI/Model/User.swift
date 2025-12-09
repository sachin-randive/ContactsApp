//
//  User.swift
//  InterviewPrepTutorial
//
//  Created by Sachin Randive on 09/12/25.
//

import Foundation
/*
 [
 {
 "id": 0,
 "username": "string",
 "email": "string",
 "password": "string"
 }
 ]
 */

struct User: Identifiable, Codable {
    var id: Int
    var username: String
    var email: String
}
