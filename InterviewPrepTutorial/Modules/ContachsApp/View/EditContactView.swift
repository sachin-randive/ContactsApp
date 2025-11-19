//
//  EditContactView.swift
//  InterviewPrepTutorial
//
//  Created by Sachin Randive on 18/11/25.
//

import SwiftUI

struct EditContactView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(ContactsViewModel.self) var viewModel
    @State private var contact: Contact
    @State private var contactDidChange = false
    @State private var showExitConformation = false
    @State private var showDeleteConformation = false
    
    private let originalContact: Contact
    
    init(contact: Contact) {
        _contact = State(initialValue: contact)
        self.originalContact = contact
    }
   
    var body: some View {
        VStack {
            Form {
                TextField("First Name", text: $contact.firstName)
                TextField("Last Name", text: $contact.lastName)
                TextField("Email", text: $contact.email)
                    .keyboardType(.emailAddress)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
                
            }
            Button("Delete") {
                showDeleteConformation.toggle()
            }
        }
        .onChange(of: contact, { oldValue, newValue in
            self.contactDidChange = newValue != originalContact
        })
        .navigationTitle("Edit record")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancel") {
                   onCancel()
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    updateContact()
                }
                .disabled(!contactDidChange)
                .opacity(contactDidChange ? 1 : 0.5)
                .font(.headline)
            }
        }
        .alert("Unsaved changes", isPresented:$showDeleteConformation) {
            Button("Stay", role: .cancel) {}
            Button("Discard Changes", role: .destructive) {deleteContact()}
        }
        .alert("Unsaved changes", isPresented:$showExitConformation) {
            Button("Stay", role: .cancel) {}
            Button("Discard Changes", role: .destructive) {dismiss()}
        }
    }
}

private extension EditContactView {
    func updateContact() {
        viewModel.updateContact(contact)
        print(viewModel.contacts)
        dismiss()
    }
    func deleteContact() {
        viewModel.deleteContact(contact)
        dismiss()
    }
    
    func onCancel() {
        
        if contactDidChange {
            showExitConformation = true
        }
        else {
            dismiss()
        }
    }
}
#Preview {
    EditContactView(contact: .init(id: "1", firstName: "Sachin", lastName: "Randive", email: "sachin@example.com"))
        .environment(ContactsViewModel())
}
