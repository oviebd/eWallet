//
//  AccountViewModel.swift
//  eWallet
//
//  Created by Habibur Rahman on 28/5/24.
//

import Foundation


class AccountViewModel : ObservableObject {
    
    var repository = CDAccountRepository()
    var currencyRepo = CDCurrencyRepository()
    
    @Published var name: String = ""
  //  @Published var currencyName: String = ""
    @Published var initialAmount : String = ""
    
    @Published var currencyNamesList = [String]()
    var currencyList : [CurrencyData] = [CurrencyData]()
    
    init() {
        let _ = getAccount()
        prepareCurrencyNameList()
    }
    
    func getAccount() -> [AccountData] {
        return repository.getAccounts()
    }
    
    func createAccount() {
        let amountInDouble = Double(initialAmount) ?? 0.0
        let account = AccountData(title: name, amount: amountInDouble)
        let _ =  repository.addAccount(account: account)
        let _ = getAccount()
    }
    
    func prepareCurrencyNameList(){
        currencyList.removeAll()
        currencyList = currencyRepo.getCurrency()
      
        for currency in currencyList{
            currencyNamesList.append(currency.title)
        }
    }
}
