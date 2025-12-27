//
//  BankAccount.swift
//  InterviewPrepTutorial
//
//  Created by Sachin Randive on 27/12/25.
//

import Foundation

class BankAccount {
    let owner: String
    let accountNumber: String
    let balance: Double
    
    init(owner: String, accountNumber: String, balance: Double) {
        self.owner = owner
        self.accountNumber = accountNumber
        self.balance = balance
    }
    
    func deposit(_ amount: Double) {
        
    }
    
    func withdraw(_ amount: Double) {
        
    }
    
    func transfer(_ amount: Double, to recipient: BankAccount) {
        
    }
}
