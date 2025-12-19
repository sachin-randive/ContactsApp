//
//  UserVIew.swift
//  InterviewPrepTutorial
//
//  Created by Sachin Randive on 10/12/25.
//

import SwiftUI

struct UserVIew: View {
    // let users = User.mockUsers
    @State private var viewModel = UserViewModel()
    
    var body: some View {
        Group {
            switch viewModel.loadingState {
            case .loading:
                ProgressView()
            case .empty:
                ContentUnavailableView("No Products Found", systemImage: "cart.fill")
            case .error(let error):
                Text("Error: \(error.localizedDescription)")
            case .completed:
                List {
                    ForEach(viewModel.users) { user in
                        HStack(spacing:15) {
                            Text("\(user.id)")
                            VStack(alignment: .leading,spacing: 5) {
                                Text(user.username)
                                
                                Text(user.email)
                                    .foregroundStyle(.gray)
                            }
                            .font(.subheadline)
                            
                        }
                    }
                }
            }
        }
        .task { await viewModel.fetchUsers()}
    }
}

#Preview {
    UserVIew()
}
