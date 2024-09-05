//
//  CoreDataHelper.swift
//  eWallet_Tests
//
//  Created by Habibur Rahman on 5/9/24.
//

@testable import eWallet
import Foundation
import XCTest


class CoreDataHelper {
    
    let manager = CoreDataManager.instance
    let recordRepo = RecordDataRepository.shared(recordRepo: CDRecordRepository())
    let accountRepo = AccountDataRepository.shared(accountRepo: CDAccountRepository())
    let categoryRepo = CategoryDataRepository.shared(categoryRepo:  CDCategoryRepository())
    
    let categoryUtils = CategoryUtility()
    
    func deleteFullDB(){
        manager.deleteFullDB()
    }
    
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
    
    func addRecordInDB(recordType : RecordTypeEnum) ->  Bool {
        var recordData = getDummyRecordData(recordType: recordType)
        return addRecordInDB(recordData: &recordData)
    }
    
    func addRecordInDB( recordData : inout RecordData) -> Bool {
        var recordData = recordData
        recordData.catagory = getCategory(id: recordData.catagory?.id ?? "")
        recordData.account = getAccountFromID(id: recordData.account?.id ?? "")
        recordData.fromAccount = getAccountFromID(id: recordData.fromAccount?.id ?? "")
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
    
    func getAccountAmountFrom(accountId : String) -> Double {
        return getAccountFromID(id: accountId)?.amount ?? 0.0
    }
    
    func getAccountList() -> [AccountData] {
        return accountRepo.getAccounts()
    }
    
    func addCategoryInDB(categoryData : CategoryData) -> Bool{
        return categoryRepo.addCategory(categoryData: categoryData)
    }
    
    func getFirstCategory() -> CategoryData?{
        return categoryRepo.getCategories().first
    }
    
    func getCategory(id : String) -> CategoryData? {
        return categoryRepo.getCategoryEntityFromId(id: id)?.convertToCategory()
    }
    
}

