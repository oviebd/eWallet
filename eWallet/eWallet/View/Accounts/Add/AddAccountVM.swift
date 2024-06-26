//
//  AddAccountVM.swift
//  eWallet
//
//  Created by Habibur Rahman on 31/5/24.
//

import Foundation

class AddAccountVM: ObservableObject {
    private var accountRepo: AccountDataRepository
    var currencyRepo = CDCurrencyRepository()

    @Published var name: String = ""
    @Published var initialAmount: String = "0.0"

    @Published var currencyNamesList = [String]()
    @Published var selectedCurrencyIndex = 0

    @Published var alertModel = AlertDataUtils.alertDmmyDataSingleButton
    @Published var showingAlert = false
    @Published var isAccountCreated = false

    private var currencyList: [CurrencyData] = [CurrencyData]()

    init() {
        accountRepo = AccountDataRepository(accountRepo: CDAccountRepository())
        getAccount()
        prepareCurrencyNameList()
    }

    func getAccount() {
        _ = accountRepo.getAccounts()
    }


    func createAccount() {
        let (isValid, message) = isValidForAdd()

        if isValid == false {
            AlertDataUtils.getAlertDatafrom(alertData: &alertModel, message: message, alertType: .failure, positiveButtonTitle: "Ok", negativeButtonTitle: "")
            showingAlert = true
            return
        }

        guard let currencyData = getSelectedCurrency() else {
            return
        }
        let amountInDouble = Double(initialAmount) ?? 0.0

        let account = AccountData(title: name, currencyData: currencyData, amount: amountInDouble)
        let isSuccess = accountRepo.addAccount(account: account)

        isAccountCreated = isSuccess

        if isSuccess {
            AlertDataUtils.getAlertDatafrom(alertData: &alertModel, message: "Data saved Successfully", alertType: .success, positiveButtonTitle: "Add More", negativeButtonTitle: "Ok")
            showingAlert = true

        } else {
            AlertDataUtils.getAlertDatafrom(alertData: &alertModel, message: "Failed to save Account data.", alertType: .failure, positiveButtonTitle: "Ok", negativeButtonTitle: "")
            showingAlert = true
        }
    }

    func getSelectedCurrency() -> CurrencyData? {
        if selectedCurrencyIndex < currencyNamesList.count {
            return currencyList[selectedCurrencyIndex]
        }
        return nil
    }

    func prepareCurrencyNameList() {
        currencyList = [CurrencyData]()
        currencyNamesList = [String]()

        currencyList = currencyRepo.getCurrency()

        for currency in currencyList {
            currencyNamesList.append(currency.title)
        }
    }

    func isValidForAdd() -> (Bool, String) {
        if name.isEmpty {
            return (false, "Please input title.")
        }
        if getSelectedCurrency() == nil {
            return (false, "Please choose currency.")
        }

        return (true, "")
    }

    func resetValues() {
        name = ""
        initialAmount = "0.0"
        selectedCurrencyIndex = 0
    }
}
