//
//  DummyDataUtils.swift
//  eWallet
//
//  Created by Habibur Rahman on 1/6/24.
//

import Foundation
import SwiftUI

class DummyDataUtils {
//    public static let alertDmmyData = CustomAlertDataModel(imageName: "xmark.octagon.fill", title: "title", message: "Message", alertType: AlertType.success, positiveButtonTitle: "Ok" , negativeButtonTitle: "Cancel")
    
    public static let dummyCurrencyData : CurrencyData = CurrencyData(title: "Taka", symbol: "Tk", icon: "Tk", short_code: "Tk")
  
    public static let dummyAccountData : AccountData = AccountData(title: "Account 01", currencyData : dummyCurrencyData, amount: 500)
    public static let dummyAccountData2 : AccountData = AccountData(title: "Account 02", currencyData : dummyCurrencyData, amount: 1000)
    
    public static let dummyCommonTopBar = CommonTopBarData(title: "Title",
                                                           bgColor: Color.theme.white ,
                                                           leftIconName: "chevron.left" ,
                                                           rightIconName: "chevron.left")
     
    // public static let dummyRecordDetailsData = AdditionalRecordData(note: "sample Note ", date: Date.now, time: Date.now)
    
    public static let dummyRecordData_Expense = RecordData( note: "Sample Note", recordType: RecordTypeEnum.EXPENSE.rawValue, amount: 10.0, date: .now,catagory: CategoryUtility.catagory1, account: dummyAccountData)
    public static let dummyRecordData_Income = RecordData(note: "Sample Note", recordType: RecordTypeEnum.INCOME.rawValue, amount: 10.0, date: .now,catagory: CategoryUtility.catagory1, account: dummyAccountData)
    public static let dummyRecordData_Transfer = RecordData(note: "Sample Note", recordType: RecordTypeEnum.TRANSFER.rawValue, amount: 10.0, date: .now, catagory: CategoryUtility.catagory1, account: dummyAccountData, fromAccount: dummyAccountData2)
    
    
    public static let dummyRecordData_Expense_yesterDay = RecordData(note: "Sample Note", recordType: RecordTypeEnum.EXPENSE.rawValue, amount: 10.0, date: .now.dayBefore(dayNumber: 1) ?? .now,catagory: CategoryUtility.catagory1, account: dummyAccountData)
    public static let dummyRecordData_Income_yesterDay = RecordData(note: "Sample Note", recordType: RecordTypeEnum.INCOME.rawValue, amount: 10.0, date:  .now.dayBefore(dayNumber: 1) ?? .now,catagory: CategoryUtility.catagory1, account: dummyAccountData)
    public static let dummyRecordData_Transfer_yesterDay = RecordData(note: "Sample Note", recordType: RecordTypeEnum.TRANSFER.rawValue, amount: 10.0, date: .now.dayBefore(dayNumber: 1) ?? .now, catagory: CategoryUtility.catagory1, account: dummyAccountData, fromAccount: dummyAccountData2)
    
    
    static let todayRecordList = [dummyRecordData_Expense,dummyRecordData_Income,dummyRecordData_Transfer]
    static let yesterdayRecordList = [dummyRecordData_Expense_yesterDay, dummyRecordData_Income_yesterDay, dummyRecordData_Transfer_yesterDay]
    
}

