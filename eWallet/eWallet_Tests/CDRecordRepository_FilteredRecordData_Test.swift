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
    var helper = CoreDataHelper()
    override func setUpWithError() throws {
        helper = CoreDataHelper()
    }

    override func tearDownWithError() throws {
    }

    func test_filter_by_datesOnly_getCorrectDataBetweenTwoDays() {
        _ = addRecordtInDB(recordData: DummyDataUtils.dummyRecordData_Income, dayNumber: -365)
        _ = addRecordtInDB(recordData: DummyDataUtils.dummyRecordData_Income, dayNumber: -180)
        _ = addRecordtInDB(recordData: DummyDataUtils.dummyRecordData_Income, dayNumber: -30)
        _ = addRecordtInDB(recordData: DummyDataUtils.dummyRecordData_Income, dayNumber: -15)
        _ = addRecordtInDB(recordData: DummyDataUtils.dummyRecordData_Income, dayNumber: -7)
        _ = addRecordtInDB(recordData: DummyDataUtils.dummyRecordData_Income, dayNumber: -3)

        _ = addRecordtInDB(recordData: DummyDataUtils.dummyRecordData_Income, dayNumber: 0)

        // future
        _ = addRecordtInDB(recordData: DummyDataUtils.dummyRecordData_Income, dayNumber: 1)
        _ = addRecordtInDB(recordData: DummyDataUtils.dummyRecordData_Income, dayNumber: 3)
        _ = addRecordtInDB(recordData: DummyDataUtils.dummyRecordData_Income, dayNumber: 6)

        let filter_1_year = RecordFilterData(startDate: SortingDayEnums.day_1_year.getStartDate(), endDate: SortingDayEnums.day_1_year.getEndDate())
        XCTAssertEqual(helper.getFilteredRecordDatas(filter: filter_1_year).count, 7)

        let filter_6_months = RecordFilterData(startDate: SortingDayEnums.day_6_months.getStartDate(), endDate: SortingDayEnums.day_6_months.getEndDate())
        XCTAssertEqual(helper.getFilteredRecordDatas(filter: filter_6_months).count, 6)

        let filter_30_day = RecordFilterData(startDate: SortingDayEnums.day_30.getStartDate(), endDate: SortingDayEnums.day_30.getEndDate())
        XCTAssertEqual(helper.getFilteredRecordDatas(filter: filter_30_day).count, 5)

        let filter_7_day = RecordFilterData(startDate: SortingDayEnums.day_7.getStartDate(), endDate: SortingDayEnums.day_7.getEndDate())
        XCTAssertEqual(helper.getFilteredRecordDatas(filter: filter_7_day).count, 3)
    }

    func test_filter_by_searchText_getCorrectDataBySearch() {
        var rec1 = DummyDataUtils.dummyRecordData_Income
        rec1.note = "This is first note"

        var rec2 = DummyDataUtils.dummyRecordData_Income
        rec2.note = "That is first note"

        var rec3 = DummyDataUtils.dummyRecordData_Income
        rec3.note = "This is third note"

        _ = helper.addRecordInDB(recordData: rec1)
        _ = helper.addRecordInDB(recordData: rec2)
        _ = helper.addRecordInDB(recordData: rec3)

        XCTAssertEqual(helper.getFilteredRecordDatas(filter: RecordFilterData(searchText: "This")).count, 2)
        XCTAssertEqual(helper.getFilteredRecordDatas(filter: RecordFilterData(searchText: "That")).count, 1)
        XCTAssertEqual(helper.getFilteredRecordDatas(filter: RecordFilterData(searchText: "T")).count, 3)

        XCTAssertEqual(helper.getFilteredRecordDatas(filter: RecordFilterData(searchText: "Tho")).count, 0)
    }

    func test_filter_by_Account_getCorrectDataCount() {
        //account1
        var recordData = DummyDataUtils.dummyRecordData_Income
        recordData.account = DummyDataUtils.dummyAccountData
        _ = helper.addRecordInDB(recordData: recordData)
        _ = helper.addRecordInDB(recordData: recordData)
        _ = helper.addRecordInDB(recordData: recordData)
        
        recordData.account = DummyDataUtils.dummyAccountData2
        _ = helper.addRecordInDB(recordData: recordData)
        _ = helper.addRecordInDB(recordData: recordData)
        

        let account1_filter = RecordFilterData(accountId: DummyDataUtils.dummyAccountData.id)
        let account2_filter = RecordFilterData(accountId: DummyDataUtils.dummyAccountData2.id)
        
        XCTAssertEqual(helper.getFilteredRecordDatas(filter: account1_filter).count, 3)
        XCTAssertEqual(helper.getFilteredRecordDatas(filter: account2_filter).count, 2)
    }
    
    
    func test_filter_by_Category_getCorrectDataCount() {
        //cat 1
        var rec1 = DummyDataUtils.dummyRecordData_Income
        rec1.catagory = CategoryUtility.catagory1
        var rec2 = prepareRecordFrom(recordData: DummyDataUtils.dummyRecordData_Income, dayNumber: -2)
        rec2.catagory = CategoryUtility.catagory1
        var rec3 = prepareRecordFrom(recordData: DummyDataUtils.dummyRecordData_Income, dayNumber: -10)
        rec3.catagory = CategoryUtility.catagory1
        
        //cat 2
        var rec4 = prepareRecordFrom(recordData: DummyDataUtils.dummyRecordData_Transfer, dayNumber: -7)
        rec4.catagory = CategoryUtility.catagory2
        var rec5 = prepareRecordFrom(recordData: DummyDataUtils.dummyRecordData_Transfer, dayNumber: -2)
        rec5.catagory = CategoryUtility.catagory2
         
        
        _ = helper.addRecordInDB(recordData: rec1)
        _ = helper.addRecordInDB(recordData: rec2)
        _ = helper.addRecordInDB(recordData: rec3)
        
        _ = helper.addRecordInDB(recordData: rec4)
        _ = helper.addRecordInDB(recordData: rec5)
        
        
        let cat1_filter = RecordFilterData(categoryId: CategoryUtility.catagory1.id)
        let cat2_filter = RecordFilterData(categoryId: CategoryUtility.catagory2.id)
        
        XCTAssertEqual(helper.getFilteredRecordDatas(filter: cat1_filter).count, 3)
        XCTAssertEqual(helper.getFilteredRecordDatas(filter: cat2_filter).count, 2)
    }
    
    
    

    // Helper

    func prepareRecordFrom(recordData: RecordData, dayNumber: Int) -> RecordData{
        var date: Date?
        if dayNumber >= 0 {
            date = .now.dayAfter(dayNumber: dayNumber)
        } else if dayNumber == 0 {
            date = .now
        } else {
            date = .now.dayBefore(dayNumber: -1 * dayNumber)
        }
        guard let date = date else {
            return recordData
        }
        var newData = recordData
        newData.date = date
        return newData
    }
    
    func addRecordtInDB(recordData: RecordData, dayNumber: Int) -> Bool {
        return helper.addRecordInDB(recordData: prepareRecordFrom(recordData: recordData, dayNumber: dayNumber))
    }
}
