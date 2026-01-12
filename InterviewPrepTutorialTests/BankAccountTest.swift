//
//  BankAccountTest.swift
//  InterviewPrepTutorialTests
//
//  Created by Sachin Randive on 12/01/26.
//

import Testing
@testable import InterviewPrepTutorial

struct BankAccountTest {

    // test bank account init
    @Test func testBankAccountInit() {
      let account = BankAccount(owner: "Sachin", accountNumber: "1234567890", balance: 1000)
        #expect(account.owner == "Sachin")
        #expect(account.balance == 1000)
        #expect(account.accountNumber == "1234567890")
    }
    
    // test deposit success
    @Test func testDepositSuccess() throws {
        var account = BankAccount(owner: "Sachin", accountNumber: "1234567890", balance: 1000)
        do {
            try account.deposit(500)
            #expect(account.balance == 1500)
        } catch {
           // #expect(false)
        }
    }
    

}
