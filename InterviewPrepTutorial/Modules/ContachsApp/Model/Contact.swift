//
//  Contact.swift
//  InterviewPrepTutorial
//
//  Created by Sachin Randive on 18/11/25.
//

import Foundation

struct Contact: Identifiable, Hashable {
    let id: String
    var firstName: String
    var lastName: String
    var email: String
    
    var initials: String {
        let first = firstName.prefix(1).uppercased()
        let last = lastName.prefix(1).uppercased()
        return "\(first)\(last)"
    }
    
}
