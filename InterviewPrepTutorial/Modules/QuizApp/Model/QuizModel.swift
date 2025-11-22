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
extension QuizModel {
    static let mockQuiz: QuizModel = .init(questions: Question.mockQuestions)
}

extension Question {
    static let mockQuestions: [Question] = [ .init(
        prompt: "What is the main function of a ViewModel in MVVM architecture?",
        options: ["Handle UI rendering directly",
                 "Manage data and business logic for the view",
                 "Store user preferences",
                  "Perform network requests directly"],
        answer: "Manage data and business logic for the view"),
                                          .init(
        prompt: "What is the primary language used for iOS development?",
        options: ["Python", "Java", "Swift", "Kotlin"],
        answer: "Swift"),
                                          .init(
        prompt: "Which lifecycle method is called when a SwiftUI view appears on the screen?",
        options: ["onAppear", "onTapGesture", "onDisappear", "viewDidLoad"],
        answer: "onAppear"),
                                          .init(
        prompt: "Which tool is used to design user interfaces for iOS apps?",
        options: ["Xcode", "Android Studio", "IntelliJ IDEA", "Eclipse"],
        answer: "Xcode"),
                                          .init(
        prompt: "What does the `@State` property wrapper in SwiftUI do?",
        options: ["Manages the state of an ObservableObject", "Marks a variable as immutable", "Allows the view to own and react to changes in a variable's value", "Updates the view's layout when the screen rotates"],
        answer: "Allows the view to own and react to changes in a variable's value")
                                          ]
    
}
