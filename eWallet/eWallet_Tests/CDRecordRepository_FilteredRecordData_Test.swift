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
    let categoryRepo = CategoryDataRepository.shared(categoryRepo:  CDCategoryRepository())

    
    override func setUpWithError() throws {
        manager.deleteFullDB()
        _ = accountRepo.addAccount(account: DummyDataUtils.dummyAccountData)
        _ = accountRepo.addAccount(account: DummyDataUtils.dummyAccountData2)
        
        _ = categoryRepo.addCategory(categoryData: CategoryUtility.catagory1)
        _ = categoryRepo.addCategory(categoryData: CategoryUtility.catagory2)
    }


    override func tearDownWithError() throws {
       
    }

    func test_filter_by_datesOnly_getCorrectDataBetweenTwoDays() {
        
        let rec_before_3_days = addRecordtInDB(recordData: DummyDataUtils.dummyRecordData_Income, dayNumber: -3)
        let rec_today = addRecordtInDB(recordData: DummyDataUtils.dummyRecordData_Income, dayNumber: 0)
        
        let rec_after_1_day = addRecordtInDB(recordData: DummyDataUtils.dummyRecordData_Income, dayNumber: 1 )
     
        let rec_after_3_days = addRecordtInDB(recordData: DummyDataUtils.dummyRecordData_Income, dayNumber: 3)
        let rec_after_6_days = addRecordtInDB(recordData: DummyDataUtils.dummyRecordData_Income, dayNumber: 6)
        
        let sortType = SortingDayEnums.day_7
        let sortData = RecordFilterData(startDate: sortType.getStartDate(), endDate: sortType.getEndDate())
    
        let fetchedDatas = recordRepo.getFilteredDatas(recordFilterData: sortData)
        XCTAssertEqual(fetchedDatas.count, 2)
                                        
    }
    
    
    // Helper
    
    func addRecordtInDB(recordData : RecordData, dayNumber : Int) -> Bool{
        var date : Date? = nil
        if dayNumber >= 0 {
            date = .now.dayAfter(dayNumber: dayNumber)
        }else{
            date = .now.dayBefore(dayNumber: (-1)*dayNumber)
        }
        guard let date = date else{
            return false
        }
        var recordData = recordData
        recordData.catagory = getCategory(id: recordData.id)
        recordData.date = date
        return recordRepo.addRecord(recordData: recordData)
    }
    
    func getRecordFromID(id : String) -> RecordData? {
        return recordRepo.getRecordFromId(id: id)
    }
    
    func getRecordList() -> [RecordData] {
        return recordRepo.getRecords()
    }
    
    func getCategory(id : String) -> CategoryData? {
        return categoryRepo.getCategoryEntityFromId(id: id)?.convertToCategory()
    }

}
