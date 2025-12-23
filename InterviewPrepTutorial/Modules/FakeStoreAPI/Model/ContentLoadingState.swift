//
//  ContentLoadingState.swift
//  InterviewPrepTutorial
//
//  Created by Sachin Randive on 11/12/25.
//

import Foundation

enum ContentLoadingState {
    case loading
    case empty
    case error(error: Error)
    case completed
}

extension ContentLoadingState: Equatable {
    static func == (lhs: ContentLoadingState, rhs: ContentLoadingState) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading), (.empty, .empty), (.completed, .completed):
            return true
        case (.error(let lhsError), .error(let rhsError)):
            return lhsError.localizedDescription == rhsError.localizedDescription
        default :
            return false
        }
    }
}
