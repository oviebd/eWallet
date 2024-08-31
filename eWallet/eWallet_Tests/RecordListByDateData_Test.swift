//
//  RecordListByDateData_Test.swift
//  eWallet_Tests
//
//  Created by Habibur Rahman on 31/8/24.
//

import XCTest
@testable import eWallet
import Foundation
import XCTest

final class RecordListByDateData_Test: XCTestCase {

    let todayRecordList = DummyDataUtils.todayRecordList
    let yesterDayRecordList = DummyDataUtils.yesterdayRecordList
   
    let today : Date = .now
    let yesterDay : Date = .now.dayBefore(dayNumber: 1) ?? .now
    
    
    override func setUpWithError() throws {
       
    }

    override func tearDownWithError() throws {
        
    }
    
    func test_prepareDatas_WillInsertRightAmountOfDataInEachDate(){
       
        let allDatsList = todayRecordList + yesterDayRecordList
        let recordListByDate = RecordListByDateData()
        recordListByDate.prepareDatas(datas: allDatsList)
        
        let todaysDataInDic = recordListByDate.dataByDateDic [today.removeTime()]
        let yesterDaysDataInDic = recordListByDate.dataByDateDic [yesterDay.removeTime()]
        
        XCTAssertEqual(todaysDataInDic?.count, todayRecordList.count)
        XCTAssertEqual(yesterDaysDataInDic?.count, yesterDayRecordList.count)
    }
    
    func test_prepareDatas_WillInsertAccurateDataInEachDate(){
       
        let allDatsList = todayRecordList + yesterDayRecordList
        let recordListByDate = RecordListByDateData()
        recordListByDate.prepareDatas(datas: allDatsList)
        
        let todaysDataInDic = recordListByDate.dataByDateDic [today.removeTime()]
        let yesterDaysDataInDic = recordListByDate.dataByDateDic [yesterDay.removeTime()]
        
        for i in 0..<todayRecordList.count {
            XCTAssertTrue(hasIdIn(recordList: todaysDataInDic, id: todayRecordList[i].id))
        }
        
        for i in 0..<yesterDayRecordList.count {
            XCTAssertTrue(hasIdIn(recordList: yesterDaysDataInDic, id: yesterDayRecordList[i].id))
        }

    }

   
    
    //MARK : Helper
    
    func hasIdIn(recordList : [RecordData]?, id : String) -> Bool {
        
        guard let recordList = recordList else {
            return false
        }
        return !recordList.filter { $0.id == id }.isEmpty
        
    }

}
