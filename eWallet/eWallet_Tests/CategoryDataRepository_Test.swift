//
//  CategoryDataRepository_Test.swift
//  eWallet_Tests
//
//  Created by Habibur Rahman on 4/9/24.
//

@testable import eWallet
import Foundation
import XCTest

final class CategoryDataRepository_Test: XCTestCase {

    let manager = CoreDataManager.instance
 //   let recordRepo = RecordDataRepository.shared(recordRepo: CDRecordRepository())
    let categoryRepo = CategoryDataRepository.shared(categoryRepo:  CDCategoryRepository())
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

   

}
