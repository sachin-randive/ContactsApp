//
//  UserService.swift
//  InterviewPrepTutorial
//
//  Created by Sachin Randive on 19/12/25.
//

import Foundation

protocol UserServiceProtocol {
    func fetchUsers() async throws -> [User]
}

struct UserService: UserServiceProtocol {
    
    private let downloader: HTTPDataDownloaderProtocol
    
    init(downloader: HTTPDataDownloaderProtocol =  HTTPDataDownloader(endpoint: .users, cache: CacheManager(filename: "users.json"))) {
        self.downloader = downloader
    }
    
    func fetchUsers() async throws -> [User] {
        return try await downloader.fetchData(as: User.self)
    }
}

struct MocUserService: UserServiceProtocol {
    
    func fetchUsers() async throws -> [User] {
        try await Task.sleep(for: .seconds(2))
        return User.mockUsers
    }
}
