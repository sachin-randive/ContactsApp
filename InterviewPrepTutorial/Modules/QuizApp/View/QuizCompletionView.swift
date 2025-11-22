//
//  QuizCompletionView.swift
//  InterviewPrepTutorial
//
//  Created by Sachin Randive on 22/11/25.
//

import SwiftUI

struct QuizCompletionView: View {
    
    @Environment(QuizViewModel.self) private var viewModel
    @Binding var showResults: Bool
    var body: some View {
        VStack (spacing: 18){
            Text("Congratulations, You've completed the quiz!")
                .font(.title)
                .multilineTextAlignment(.center)
            Text("Click below to view your results")
                .font(.subheadline)
                .foregroundStyle(.gray)
        }
        Button("View Results") {
            // show results
            showResults.toggle()
           
        }
        .font(.headline)
        .foregroundColor(.white)
        .padding()
        .frame(width: 360, height: 50)
        .background(Color.blue)
        .cornerRadius(10)
        
        Button("start again"){
            // start over
            viewModel.reStartQuiz()
        }
        .font(.headline)
        .padding(.vertical)
    }
}

#Preview {
    QuizCompletionView(showResults: .constant(false))
        .environment(QuizViewModel())
}
