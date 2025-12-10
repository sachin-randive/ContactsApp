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

#Preview {
    UserVIew()
}
