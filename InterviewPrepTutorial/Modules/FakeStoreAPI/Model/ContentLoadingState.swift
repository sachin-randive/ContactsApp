//
//  ContentLoadingState.swift
//  InterviewPrepTutorial
//
//  Created by Sachin Randive on 11/12/25.
//

import Foundation

enum ContentLoadingState<T: Codable> {
    case loading
    case empty
    case error(error: Error)
    case completed(data: [T])
}
