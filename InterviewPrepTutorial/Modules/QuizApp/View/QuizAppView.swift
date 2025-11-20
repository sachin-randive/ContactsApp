//
//  QuizAppView.swift
//  InterviewPrepTutorial
//
//  Created by Sachin Randive on 20/11/25.
//

import SwiftUI

struct QuizAppView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("What is the main function of a ViewModel in MVVM architecture?")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("Select an answer below")
                .foregroundStyle(.gray)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 120)
        .padding()
        
        VStack(alignment: .leading) {
            Text("Question 1 / 6")
                .font(.subheadline)
                .padding(.horizontal)
                Divider()
        }
        .padding(.bottom)
        
        VStack {
            ForEach(0..<4) { choice in
                Button {
                    
                } label: {
                    Text("Hnadle UI rendering directly Hnadle UI rendering directly")
                        .font(.subheadline)
                        .padding(.horizontal)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        .foregroundStyle(.black)
                       .frame(width: 360, height: 60, alignment: .leading)
                        
                        .clipShape(.rect(cornerRadius: 10))
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                            .stroke(.gray, lineWidth: 1)
                        }
                }
            }
        }
        Spacer()
        VStack {
            Button(action: {}) {
                Text("Next Question")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 360, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        
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
