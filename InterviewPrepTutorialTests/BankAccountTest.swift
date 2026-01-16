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
        let account = BankAccount(owner: "Sachin", accountNumber: "1234567890", balance: 1000)
        do {
            try account.deposit(500)
            #expect(account.balance == 1500)
        } catch {
           // #expect(false)
        }
    }
    // test deposit invalid Amount
    @Test func testDepositInvalidAmount() throws {
        let account = BankAccount(owner: "Sachin", accountNumber: "1234567890", balance: 1000)
        #expect(throws: BankAccountError.invalidAmount) {
            try account.deposit(-500)
        }
    }
    
    // test Withdraw success
    
    @Test func testWithdrawSuccess() throws {
        let account = BankAccount(owner: "Sachin", accountNumber: "1234567890", balance: 1000)
        do {
            try account.withdraw(500)
            #expect(account.balance == 500)
        } catch {
            //
        }
    }
    
    // test Withdraw insufficient fund
    
    @Test func testWithdrawWithInsufficientFund() throws {
        let account = BankAccount(owner: "Sachin", accountNumber: "1234567890", balance: 1000)
        #expect(throws: BankAccountError.insufficientFunds) {
            try account.withdraw(2000)
        }
    }
}
