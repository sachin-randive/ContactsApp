//
//  MocUserService.swift
//  InterviewPrepTutorial
//
//  Created by Sachin Randive on 23/12/25.
//
import Foundation

struct MocUserService: UserServiceProtocol {
    func refreshUsers() async throws -> [User] {
        return User.mockUsers
    }
    
    func fetchUsers() async throws -> [User] {
        try await Task.sleep(for: .seconds(2))
        return User.mockUsers
    }
}

