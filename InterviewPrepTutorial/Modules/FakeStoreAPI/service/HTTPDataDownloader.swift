//
//  HTTPDataDownloader.swift
//  InterviewPrepTutorial
//
//  Created by Sachin Randive on 19/12/25.
//

import Foundation

protocol HTTPDataDownloaderProtocol {
    func fetchData<T: Codable>(as type: T.Type) async throws-> [T]
    func refreshData<T: Codable>(as type: T.Type) async throws-> [T]
}

class HTTPDataDownloader: HTTPDataDownloaderProtocol {
    private let cache: CacheManager?
    private let endpoint: FakeStoreAPIEndpoint
    private let refreshInterval: TimeInterval = 60 * 10 // 10 Min
    private var lastFetchedTime: Date?
    private var userDefaultsLastFetchedKey: String
    init(endpoint: FakeStoreAPIEndpoint,cache: CacheManager? = nil) {
        self.endpoint = endpoint
        self.cache = cache
        self.userDefaultsLastFetchedKey = endpoint.path
        self.getLastFetchedTime()
    }
    
    func fetchData<T: Codable>(as type: T.Type) async throws -> [T] {
        if !needRefresh, let cache {
            print(">>> Fetching products from cache")
            return try cache.getData(as:type)
        }
        
        print("Getting users from API")
        let url = try buildURL()
        let (data, reponse) = try await URLSession.shared.data(from: url)
        try validateResponse(reponse)
        let result = try JSONDecoder().decode([T].self, from: data)
        if let cache {
            saveLastFetchedTime()
            cache.saveData(result)
        }
        return result
    }
    
    func refreshData<T: Codable>(as type: T.Type) async throws-> [T] {
        print("refreshing data...")
        lastFetchedTime = nil
        cache?.invalidateCache()
        return try await fetchData(as: type)
    }
    
    private func saveLastFetchedTime() {
        UserDefaults.standard.set(Date(), forKey: userDefaultsLastFetchedKey)
    }
    
    private func getLastFetchedTime() {
        lastFetchedTime = UserDefaults.standard.object(forKey: userDefaultsLastFetchedKey) as? Date
    }
    private var needRefresh: Bool {
        guard let lastFetchedTime = lastFetchedTime else { return true }
        print("Last fetched time: \(lastFetchedTime)")
        print("Time since last fetch: \(Date().timeIntervalSince(lastFetchedTime))")
        return Date().timeIntervalSince(lastFetchedTime) > refreshInterval
    }
    
    private func buildURL() throws -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "fakestoreapi.com"
        components.path = endpoint.path
        guard let url = components.url else { throw APIError.invalidURL }
        return url
    }
    
    private func validateResponse(_ response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }
        guard httpResponse.statusCode == 200 else {
            throw APIError.invalidResponse
        }
    }
}

enum FakeStoreAPIEndpoint {
    case products
    case users
    
    var path: String {
        switch self {
        case .products:
            return "/products"
        case .users:
            return "/users"
        }
    }
}

