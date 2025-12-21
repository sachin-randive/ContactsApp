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
   // private let urlString = "https://fakestoreapi.com/users"
    private let cache = CacheManager(filename: "users.json")
    private let refreshInterval: TimeInterval = 60 * 10 // 10 Min
    private var lastFetchedTime: Date?
    private let downloader: HTTPDataDownloaderProtocol
    
    init(downloader: HTTPDataDownloaderProtocol =  HTTPDataDownloader()) {
        self.downloader = downloader
        getLastFetchedTime()
    }
    
    func fetchUsers() async throws -> [User] {
        if !needRefresh {
            print(">>> Fetching products from cache")
            return try cache.getData(as: User.self)
        }
        
        print("Getting users from API")
        let users = try await downloader.fetchData(as: User.self, from: .users)
        saveLastFetchedTime()
        cache.saveData(users)
        return users
    }
    
    private func validateResponse(_ response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }
        guard httpResponse.statusCode == 200 else {
            throw APIError.invalidResponse
        }
    }
    
    private func saveLastFetchedTime() {
        UserDefaults.standard.set(Date(), forKey: "lastFetchedTime")
    }
    
    private mutating func getLastFetchedTime() {
        lastFetchedTime = UserDefaults.standard.object(forKey: "lastFetchedTime") as? Date
    }
    private var needRefresh: Bool {
        guard let lastFetchedTime = lastFetchedTime else { return true }
        print("Last fetched time: \(lastFetchedTime)")
        print("Time since last fetch: \(Date().timeIntervalSince(lastFetchedTime))")
        return Date().timeIntervalSince(lastFetchedTime) > refreshInterval
    }
}

struct MocUserService: UserServiceProtocol {
    
    func fetchUsers() async throws -> [User] {
        try await Task.sleep(for: .seconds(2))
        return User.mockUsers
    }
}
