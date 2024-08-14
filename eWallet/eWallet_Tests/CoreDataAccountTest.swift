//
//  CoreDataAccountTest.swift
//  eWallet_Tests
//
//  Created by Habibur Rahman on 13/8/24.
//

@testable import eWallet
import Foundation
import XCTest


final class CoreDataAccountTest : XCTestCase {
    
    let manager = CoreDataManager.instance
    var accountRepo = AccountDataRepository.shared(accountRepo: CDAccountRepository())
    
    override func setUpWithError() throws {
        manager.deleteFullDB()
    }
    override func tearDownWithError() throws {
    }
    
    func test_addSingleAccount_AccountListShouldBeOne(){
        let accountData = getDummyAccountData()
        _ = addAccountInDB(accountData: accountData)
        XCTAssertEqual(getAccountList().count, 1)
    }
    
    func test_addSingleAccount_SavedAccountTitleWillBeSame(){
        let accountData = DummyDataUtils.dummyAccountData
        _ = addAccountInDB(accountData: accountData)
        XCTAssertEqual(getAccountFromID(id: accountData.id)?.title, accountData.title)
    }
    
    func test_AddAmount_WillIncreaseTheAmount(){
        let accountData = DummyDataUtils.dummyAccountData
        _ = addAccountInDB(accountData: accountData)
        let newAmount = 100 + accountData.amount
        _ = accountRepo.AddAmount(amount: 100, id: accountData.id)
      
        XCTAssertEqual(getAccountFromID(id: accountData.id)?.amount, newAmount)
    }
    
    func test_RemoveAmount_WillDecreaseTheAmount(){
        let accountData = DummyDataUtils.dummyAccountData
        _ = addAccountInDB(accountData: accountData)
        let newAmount =  accountData.amount - 100
        _ = accountRepo.RemoveAmount(amount: 100, id: accountData.id)
      
        let fetchedAccount = getAccountFromID(id: accountData.id)
        XCTAssertEqual(fetchedAccount?.amount, newAmount)
    }
    
    
    //MARK - Helpers
    func getDummyAccountData() -> AccountData{
        return DummyDataUtils.dummyAccountData
    }
    func addAccountInDB(accountData : AccountData) -> Bool{
        return accountRepo.addAccount(account: accountData)
    }
    
    func getAccountFromID(id : String) -> AccountData? {
        return accountRepo.getAccountEntityFromID(id: id)?.convertToAccountData()
    }
    
    func getAccountList() -> [AccountData] {
        return accountRepo.getAccounts()
    }
    
}
