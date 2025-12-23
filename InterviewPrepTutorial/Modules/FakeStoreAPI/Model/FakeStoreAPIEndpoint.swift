//
//  FakeStoreAPIEndpoint.swift
//  InterviewPrepTutorial
//
//  Created by Sachin Randive on 23/12/25.
//

import Foundation

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
