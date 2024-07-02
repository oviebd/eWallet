//
//  CurrencyViewModel.swift
//  eWallet
//
//  Created by Habibur Rahman on 27/5/24.
//

import Foundation

class AddCurrencyViewModel : ObservableObject {
    

    @Published var title: String = ""
    @Published var symbol: String = ""
    @Published var short_code: String = ""
    
    var currencyRepo : CurrencyDataRepository

    @Published var alertModel = AlertDataUtils.alertDmmyDataSingleButton
    @Published var showingAlert = false
    @Published var isCreated = false
    
    init() {
        
        currencyRepo = CurrencyDataRepository.shared
        currencyRepo.setProtocol(currencyRepo: CDCurrencyRepository())
    }

    
    func createCurrency() {
        
        let (isValid, message) = isValidForAdd()

        if isValid == false {
            AlertDataUtils.getAlertDatafrom(alertData: &alertModel, message: message, alertType: .failure, positiveButtonTitle: "Ok", negativeButtonTitle: "")
            showingAlert = true
            return
        }
        
        let currency = CurrencyData(title: title, symbol: symbol, icon: "D", short_code: short_code)
        let isSuccess = currencyRepo.addCurrency(currencyData: currency)
        
        isCreated = isSuccess
        if isSuccess {
            AlertDataUtils.getAlertDatafrom(alertData: &alertModel, message: "Data saved Successfully", alertType: .success, positiveButtonTitle: "Add More", negativeButtonTitle: "Ok")
            showingAlert = true

        } else {
            AlertDataUtils.getAlertDatafrom(alertData: &alertModel, message: "Failed to save Account data.", alertType: .failure, positiveButtonTitle: "Ok", negativeButtonTitle: "")
            showingAlert = true
        }
    }
    
    func isValidForAdd() -> (Bool, String) {
        if title.isEmpty {
            return (false, "Please input title.")
        }
        if symbol.isEmpty {
            return (false, "Please insert Symbol.")
        }
        
        if short_code.isEmpty {
            return (false, "Please Insert Short Code")
        }

        return (true, "")
    }
    
    func resetValues() {
        title = ""
        symbol = ""
        short_code = ""
    }
}
