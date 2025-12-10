//
//  FakeStoreTabView.swift
//  InterviewPrepTutorial
//
//  Created by Sachin Randive on 10/12/25.
//

import SwiftUI

struct FakeStoreTabView: View {
    var body: some View {
    TabView {
           ProductView()
            .tabItem {
                Label("Products", systemImage: "cart")
            }
        
        UserVIew()
            .tabItem {
               Label("Users", systemImage: "person")
            }
        }
    }
}

#Preview {
    FakeStoreTabView()
}
