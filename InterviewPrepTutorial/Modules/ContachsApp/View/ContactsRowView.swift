//
//  ContactsRowView.swift
//  InterviewPrepTutorial
//
//  Created by Sachin Randive on 18/11/25.
//

import SwiftUI

struct ContactsRowView: View {
    let contact: Contact
    var body: some View {
        HStack(spacing: 15) {
            Text("\(contact.initials)")
                .foregroundStyle(.white)
                .frame(width: 48, height: 48)
                .background(Color(.systemGray4))
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text("\(contact.firstName) \(contact.lastName)")
                
                Text("\(contact.email)")
                    .foregroundStyle(.gray)
            }
        Spacer()
        }
        //.padding(.horizontal)
    }
}

#Preview {
    ContactsRowView(contact: .init(id: "1", firstName: "Michael", lastName: "Jordan", email: "sjunpman@gmail.com"))
}
