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
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                switch viewModel.loadingState {
                case .loading:
                    ProgressView()
                case .empty:
                    ContentUnavailableView("No Products Found", systemImage: "cart.fill")
                case .error(let error):
                    Text("Error: \(error.localizedDescription)")
                case .completed:
                    List {
                        ForEach(filteredUsers) { user in
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
                    .searchable(text: $searchText, prompt: "Search for users")
                }
            }
            .navigationTitle("Users")
            .refreshable {await viewModel.refreshUsers()}
            .task { await viewModel.fetchUsers()}
        }
    }
}

private extension UserVIew {
    var filteredUsers: [User] {
        guard !searchText.isEmpty else {
            return viewModel.users
        }
        return viewModel.users.filter {
            $0.username.lowercased().contains(searchText.lowercased()) ||
            $0.email.lowercased().contains(searchText.lowercased())
        }
    }
}

#Preview {
    UserVIew()
}
