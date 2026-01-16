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
        try account.deposit(500)
        #expect(account.balance == 1500)
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
        try account.withdraw(500)
        #expect(account.balance == 500)
    }
    
    // test Withdraw insufficient fund
    
    @Test func testWithdrawWithInsufficientFund() throws {
        let account = BankAccount(owner: "Sachin", accountNumber: "1234567890", balance: 1000)
        #expect(throws: BankAccountError.insufficientFunds) {
            try account.withdraw(2000)
        }
    }
    
    @Test func testWithrawwithFraud() throws {
        let account = BankAccount(owner: "Sachin", accountNumber: "1234567890", balance: 10_000)
        #expect(throws: BankAccountError.fraudAlert) {
            try account.withdraw(6_000)
        }
    }
    
    @Test func testTransferSuccessed()  throws {
        let account1 = BankAccount(owner: "Sachin", accountNumber: "1234567890", balance: 10_000)
        let account2 = BankAccount(owner: "Rakesh", accountNumber: "1234518190", balance: 1_000)
        
        try account1.transfer( 1_000, to: account2)
        #expect(account1.balance == 9_000)
        #expect(account2.balance == 2_000)
    }
    
    @Test func testTransferInsufficientFunds() async throws {
        let account1 = BankAccount(owner: "Sachin", accountNumber: "1234567890", balance: 10_000)
        let account2 = BankAccount(owner: "Rakesh", accountNumber: "1234518190", balance: 1_000)
        #expect(throws: BankAccountError.insufficientFunds) {
            try account1.transfer( 20_000, to: account2)
        }
    }
    
    @Test func testTransferSameAccount() async throws {
        let account1 = BankAccount(owner: "Sachin", accountNumber: "1234567890", balance: 10_000)
        #expect(throws: BankAccountError.sameAccountNumber) {
            try account1.transfer( 20_000, to: account1)
        }
    }
}
