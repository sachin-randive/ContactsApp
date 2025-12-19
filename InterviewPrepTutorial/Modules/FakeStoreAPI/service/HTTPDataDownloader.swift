//
//  HTTPDataDownloader.swift
//  InterviewPrepTutorial
//
//  Created by Sachin Randive on 19/12/25.
//

import Foundation

protocol HTTPDataDownloaderProtocol {
    func fetchData<T: Codable>(as type: T.Type, from endpoint: FakeStoreAPIEndpoint) async throws-> [T]
}

struct HTTPDataDownloader: HTTPDataDownloaderProtocol {
    func fetchData<T: Codable>(as type: T.Type, from endpoint: FakeStoreAPIEndpoint) async throws -> [T] {
        let url = try buildURL(endpoint: endpoint)
        let (data, reponse) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode([T].self, from: data)
        return result
    }
    
    private func buildURL(endpoint: FakeStoreAPIEndpoint) throws -> URL {
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

