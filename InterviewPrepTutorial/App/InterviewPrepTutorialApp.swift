//
//  InterviewPrepTutorialApp.swift
//  InterviewPrepTutorial
//
//  Created by Sachin Randive on 18/11/25.
//

import SwiftUI

@main
struct InterviewPrepTutorialApp: App {
    var body: some Scene {
        @State  var viewModel  = QuizViewModel()
        WindowGroup {
            QuizAppView()
                .environment(viewModel)
        }
    }
}
