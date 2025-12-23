//
//  Untitled.swift
//  InterviewPrepTutorial
//
//  Created by Sachin Randive on 23/12/25.
//
import Foundation

struct HTTPResponceValidator {
    func validateResponse(_ response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }
        guard httpResponse.statusCode == 200 else {
            throw APIError.invalidResponse
        }
    }
}
