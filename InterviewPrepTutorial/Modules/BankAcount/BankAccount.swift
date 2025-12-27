//
//  BankAccount.swift
//  InterviewPrepTutorial
//
//  Created by Sachin Randive on 27/12/25.
//

import Foundation

enum BankAccountError: Error {
    case insufficientFunds
    case invalidAmount
    case sameAccountNumber
    case fraudAlert
}
class BankAccount {
    let owner: String
    let accountNumber: String
    var balance: Double
    
    private let fraudThreshold: Double = 5000
    
    init(owner: String, accountNumber: String, balance: Double) {
        self.owner = owner
        self.accountNumber = accountNumber
        self.balance = balance
    }
    
    func deposit(_ amount: Double) throws {
        guard amount > 0 else { throw BankAccountError.invalidAmount }
        balance += amount
    }
    
    func withdraw(_ amount: Double) throws {
        guard amount > 0 else { throw BankAccountError.invalidAmount }
        guard balance >= amount else { throw BankAccountError.insufficientFunds }
        guard amount < 5000 else { throw BankAccountError.fraudAlert }
        balance -= amount
    }
    
    func transfer(_ amount: Double, to recipient: BankAccount) throws {
        guard accountNumber != recipient.accountNumber else {
            throw BankAccountError.sameAccountNumber
        }
        try self.withdraw(amount)
        try recipient.deposit(amount)
    }
}
