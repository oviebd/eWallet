//
//  CDRecordRepository_Test.swift
//  eWallet_Tests
//
//  Created by Habibur Rahman on 6/8/24.
//

@testable import eWallet
import Foundation
import XCTest


final class CDRecordRepository_Test : XCTestCase {
    
    let manager = CoreDataManager.instance
    let recordRepo = RecordDataRepository.shared(recordRepo: CDRecordRepository()) 
    let accountRepo = AccountDataRepository.shared(accountRepo: CDAccountRepository())
    
    override func setUpWithError() throws {
        manager.deleteFullDB()
        _ = accountRepo.addAccount(account: DummyDataUtils.dummyAccountData)
        _ = accountRepo.addAccount(account: DummyDataUtils.dummyAccountData2)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_addOneExpenseTypeRecord_RecordListShouldBeOne(){
        _ = addRecordtInDB(recordData: getDummyRecordData(recordType: .EXPENSE))
        XCTAssertEqual(getRecordList().count, 1)
    }
    
    func test_addOneIncomeTypeRecord_RecordListShouldBeOne(){
        _ = addRecordtInDB(recordData: getDummyRecordData(recordType: .INCOME))
        XCTAssertEqual(getRecordList().count, 1)
    }
    
    func test_addOneTransferTypeRecord_RecordListShouldBeOne(){
        _ = addRecordtInDB(recordData: getDummyRecordData(recordType: .TRANSFER))
        XCTAssertEqual(getRecordList().count, 1)
    }
    
    func test_getRecordDataFromId_WillFetchPeoperData(){
        let recordData = getDummyRecordData(recordType: .EXPENSE)
        _ = addRecordtInDB(recordData: recordData)
        let fetchedData = getRecordFromID(id: recordData.id)
        
        XCTAssertEqual(recordData.id , fetchedData?.id)
        XCTAssertEqual(recordData.note , fetchedData?.note)
        XCTAssertEqual(recordData.amount , fetchedData?.amount)
    }
    
    func test_addExpenseTypeRecord_WillDecreaseTheAmountOfItsAccount(){
        let recordData = getDummyRecordData(recordType: .EXPENSE)
        let prevAcountAmount = accountRepo.getAccountEntityFromID(id: recordData.account?.id ?? "")?.amount ?? 0
        _ = addRecordtInDB(recordData: recordData)
        let fetchedData = getRecordFromID(id: recordData.id)
        let updatedAcountAmount = getAccountFromID(id: fetchedData?.account?.id ?? "")?.amount ?? 0
        XCTAssertEqual(updatedAcountAmount , prevAcountAmount - (fetchedData?.amount ?? 0.0) )
    }
    
    func test_addIncomeTypeRecord_WillIncreaseTheAmountOfItsAccount(){
        let recordData = getDummyRecordData(recordType: .INCOME)
        let prevAcountAmount = accountRepo.getAccountEntityFromID(id: recordData.account?.id ?? "")?.amount ?? 0
        _ = addRecordtInDB(recordData: recordData)
        let fetchedData = getRecordFromID(id: recordData.id)
        let updatedAcountAmount = getAccountFromID(id: fetchedData?.account?.id ?? "")?.amount ?? 0
        XCTAssertEqual(updatedAcountAmount , prevAcountAmount + (fetchedData?.amount ?? 0.0) )
    }
    
    func test_addTransferTypeRecord_WillIncreaseTheAmountOfItsAccountAndDecreaseItsFromAccountAmount(){
        let recordData = getDummyRecordData(recordType: .TRANSFER)
     
        let prevAcountAmount = accountRepo.getAccountEntityFromID(id: recordData.account?.id ?? "")?.amount ?? 0
        let prevFromAcountAmount = accountRepo.getAccountEntityFromID(id: recordData.fromAccount?.id ?? "")?.amount ?? 0
        
        _ = addRecordtInDB(recordData: recordData)
        let fetchedData = getRecordFromID(id: recordData.id)
        
        let updatedAcountAmount = getAccountFromID(id: fetchedData?.account?.id ?? "")?.amount ?? 0
        XCTAssertEqual(updatedAcountAmount , prevAcountAmount + (fetchedData?.amount ?? 0.0))
        
        let updatedFromAcountAmount = getAccountFromID(id: fetchedData?.fromAccount?.id ?? "")?.amount ?? 0
        XCTAssertEqual(updatedFromAcountAmount , prevFromAcountAmount - (fetchedData?.amount ?? 0.0) )
    }
    
    func test_DeleteExpenseTypeRecord_WillRestoreItsAccountsAmount(){
        let recordData = getDummyRecordData(recordType: .EXPENSE)
        let prevAcountAmount = accountRepo.getAccountEntityFromID(id: recordData.account?.id ?? "")?.amount ?? 0
        _ = addRecordtInDB(recordData: recordData)
        _ = deleteRecordtInDB(recordData: recordData)
        let updatedAcountAmount = getAccountFromID(id: recordData.account?.id ?? "")?.amount ?? 0
        XCTAssertEqual(updatedAcountAmount , prevAcountAmount)
    }
    
    func test_DeleteIncomeTypeRecord_WillRestoreItsAccountsAmount(){
        let recordData = getDummyRecordData(recordType: .INCOME)
        let prevAcountAmount = accountRepo.getAccountEntityFromID(id: recordData.account?.id ?? "")?.amount ?? 0
        _ = addRecordtInDB(recordData: recordData)
        _ = deleteRecordtInDB(recordData: recordData)
        let updatedAcountAmount = getAccountFromID(id: recordData.account?.id ?? "")?.amount ?? 0
        XCTAssertEqual(updatedAcountAmount , prevAcountAmount)
    }
    
    func test_DeleteTransferTypeRecord_WillRestoreItsAccount_And_FromAccount_Amount(){
        let recordData = getDummyRecordData(recordType: .TRANSFER)
      
        let prevAcountAmount = accountRepo.getAccountEntityFromID(id: recordData.account?.id ?? "")?.amount ?? 0
        let prevFromAcountAmount = accountRepo.getAccountEntityFromID(id: recordData.fromAccount?.id ?? "")?.amount ?? 0
        
        _ = addRecordtInDB(recordData: recordData)
        _ = deleteRecordtInDB(recordData: recordData)
        
        let updatedAcountAmount = getAccountFromID(id: recordData.account?.id ?? "")?.amount ?? 0
        XCTAssertEqual(updatedAcountAmount , prevAcountAmount )
        
        let updatedFromAcountAmount = getAccountFromID(id: recordData.fromAccount?.id ?? "")?.amount ?? 0
        XCTAssertEqual(updatedFromAcountAmount , prevFromAcountAmount)
        
    }
    
    //MARK - Healpers
    func getDummyRecordData(recordType : RecordTypeEnum) -> RecordData{
        switch recordType {
        case .INCOME:
            return DummyDataUtils.dummyRecordData_Income
        case .EXPENSE:
            return DummyDataUtils.dummyRecordData_Expense
        case .TRANSFER:
            return DummyDataUtils.dummyRecordData_Transfer
        }
       
    }
    
    
    func addRecordtInDB(recordData : RecordData) -> Bool{
        return recordRepo.addRecord(recordData: recordData)
    }
    
    func getRecordFromID(id : String) -> RecordData? {
        return recordRepo.getRecordFromId(id: id)
    }
    
    func getRecordList() -> [RecordData] {
        return recordRepo.getRecords()
    }
    
    func deleteRecordtInDB(recordData : RecordData) -> Bool{
        return recordRepo.deleteRecord(recordData: recordData)
    }

    
    func getAccountFromID(id : String) -> AccountData? {
        return accountRepo.getAccountEntityFromID(id: id)?.convertToAccountData()
    }
    
    func getAccountList() -> [AccountData] {
        return accountRepo.getAccounts()
    }
    

    
}
