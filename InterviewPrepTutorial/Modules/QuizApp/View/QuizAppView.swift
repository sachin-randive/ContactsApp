//
//  QuizAppView.swift
//  InterviewPrepTutorial
//
//  Created by Sachin Randive on 20/11/25.
//

import SwiftUI

struct QuizAppView: View {
    @State private var viewModel = QuizViewModel()
    @State private var selectedAnswer: String?
    @State private var showResultsView = false
    
    var body: some View {
        VStack {
            if viewModel.showQuizCompletion {
//                Text("Quiz Complete!")
//                Button("Restart Quiz") {
//                    viewModel.reStartQuiz()
//                }
                QuizCompletionView(showResults: $showResultsView)
                    .environment(viewModel)
                
            } else {
                VStack(alignment: .leading, spacing: 8) {
                    Text(viewModel.currentQuestion.prompt)
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text("Select an answer below")
                        .foregroundStyle(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                //.frame(height: 120)
                .multilineTextAlignment(.leading)
                .padding()
                
                VStack(alignment: .leading) {
                    Text("Question \(viewModel.currentQuestionIndex + 1) / \(viewModel.quiz.questions.count)")
                        .font(.subheadline)
                        .padding(.horizontal)
                    Divider()
                }
                .padding(.bottom)
                
                VStack(spacing: 15) {
                    
                    ForEach(viewModel.currentQuestion.options, id: \.self) { choice in
                        Button {
                            self.selectedAnswer = choice
                        } label: {
                            Text(choice)
                                .font(.subheadline)
                                .padding(.horizontal)
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundStyle(.black)
                                .frame(width: 360, height: 60, alignment: .leading)
                            
                                .clipShape(.rect(cornerRadius: 10))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(
                                            self.selectedAnswer == choice ? .blue : .gray,
                                            lineWidth: self.selectedAnswer == choice ? 3 : 1)
                                }
                        }
                    }
                    
                }
                Spacer()
                VStack {
                    Button(action: {
                        guard let selectedAnswer  else { return }
                        viewModel.submitAnswer(selectedAnswer)
                        self.selectedAnswer = nil
                    }) {
                        Text( viewModel.currentQuestionIndex == viewModel.quiz.questions.count - 1 ? "Finish" :"Next Question")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 360, height: 50)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }.disabled(selectedAnswer == nil)
                        .opacity(selectedAnswer == nil ? 0.5 : 1.0)
                }
                
            }
        }
        .sheet(isPresented: $showResultsView, content: {
            QuizResultsView()
                .environment(viewModel)
                .presentationDetents([.medium])
        })
    }
}

#Preview {
    QuizAppView()
}

/*
 Prompt:
 
 Build a quiz application:
 - Users should be presented with a question that has 4 potential answers.
 - User should be able to select an answser and navigate to the next question until completion.
 - show the question number the user is currently on.
 - show a completion view with the option to view results or start quiz over.
 
 Architecture: MVVM
 
 */
