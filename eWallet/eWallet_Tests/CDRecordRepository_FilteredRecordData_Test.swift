//
//  CDRecordRepository_FilteredRecordData_Test.swift
//  eWallet_Tests
//
//  Created by Habibur Rahman on 4/9/24.
//

@testable import eWallet
import Foundation
import XCTest


final class CDRecordRepository_FilteredRecordData_Test: XCTestCase {

    
    let manager = CoreDataManager.instance
    let recordRepo = RecordDataRepository.shared(recordRepo: CDRecordRepository())
    let accountRepo = AccountDataRepository.shared(accountRepo: CDAccountRepository())
    
    
    override func setUpWithError() throws {
        manager.deleteFullDB()
        _ = accountRepo.addAccount(account: DummyDataUtils.dummyAccountData)
        _ = accountRepo.addAccount(account: DummyDataUtils.dummyAccountData2)
    }


    override func tearDownWithError() throws {
       
    }

    

}
