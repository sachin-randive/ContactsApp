//
//  QuizModel.swift
//  InterviewPrepTutorial
//
//  Created by Sachin Randive on 20/11/25.
//

import Foundation

struct QuizModel {
    var questions: [Question]
}

struct Question: Identifiable {
    let id = UUID().uuidString
    let prompt: String
    let options: [String]
    let answer: String
    
}
