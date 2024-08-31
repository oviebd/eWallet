//
//  DateExt_Test.swift
//  eWallet_Tests
//
//  Created by Habibur Rahman on 31/8/24.
//

import Foundation

@testable import eWallet
import Foundation
import XCTest

final class DateExt_Test : XCTestCase {
    
    override func setUpWithError() throws {
       // manager.deleteFullDB()
    }
    override func tearDownWithError() throws {
    }
    
    func test_RemoveTime_RemoveTimeFromDateAfterConvert(){
       
        let dateWithTime : Date = .now
        let onlyDate = dateWithTime.removeTime()
        
        XCTAssertNotEqual(dateWithTime.getHour(), 0)
        XCTAssertNotEqual(dateWithTime.getMinutes(), 0)
        XCTAssertNotEqual(dateWithTime.getSeconds(), 0)
        
        XCTAssertEqual(onlyDate.getHour(), 0)
        XCTAssertEqual(onlyDate.getMinutes(), 0)
        XCTAssertEqual(onlyDate.getSeconds(), 0)
    }
    
    func test_RemoveTime_DoNotChangeMonthYearAndDaY(){
       
        let dateWithTime : Date = .now
        let onlyDate = dateWithTime.removeTime()
        
        XCTAssertEqual(onlyDate.getYear(), dateWithTime.getYear())
        XCTAssertEqual(onlyDate.getMonth(), dateWithTime.getMonth())
        XCTAssertEqual(onlyDate.getDayNumberOfMonth(), dateWithTime.getDayNumberOfMonth())
    }
    
   
}
