//
//  UserViewModel.swift
//  InterviewPrepTutorial
//
//  Created by Sachin Randive on 10/12/25.
//

import Foundation

@Observable
class UserViewModel {
    var users = [User]()
    
    init() {
        self.users = User.mockUsers
    }
}
