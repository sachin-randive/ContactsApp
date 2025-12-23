//
//  URLBuilder.swift
//  InterviewPrepTutorial
//
//  Created by Sachin Randive on 23/12/25.
//
import Foundation

struct URLBuilder {
    private let endpoint: FakeStoreAPIEndpoint
    init(endpoint: FakeStoreAPIEndpoint) {
        self.endpoint = endpoint
    }
    
    func buildURL() throws -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "fakestoreapi.com"
        components.path = endpoint.path
        guard let url = components.url else { throw APIError.invalidURL }
        return url
    }
}
