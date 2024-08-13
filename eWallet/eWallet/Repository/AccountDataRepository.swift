//
//  AccountDataRepository.swift
//  eWallet
//
//  Created by Habibur Rahman on 31/5/24.
//

import Foundation

struct AccountData: Hashable, Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var currencyData: CurrencyData?
    var amount: Double
}

protocol AccountDataRepoProtocol {
    func getAccounts() -> [AccountData]
    func addAccount(account: AccountData) -> Bool
    func updatedAccount(account: AccountData?) -> Bool
    func getAccountEntityFromID(id: String) -> AccountEntity?
    
    func AddAmount(amount : Double, id : String) -> Bool
    func RemoveAmount(amount : Double, id : String) -> Bool
}

class AccountDataRepository {
    private static var sharedInstance: AccountDataRepository!

    var accountRepo: AccountDataRepoProtocol
    @Published var accountList = [AccountData]()

    private init(accountRepo: AccountDataRepoProtocol) {
        self.accountRepo = accountRepo
    }

    static func shared(accountRepo: AccountDataRepoProtocol) -> AccountDataRepository {
        if sharedInstance == nil {
            sharedInstance = AccountDataRepository(accountRepo: accountRepo)
        } else {
            sharedInstance.accountRepo = accountRepo
        }

        return sharedInstance
    }

    func getAccounts() -> [AccountData] {
        accountList = accountRepo.getAccounts()
        return accountList
    }

    func addAccount(account: AccountData) -> Bool {
        let isSuccess = accountRepo.addAccount(account: account)
        if isSuccess {
            let _ = getAccounts()
        }
        return isSuccess
    }
    
    func updateAccount(account: AccountData?) -> Bool {
        let isSuccess = accountRepo.updatedAccount(account: account)
        if isSuccess {
            let _ = getAccounts()
        }
        return isSuccess
    }
    
    func getAccountEntityFromId(id : String) -> AccountEntity? {
       return accountRepo.getAccountEntityFromID(id: id)
    }
    
    func AddAmount(amount : Double, id : String) -> Bool {
        return accountRepo.AddAmount(amount: amount, id: id)
    }
    
    func RemoveAmount(amount : Double, id : String) -> Bool {
        return accountRepo.AddAmount(amount: amount, id: id)
    }
    
    
}
