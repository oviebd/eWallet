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
    
    var  recordRepo : CDRecordRepository?
    
    override func setUpWithError() throws {
        recordRepo = CDRecordRepository()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        recordRepo = nil
    }
    
    func test_getUpdatedAmountBasedOnRecordType_BothAccountAndFromAccountAmount_ShouldBeSame(){
        let recordType : RecordTypeEnum? = nil
        let accountAmount : Double = 2000
        let fromAccountAmount : Double = 15000
        let transferAmount : Double = 1000
        
        
        let (accAmount, fromAccAmount) = recordRepo?.getUpdatedAmountBasedOnRecordType(recordType: recordType, transactionAmount: transferAmount, accountAmount: accountAmount, fromAccountAmount: fromAccountAmount) ?? (0,0)
        
        XCTAssertEqual(accAmount, accountAmount)
        XCTAssertEqual(fromAccAmount, fromAccountAmount)
        
    }
    
    func test_getUpdatedAmountBasedOnRecordType_DuringTransfer_AddInAccountAmountAndReduceInFromAccountAmount(){
        let recordType : RecordTypeEnum? = .TRANSFER
        let accountAmount : Double = 2000
        let fromAccountAmount : Double = 15000
        let transferAmount : Double = 1000
        
        
        let (accAmount, fromAccAmount) = recordRepo?.getUpdatedAmountBasedOnRecordType(recordType: recordType, transactionAmount: transferAmount, accountAmount: accountAmount, fromAccountAmount: fromAccountAmount) ?? (0,0)
        
        XCTAssertEqual(accAmount, accountAmount + transferAmount)
        XCTAssertEqual(fromAccAmount, fromAccountAmount - transferAmount)
        
    }
    
}
