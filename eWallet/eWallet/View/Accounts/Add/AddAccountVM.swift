//
//  AddAccountVM.swift
//  eWallet
//
//  Created by Habibur Rahman on 31/5/24.
//

import Combine
import Foundation

class AddAccountVM: ObservableObject {
    private var accountRepo: AccountDataRepository

    @Published var name: String = ""
    @Published var initialAmount: String = "0.0"

    @Published var alertModel = AlertDataUtils.alertDmmyDataSingleButton
    @Published var showingAlert = false
    @Published var isAccountCreated = false

    @Published var isAddCurrencyPressed: Bool = false
    @Published var selectedCurrency: CurrencyData?

    private var cancellables = Set<AnyCancellable>()


    init() {
        accountRepo = AccountDataRepository.shared(accountRepo: CDAccountRepository())
    }

    func createAccount() {
        let (isValid, message) = isValidForAdd()

        if isValid == false {
            AlertDataUtils.getAlertDatafrom(alertData: &alertModel, message: message, alertType: .failure, positiveButtonTitle: "Ok", negativeButtonTitle: "")
            showingAlert = true
            return
        }

        guard let currencyData = selectedCurrency else {
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
    

    func isValidForAdd() -> (Bool, String) {
        if name.isEmpty {
            return (false, "Please input title.")
        }
        if selectedCurrency == nil {
            return (false, "Please choose currency.")
        }

        return (true, "")
    }

    func resetValues() {
        name = ""
        initialAmount = "0.0"
    }
}
