//
//  ContactsView.swift
//  InterviewPrepTutorial
//
//  Created by Sachin Randive on 18/11/25.
//

import SwiftUI

struct ContactsView: View {
    
    @State private var viewModel = ContactsViewModel()
    @State private var searchText = ""
    @State private var showAddContactView = false
    
    var searchResults: [Contact] {
        return viewModel.searchResults(for: searchText)
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(searchResults) { contact in
                   NavigationLink(value: contact, label: {
                       ContactsRowView(contact: contact)
                           .swipeActions(edge: .trailing, content: {
                               Button(action: {
                                   viewModel.deleteContact(contact)
                               }) {
                                   Image(systemName: "trash")
                               }
                               .tint(.red)
                           })
                    })
                }
            }
            
            .sheet(isPresented: $showAddContactView, content: {
                AddContactView()
                    .environment(viewModel)
                    .presentationDetents([.height(300), .medium, .large])
                
            })
            .navigationDestination(for: Contact.self, destination: { contact in
                EditContactView(contact: contact)
                .environment(viewModel)
            })
            .toolbar(content: {
                Button{
                    showAddContactView.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            })
            
            .navigationTitle(Text("Contacts"))
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchText, prompt: Text("Search"))
        }
    }
}

#Preview {
    ContactsView()
}
