//
//  CacheManager.swift
//  InterviewPrepTutorial
//
//  Created by Sachin Randive on 21/12/25.
//

import Foundation

struct CacheManager: CacheManagerProtocol {
    let filename: String
    
    init(filename: String) {
        self.filename = filename
    }
}
