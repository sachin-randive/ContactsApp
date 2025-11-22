//
//  QuizResultsView.swift
//  InterviewPrepTutorial
//
//  Created by Sachin Randive on 22/11/25.
//

import SwiftUI

struct QuizResultsView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(QuizViewModel.self) private var viewmodel
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("Your Score")
                        .foregroundStyle(.white.opacity(0.88))
                    Spacer()
                    Button(action: { dismiss()}) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(.red)
                            .imageScale(.large)
                    }
                }
                Text(String(format: "%.2f%%", viewmodel.quizScore))
                    .font(.system(size: 80, weight: .bold))
                    .foregroundStyle(.white)
                    
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .frame(height: 200)
            .background(Color.blue)
            
            Text("Statistics")
                .font(.title)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
           HStack {
               Text("Correct Answers:")
               Spacer()
               Text(" \(viewmodel.numCurrectAnswers) / \(viewmodel.quiz.questions.count)")
               
            }
           .font(.subheadline)
           .padding(.horizontal)
           .frame(width: 360, height: 64)
           .background(Color.gray.opacity(0.2))
           .clipShape(.rect(cornerRadius: 10))
                
            HStack {
                Text("Incorrect Answers:")
                Spacer()
                Text("\(viewmodel.numIncorrectAnswers) / \(viewmodel.quiz.questions.count)")
                
             }
            .font(.subheadline)
            .padding(.horizontal)
            .frame(width: 360, height: 64)
            .background(Color.gray.opacity(0.2))
            .clipShape(.rect(cornerRadius: 10))
        }
    }
}

#Preview {
    QuizResultsView()
        .environment(QuizViewModel())
}
