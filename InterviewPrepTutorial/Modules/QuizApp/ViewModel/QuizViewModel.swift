//
//  QuizViewModel.swift
//  InterviewPrepTutorial
//
//  Created by Sachin Randive on 20/11/25.
//

import Foundation

@Observable
class QuizViewModel {
    
    let quiz: QuizModel
    var currentQuestionIndex = 0
    var showQuizCompletion = false
    var numCurrectAnswers = 0
    var numIncorrectAnswers: Int {
        return quiz.questions.count - numCurrectAnswers
    }
    var quizScore: Double {
        return Double(numCurrectAnswers) / Double(quiz.questions.count) * 100
    }
    
    var currentQuestion: Question {
        return quiz.questions[currentQuestionIndex]
    }
    
    init() {
        self.quiz = QuizModel.mockQuiz
    }
    
    func submitAnswer(_ answer: String) {
        if answer == currentQuestion.answer {
            numCurrectAnswers += 1
        }
        
        if currentQuestionIndex < quiz.questions.count - 1 {
            currentQuestionIndex += 1
        } else {
           showQuizCompletion = true
        }
    }
    
    func reStartQuiz() {
        currentQuestionIndex = 0
        showQuizCompletion = false
        numCurrectAnswers = 0
        
    }
}
