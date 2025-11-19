//
//  ContactsViewModel.swift
//  InterviewPrepTutorial
//
//  Created by Sachin Randive on 19/11/25.
//

import Observation

@Observable
class ContactsViewModel {
    var contacts: [Contact] = []
    init() {
        fetchContacts( )
    }
    func fetchContacts() {
        contacts = [
            .init(id: "1", firstName: "Michael",
                  lastName: "Jordan", email: "sjunpman@gmail.com"),
            .init(id: "2", firstName: "LeBron",
                  lastName: "James", email: "ljames@gmail.com"),
            .init(id: "3", firstName: "Kobe",
                  lastName: "bareial", email: "kobebareail@gmail.com")
        ]
    }
    // CRUD Operation
    
    func addContact(_ contact: Contact) {
        contacts.append(contact)
    }
    
    func deleteContact(_ contact: Contact) {
        guard let index = contacts.firstIndex(where: {$0.id == contact.id}) else { return }
        contacts.remove(at: index)
    }
    
    func updateContact(_ contact: Contact) {
        guard let index = contacts.firstIndex(where: { $0.id == contact.id }) else {
            print("unknown eror")
            return }
        print(index)
        contacts[index] = contact
    }
    
    func searchResults(for query: String) -> [Contact] {
        guard !query.isEmpty else {
            return contacts
        }
        return contacts.filter {
            $0.firstName.localizedCaseInsensitiveContains(query) ||
            $0.lastName.localizedCaseInsensitiveContains(query) ||
            $0.email.localizedCaseInsensitiveContains(query)
        }
    }
}
