//
//  CDRecordRepository_Test.swift
//  eWallet_Tests
//
//  Created by Habibur Rahman on 6/8/24.
//

@testable import eWallet
import Foundation
import XCTest

final class CDRecordRepository_Test: XCTestCase {
    let manager = CoreDataManager.instance
    var helper = CoreDataHelper()

    override func setUpWithError() throws {
        manager.deleteFullDB()
        helper = CoreDataHelper()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_addOneExpenseTypeRecord_RecordListShouldBeOne() {
        _ = helper.addRecordInDB(recordType: .EXPENSE)
        XCTAssertEqual(helper.getRecordList().count, 1)
    }

    func test_addOneIncomeTypeRecord_RecordListShouldBeOne() {
        _ = helper.addRecordInDB(recordType: .INCOME)
        XCTAssertEqual(helper.getRecordList().count, 1)
    }

    func test_addOneTransferTypeRecord_RecordListShouldBeOne() {
        _ = helper.addRecordInDB(recordType: .TRANSFER)
        XCTAssertEqual(helper.getRecordList().count, 1)
    }

    func test_getRecordDataFromId_WillFetchPeoperData() {
        var recordData = helper.getDummyRecordData(recordType: .EXPENSE)
        _ = helper.addRecordInDB(recordData: &recordData)
        let fetchedData = helper.getRecordFromID(id: recordData.id)

        XCTAssertEqual(recordData.id, fetchedData?.id)
        XCTAssertEqual(recordData.note, fetchedData?.note)
        XCTAssertEqual(recordData.amount, fetchedData?.amount)
        XCTAssertEqual(recordData.catagory?.id, fetchedData?.catagory?.id)
        XCTAssertEqual(recordData.account?.id, fetchedData?.account?.id)
    }

    func test_addExpenseTypeRecord_WillDecreaseTheAmountOfItsAccount() {
        var recordData = helper.getDummyRecordData(recordType: .EXPENSE)
        let prevAcountAmount = helper.getAccountAmountFrom(accountId: recordData.account?.id ?? "")
        _ = helper.addRecordInDB(recordData: &recordData)
        let fetchedData = helper.getRecordFromID(id: recordData.id)
        let updatedAcountAmount = helper.getAccountAmountFrom(accountId: fetchedData?.account?.id ?? "")
        XCTAssertEqual(updatedAcountAmount, prevAcountAmount - (fetchedData?.amount ?? 0.0))
    }

    func test_addIncomeTypeRecord_WillIncreaseTheAmountOfItsAccount() {
        var recordData = helper.getDummyRecordData(recordType: .INCOME)
        let prevAcountAmount = helper.getAccountAmountFrom(accountId: recordData.account?.id ?? "")
        _ = helper.addRecordInDB(recordData: &recordData)
        let fetchedData = helper.getRecordFromID(id: recordData.id)
        let updatedAcountAmount = helper.getAccountAmountFrom(accountId: fetchedData?.account?.id ?? "")
        XCTAssertEqual(updatedAcountAmount, prevAcountAmount + (fetchedData?.amount ?? 0.0))
    }

    func test_addTransferTypeRecord_WillIncreaseTheAmountOfItsAccountAndDecreaseItsFromAccountAmount() {
        var recordData = helper.getDummyRecordData(recordType: .TRANSFER)

        let prevAcountAmount = helper.getAccountAmountFrom(accountId: recordData.account?.id ?? "")
        let prevFromAcountAmount = helper.getAccountAmountFrom(accountId: recordData.fromAccount?.id ?? "")

        _ = helper.addRecordInDB(recordData: &recordData)
        let fetchedData = helper.getRecordFromID(id: recordData.id)

        let updatedAcountAmount = helper.getAccountAmountFrom(accountId: fetchedData?.account?.id ?? "")
        XCTAssertEqual(updatedAcountAmount, prevAcountAmount + (fetchedData?.amount ?? 0.0))

        let updatedFromAcountAmount = helper.getAccountAmountFrom(accountId: fetchedData?.fromAccount?.id ?? "")
        XCTAssertEqual(updatedFromAcountAmount, prevFromAcountAmount - (fetchedData?.amount ?? 0.0))
    }

    func test_DeleteExpenseTypeRecord_WillRestoreItsAccountsAmount() {
        var recordData = helper.getDummyRecordData(recordType: .EXPENSE)
        let prevAcountAmount = helper.getAccountAmountFrom(accountId: recordData.account?.id ?? "")
        _ = helper.addRecordInDB(recordData: &recordData)
        _ = helper.deleteRecordtInDB(recordData: recordData)
        let updatedAcountAmount = helper.getAccountAmountFrom(accountId: recordData.account?.id ?? "")

        XCTAssertEqual(updatedAcountAmount, prevAcountAmount)
    }

    func test_DeleteIncomeTypeRecord_WillRestoreItsAccountsAmount() {
        var recordData = helper.getDummyRecordData(recordType: .INCOME)
        let prevAcountAmount = helper.getAccountAmountFrom(accountId: recordData.account?.id ?? "")
        _ = helper.addRecordInDB(recordData: &recordData)
        _ = helper.deleteRecordtInDB(recordData: recordData)
        let updatedAcountAmount = helper.getAccountAmountFrom(accountId: recordData.account?.id ?? "")
        XCTAssertEqual(updatedAcountAmount, prevAcountAmount)
    }

    func test_DeleteTransferTypeRecord_WillRestoreItsAccount_And_FromAccount_Amount() {
        var recordData = helper.getDummyRecordData(recordType: .TRANSFER)

        let prevAcountAmount = helper.getAccountAmountFrom(accountId: recordData.account?.id ?? "")
        let prevFromAcountAmount = helper.getAccountAmountFrom(accountId: recordData.fromAccount?.id ?? "")

        _ = helper.addRecordInDB(recordData: &recordData)
        _ = helper.deleteRecordtInDB(recordData: recordData)

        let updatedAcountAmount = helper.getAccountAmountFrom(accountId: recordData.account?.id ?? "")
        XCTAssertEqual(updatedAcountAmount, prevAcountAmount)

        let updatedFromAcountAmount = helper.getAccountAmountFrom(accountId: recordData.fromAccount?.id ?? "")
        XCTAssertEqual(updatedFromAcountAmount, prevFromAcountAmount)
    }

}
