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
    var loadingState: ContentLoadingState = .loading
    
    private let service: UserServiceProtocol
    
    init(service: UserServiceProtocol = UserService()) {
        self.service = service
       // self.users = User.mockUsers
    }
    
    func fetchUsers() async {
        do {
            users = try await service.fetchUsers()
            self.loadingState = users.isEmpty ? .empty : .completed
        } catch {
            self.loadingState = .error(error: error)
        }
    }
    
    func refreshUsers() async {
        do {
            users = try await service.refreshUsers()
            self.loadingState = users.isEmpty ? .empty : .completed
        } catch {
            self.loadingState = .error(error: error)
        }
    }

}
