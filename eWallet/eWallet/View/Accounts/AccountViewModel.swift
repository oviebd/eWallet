//
//  AccountViewModel.swift
//  eWallet
//
//  Created by Habibur Rahman on 28/5/24.
//

import Foundation


class AccountViewModel : ObservableObject {
    
    var repository = CDAccountRepository()
    
    @Published var name: String = ""
    @Published var currencyName: String = ""
    @Published var initialAmount: String = ""
    
    init() {
        getAccount()
    }
    
    func getAccount() -> [AccountData] {
        return repository.getAccounts()
    }
    
    func createAccount() {
        let account = AccountData(title: "Finance", amount: 100.00)
        repository.addAccount(account: account)
        getAccount()
    }
}
