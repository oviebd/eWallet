//
//  DummyDataUtils.swift
//  eWallet
//
//  Created by Habibur Rahman on 1/6/24.
//

import Foundation

class DummyDataUtils {
//    public static let alertDmmyData = CustomAlertDataModel(imageName: "xmark.octagon.fill", title: "title", message: "Message", alertType: AlertType.success, positiveButtonTitle: "Ok" , negativeButtonTitle: "Cancel")
    
    public static let dummyCurrencyData : CurrencyData = CurrencyData(title: "Taka", symbol: "Tk", icon: "Tk", short_code: "Tk")
    public static let dummyAccountData : AccountData = AccountData(title: "Account 01", currencyData : dummyCurrencyData, amount: 100)
}

