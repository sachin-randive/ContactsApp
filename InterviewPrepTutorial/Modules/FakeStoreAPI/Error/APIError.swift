//
//  APIError.swift
//  InterviewPrepTutorial
//
//  Created by Sachin Randive on 13/12/25.
//

import Foundation

enum APIError: Error {
    case invalidResponse
    case invalidData
    case invalidURL
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidResponse:
            return "Invalid API response"
        case .invalidData:
            return "Invalid data received from API"
        case .invalidURL:
            return "Invalid URL provided"
        }
    }
}
