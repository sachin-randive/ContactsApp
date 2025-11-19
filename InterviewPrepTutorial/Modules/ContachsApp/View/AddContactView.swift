//
//  AddContactView.swift
//  InterviewPrepTutorial
//
//  Created by Sachin Randive on 18/11/25.
//

import SwiftUI

struct AddContactView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(ContactsViewModel.self) var viewModel
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    
    var body: some View {
       NavigationStack {
            Form {
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
               
           }
            .toolbar {
               ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                       dismiss()
                   }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        // Action add recoeds done
                        addContacts()
                    }
                }
            }
            .navigationTitle("Add record")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
private extension AddContactView {
    
    func addContacts() {
        let contact = Contact(id: UUID().uuidString, firstName: firstName, lastName: lastName, email: email)
        viewModel.contacts.append(contact)
        dismiss()
    }
}

#Preview {
    AddContactView()
        .environment(ContactsViewModel())
}
