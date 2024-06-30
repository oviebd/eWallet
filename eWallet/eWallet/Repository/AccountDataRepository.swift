//
//  AccountDataRepository.swift
//  eWallet
//
//  Created by Habibur Rahman on 31/5/24.
//

import Foundation

struct AccountData : Hashable , Identifiable{
    var id: String  = UUID().uuidString
    var title: String
    var currencyData : CurrencyData?
    var amount: Double
}

protocol AccountDataRepoProtocol{
    func getAccounts() -> [AccountData] 
    func addAccount(account: AccountData) -> Bool
}

struct AccountDataRepository {
   
    var accountRepo : AccountDataRepoProtocol
    var accounts = [AccountData]()
    
    init(accountRepo: AccountDataRepoProtocol) {
        self.accountRepo = accountRepo
    }
    
    mutating func getAccounts() -> [AccountData] {
        accounts = accountRepo.getAccounts()
       return accounts//accountRepo.getAccounts()
    }
    
    func addAccount(account: AccountData) -> Bool {
        return accountRepo.addAccount(account: account)
    }
    
}
