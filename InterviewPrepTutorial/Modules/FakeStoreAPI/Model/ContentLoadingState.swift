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
